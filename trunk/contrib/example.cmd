#Inter-|   Receive                                                |  Transmit
# face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed
#    lo:110212832  309617    0    0    0     0          0         0 110212832  309617    0    0    0     0       0          0
#  eth1:1747279737  192552   78   78    0     0          0         0 112715735  126681    0    1    0     0       0          0

command [ net_pkt_in ] = check_generic -n "net_pkt_in" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | awk -F: '{print \$2}' | awk '{print \$2}'" -w '>1000' -c '>2000' -y delta -p "pkt_in"
command [ net_pkt_out ] = check_generic -n "net_pkt_out" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | awk -F: '{print \$2}' | awk '{print \$10}'" -w '>1000' -c '>2000' -y delta -p "pkt_out"
command [ net_bytes_in ] = check_generic -n "net_bytes_in" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | awk -F: '{print \$2}' | awk '{print \$1}'" -w '>1000000' -c '>2000000' -y delta -p "bytes_in"
command [ net_bytes_out ] = check_generic -n "net_bytes_out" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev| awk -F: '{print \$2}' | awk '{print \$9}'" -w '>1000000' -c '>2000000' -y delta -p "bytes_out"
command [ net_errs_in ] = check_generic -n "net_errs_in" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev | sed 's/^.*\$IF://' | awk '{print \$3}'" -w '>5' -c '>10' -y delta -p "errs_in"
command [ net_errs_out ] = check_generic -n "net_errs_out" -e "IF=`awk '\$2 == "00000000" {print \$1}' /proc/net/route`; grep \$IF /proc/net/dev| sed 's/^.*\$IF://' | awk '{print \$11}'" -w '>5' -c '>10' -y delta -p "errs_out"
#
command [ proc_meminfo_memfree ] =	check_generic -n "proc_meminfo_memfree" -e "grep -i memfree /proc/meminfo | awk '{print \$2}'" -w '<5000' -c '<2000' -p "free_KB"
command [ proc_meminfo_swapinuse ] =	check_generic -n "proc_meminfo_swapinuse" -e "grep -i swapcached /proc/meminfo | awk '{print \$2}'" -w '>50000' -c '>100000' -p "swap_KB"
command [ proc_meminfo_dirty ] =	check_generic -n "proc_meminfo_dirty"   -e "grep -i dirty /proc/meminfo | awk '{print \$2}'" -w '>50000' -c '>100000' -p "dirty_KB"
#
command [ proc_stat_intr ] =		check_generic -n "proc_stat_intr" -e "grep -i intr /proc/stat | awk '{print \$2}'" -w '>500' -c '>1000' -y delta -p "intr"
command [ proc_stat_context ] =		check_generic -n "proc_stat_context" -e "grep -i ctxt /proc/stat | awk '{print \$2}'" -w '>1000' -c '>2000' -y delta -p "ctxt"
command [ proc_stat_blocked_by_io ] =	check_generic -n "proc_stat_blocked_by_io" -e "grep -i procs_blocked /proc/stat | awk '{print \$2}'" -w '>3' -c '>5' -y delta -p "procs"
#
command [ proc_driver_rtc ] =		check_generic -n "proc_driver_rtc" -e "grep -i batt_status /proc/driver/rtc | awk '{print \$3}'" -c '!~/okay/'
#
command [ proc_acpi_cpu_temperature ] = check_generic -n "proc_acpi_cpu_temperature" -e "awk '{print \$2}' /proc/acpi/thermal_zone/*/temperature" -w '>70' -c '>80' -p "celsius"
