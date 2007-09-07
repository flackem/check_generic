# 
# Nagios Stats 3.0b1
# Copyright (c) 2003-2007 Ethan Galstad (www.nagios.org)
# Last Modified: 07-31-2007
# License: GPL
# 
# CURRENT STATUS DATA
# ------------------------------------------------------
# Status File:                            /usr/local/nagios/var/status.dat
# Status File Age:                        0d 0h 0m 2s
# Status File Version:                    3.0b1
# 
# Program Running Time:                   0d 0h 8m 12s
# Nagios PID:                             24100
# Used/High/Total Command Buffers:        0 / 1 / 4096
# 
# Total Services:                         14
# Services Checked:                       14
# Services Scheduled:                     14
# Services Actively Checked:              14
# Services Passively Checked:             0
# Total Service State Change:             0.000 / 34.280 / 4.498 %
# Active Service Latency:                 0.000 / 0.250 / 0.133 sec
# Active Service Execution Time:          0.025 / 4.084 / 0.596 sec
# Active Service State Change:            0.000 / 34.280 / 4.498 %
# Active Services Last 1/5/15/60 min:     14 / 14 / 14 / 14
# Passive Service State Change:           0.000 / 0.000 / 0.000 %
# Passive Services Last 1/5/15/60 min:    0 / 0 / 0 / 0
# Services Ok/Warn/Unk/Crit:              8 / 4 / 0 / 2
# Services Flapping:                      0
# Services In Downtime:                   0
# 
# Total Hosts:                            2
# Hosts Checked:                          2
# Hosts Scheduled:                        2
# Hosts Actively Checked:                 2
# Host Passively Checked:                 0
# Total Host State Change:                0.000 / 0.000 / 0.000 %
# Active Host Latency:                    0.000 / 1.779 / 0.889 sec
# Active Host Execution Time:             4.032 / 4.047 / 4.040 sec
# Active Host State Change:               0.000 / 0.000 / 0.000 %
# Active Hosts Last 1/5/15/60 min:        2 / 2 / 2 / 2
# Passive Host State Change:              0.000 / 0.000 / 0.000 %
# Passive Hosts Last 1/5/15/60 min:       0 / 0 / 0 / 0
# Hosts Up/Down/Unreach:                  2 / 0 / 0
# Hosts Flapping:                         0
# Hosts In Downtime:                      0
# 
# Active Host Checks Last 1/5/15 min:     10 / 51 / 87
#    Scheduled:                           1 / 8 / 15
#    On-demand:                           6 / 29 / 47
#    Parallel:                            7 / 38 / 62
#    Serial:                              0 / 0 / 0
#    Cached:                              3 / 14 / 25
# Passive Host Checks Last 1/5/15 min:    0 / 0 / 0
# Active Service Checks Last 1/5/15 min:  45 / 227 / 361
#    Scheduled:                           45 / 227 / 361
#    On-demand:                           0 / 0 / 0
#    Cached:                              0 / 0 / 0
# Passive Service Checks Last 1/5/15 min: 0 / 0 / 0
# 
# External Commands Last 1/5/15 min:      0 / 0 / 0
# 
# 
command [ nagios_services_number ] = check_generic -n nagios_services_number -e "/usr/local/nagios/bin/nagiostats -m -d NUMSERVICES" -w ">1800" -c ">2000" -p "service_checks_number"
command [ nagios_services_checks ] = check_generic -n nagios_services_checks -e "/usr/local/nagios/bin/nagiostats -m -d NUMACTSVCCHECKS1M" -w ">300" -c ">500" -p "service_checks_/_min"
command [ nagios_services_latency ] = check_generic -n nagios_services_latency -e "/usr/local/nagios/bin/nagiostats -m -d AVGACTSVCLAT" -w ">30000" -c ">60000" -p "ms_average"

command [ nagios_hosts_number ] = check_generic -n nagios_hosts_number -e "/usr/local/nagios/bin/nagiostats -m -d NUMHOSTS" -w ">400" -c ">500" -p "host_checks_number"
command [ nagios_hosts_checks ] = check_generic -n nagios_hosts_checks -e "/usr/local/nagios/bin/nagiostats -m -d NUMHSTACTCHK1M" -w ">100" -c ">200" -p "host_checks_/_min"
command [ nagios_hosts_latency ] = check_generic -n nagios_hosts_latency -e "/usr/local/nagios/bin/nagiostats -m -d AVGACTHSTLAT" -w ">30000" -c ">60000" -p "ms_average"
