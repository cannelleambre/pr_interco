FROM debian:latest

RUN apt-get update && apt-get install -y \
  iptables iproute2 net-tools systemd systemd-sysv telnet nano iputils-ping tcpdump \
  isc-dhcp-client procps \
  && apt-get clean
