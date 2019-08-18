#!/bin/bash

echo "root:$password" | chpasswd

while :; do
	/usr/sbin/sshd -D -e
done
