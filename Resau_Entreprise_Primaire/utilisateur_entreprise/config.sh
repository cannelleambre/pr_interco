#!/bin/bash

ip link set dev eth0 up
ip a a 192.168.0.2/25 dev eth0

