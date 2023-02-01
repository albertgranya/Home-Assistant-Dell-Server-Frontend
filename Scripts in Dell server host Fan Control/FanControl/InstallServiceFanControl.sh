#!/bin/bash
echo Installing/ Updating idracfan service !!
systemctl --no-block stop idracfan.service
echo cp /root/FanControl/idracfan.service /etc/systemd/system/idracfan.service
cp /root/FanControl/idracfan.service /etc/systemd/system/idracfan.service
sleep 1
#systemctl status idracfan.service
systemctl daemon-reload
systemctl --no-block enable idracfan.service
systemctl --no-block start idracfan.service
sleep 1
#systemctl status idracfan.service
echo idracfan started !!