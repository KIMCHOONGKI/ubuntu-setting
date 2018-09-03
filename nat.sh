#!/bin/bash
ip addr add 10.2.27.242/24 dev enp3s0
ip route del default
ip route add default via 10.2.27.1
