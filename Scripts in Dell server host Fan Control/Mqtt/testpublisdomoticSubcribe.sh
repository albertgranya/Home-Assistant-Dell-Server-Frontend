#!/usr/bin/bash
Server=Mqtt Server HostName or IP
UserName=Mqtt UserName
Password=Mqtt password
Topic=XirguServer/Fan/Speed
value=$1 
mosquitto_pub -u $UserName -P $Password -h $Server -t $Topic -m $value

while :; do
  msg=$(mosquitto_sub -u $UserName -P $Password -h $Server -C 1 -t $Topic) 
  echo $msg
  echo "$msg Fan speed provided"
  case $msg in
    0)
        echo -n "Stopping fans..."
        /root/FanControl/Fan0.sh
        ;;
    5)
        echo -n "Fans 5%"
        /root/FanControl/Fan5.sh
        ;;
    10)
        echo -n "Fans 10%"
        /root/FanControl/Fan10.sh
        ;;
    15)
        echo -n "Fans 15%"
        /root/FanControl/Fan15.sh
        ;;
    20)
        echo -n "Fans 20%"
        /root/FanControl/Fan20.sh
        ;;
    50)
        echo -n "fans 50%"
        /root/FanControl/Fan50.sh
        ;;
    100)
        echo -n "Fans 100%"
        /root/FanControl/Fan100.sh
        ;;
    *)        
        # put fans manual
        ipmitool -I lanplus -H 192.168.1.61 -U UserName -P Password raw 0x30 0x30 0x01 0x00
        # put fans spin velocity
        ipmitool -I lanplus -H 192.168.1.61 -U UserName -P Password raw 0x30 0x30 0x02 0xff 0x"$msg"        
        
        ;;
    esac
  done


