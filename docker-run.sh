#!/bin/bash

echo "root:$password" | chpasswd

while :; do
	/usr/sbin/sshd -D -d
done
