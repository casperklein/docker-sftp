#!/bin/bash

echo "root:$password" | chpasswd

while :; do
	/usr/sbin/sshd -d
done
