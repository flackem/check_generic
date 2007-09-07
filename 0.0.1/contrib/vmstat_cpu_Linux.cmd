#
# Command: vmstat -s (Linux)
#
#      1035436  total memory
#       904972  used memory
#       686616  active memory
#       169388  inactive memory
#       130464  free memory
#        73656  buffer memory
#       325196  swap cache
#      2097640  total swap
#        66108  used swap
#      2031532  free swap
#      4535329 non-nice user cpu ticks
#         8262 nice user cpu ticks
#      2201944 system cpu ticks
#     14836516 idle cpu ticks
#       516051 IO-wait cpu ticks
#        35923 IRQ cpu ticks
#        25366 softirq cpu ticks
#            0 stolen cpu ticks
#     54261431 pages paged in
#     29130122 pages paged out
#         7140 pages swapped in
#        33798 pages swapped out
#     85308757 interrupts
#    192699205 CPU context switches
#   1252070319 boot time
#      1159607 forks
#
# check_multi call: check_multi -f cpu.cmd -r 39
#
command [ cpu_idle ] = check_generic -n "cpu_idle" -e "vmstat -s | grep 'idle cpu ticks' | awk '{print \$1}'" -c '>99' -y delta -p "cpu_idle"
command [ cpu_iowait ] = check_generic -n "cpu_iowait" -e "vmstat -s | grep 'IO-wait cpu ticks' | awk '{print \$1}'" -c '>99' -y delta -p "cpu_iowait"
command [ cpu_irq ] = check_generic -n "cpu_irq" -e "vmstat -s | grep 'IRQ cpu ticks' | awk '{print \$1}'" -c '>99' -y delta -p "cpu_irq"
command [ cpu_system ] = check_generic -n "cpu_system" -e "vmstat -s | grep 'system cpu ticks' | awk '{print \$1}'" -c '>99' -y delta -p "cpu_system"
command [ cpu_non_nice_user ] = check_generic -n "cpu_non_nice_user" -e "vmstat -s | grep 'non-nice user cpu ticks' | awk '{print \$1}'" -c '>99' -y delta -p "cpu_non_nice_user"
command [ cpu_nice_user ] = check_generic -n "cpu_nice_user" -e "vmstat -s | grep '[^n][^-]nice user cpu ticks' | awk '{print \$1}'" -c '>99' -y delta -p "cpu_nice_user"
