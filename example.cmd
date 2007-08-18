#Inter-|   Receive                                                |  Transmit
# face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed
#    lo:110212832  309617    0    0    0     0          0         0 110212832  309617    0    0    0     0       0          0
#  eth1:1747279737  192552   78   78    0     0          0         0 112715735  126681    0    1    0     0       0          0

command [ net_pkt_in ] = check_generic -n "net_pkt_in" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | sed 's/^.*\$IF://' | awk '{print \$2}'" -w '>1000' -c '>2000' -y delta
command [ net_pkt_out ] = check_generic -n "net_pkt_out" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | sed 's/^.*\$IF://' | awk '{print \$10}'" -w '>1000' -c '>2000' -y delta
command [ net_bytes_in ] = check_generic -n "net_bytes_in" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | sed 's/^.*\$IF://' | awk '{print \$1}'" -w '>1000000' -c '>2000000' -y delta
command [ net_bytes_out ] = check_generic -n "net_bytes_out" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev| sed 's/^.*\$IF://' | awk '{print \$9}'" -w '>1000000' -c '>2000000' -y delta
#
command [ proc_meminfo_memfree ] =	check_generic -n "proc_meminfo_memfree" -e "grep -i memfree /proc/meminfo | awk '{print \$2}'" -w '<5000' -c '<2000'
command [ proc_meminfo_swapinuse ] =	check_generic -n "proc_meminfo_swapinuse" -e "grep -i swapcached /proc/meminfo | awk '{print \$2}'" -w '>50000' -c '>100000'
command [ proc_meminfo_dirty ] =	check_generic -n "proc_meminfo_dirty"   -e "grep -i dirty /proc/meminfo | awk '{print \$2}'" -w '>50000' -c '>100000'
