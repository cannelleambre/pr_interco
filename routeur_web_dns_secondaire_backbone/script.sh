/usr/lib/frr/zebra -d &
/usr/lib/frr/ospfd -d &

echo "configure terminal
router ospf
router-id 1.1.1.5
network 120.0.84.128/25 area 0
exit
exit
write memory" | vtysh

sleep infinity
