ip link set dev eth0 up
ip a flush dev eth0
dhclient
sleep infinity
