# WiFi connectivity test (and reconnect if needed)
# Source: https://feriman.com/automatically-reconnect-to-wifi-on-raspberry-pi/
#
# Check the connectivity
if ! ping -c2 8.8.8.8 > /dev/null; then
    ifconfig wlan0 down
    sleep 5
    ifconfig wlan0 up
    sleep 10
fi
