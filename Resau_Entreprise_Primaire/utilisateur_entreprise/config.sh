#!/bin/bash

ip link set dev eth0 up
ip a a 192.168.1.2/23 dev eth0

