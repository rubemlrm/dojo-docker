#!/bin/bash
if ! ping -c2 8.8.8.8 > /dev/null; then
    ifconfig wlan0 down
    sleep 5
    ifconfig wlan0 up
    sleep 10
fi
