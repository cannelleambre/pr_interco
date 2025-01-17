#!/bin/bash

ip link set dev eth0 up
dhclient eth0
sleep infinity 