ipmitool -I lanplus -H 192.168.1.61 -U UserName -P Password raw 0x30 0x30 0x01 0x00
ipmitool -I lanplus -H 192.168.1.61 -U UserName -P Password raw 0x30 0x30 0x02 0xff 0xF
