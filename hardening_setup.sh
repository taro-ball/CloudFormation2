#!/bin/bash -xe

## d1 (disable iptables and firewalld):
    systemctl stop iptables
    systemctl stop firewalld
    systemctl disable iptables
    systemctl disable firewalld

## d2 (disable su):
    echo "auth requisite  pam_deny.so" > /etc/pam.d/su

## d3 timezone/ntp setup
    timedatectl set-timezone Pacific/Auckland
    timedatectl set-local-rtc 0

    # comment out public pool:
    sed -i 's/pool 2.amazon/# pool 2.amazon/g' /etc/chrony.conf

    # deny local ntp servers:
    echo -e "\ndeny 127.0.0.1\ndeny ::1\n" >> /etc/chrony.conf
    systemctl restart chronyd