#!/bin/bash
ip route del default
ip addr del 10.2.27.242/24 dev enp3s0
ip route add default via 172.21.70.1
