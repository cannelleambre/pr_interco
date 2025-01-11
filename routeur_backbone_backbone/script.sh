/usr/lib/frr/zebra -d &
/usr/lib/frr/ospfd -d &

echo "configure terminal
router ospf
router-id 1.1.1.1
network 120.0.84.0/25 area 0
network 120.0.84.128/25 area 0
network 120.0.85.0/25 area 0
network 120.0.85.128/25 area 0
exit
exit
write memory" | vtysh

sleep infinity
