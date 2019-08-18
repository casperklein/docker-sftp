#!/bin/bash

echo "sftp:$password" | chpasswd

cd /etc/ssh

rm -f ssh_host_ecdsa_key ssh_host_rsa_key ssh_host_ed25519_key

ssh-keygen -q -f ssh_host_ecdsa_key   -N '' -t ecdsa   -b 521  # Max key size for ecdsa is 521
ssh-keygen -q -f ssh_host_rsa_key     -N '' -t rsa     -b 2048 # 2048 bits is considered sufficient.
ssh-keygen -q -f ssh_host_ed25519_key -N '' -t ed25519         # Ed25519 keys have a fixed length and the -b flag will be ignored.

echo "Fingerprints:"
echo
echo "ECDSA:   $(ssh-keygen -lf ssh_host_ecdsa_key -E md5)"
echo "ECDSA:   $(ssh-keygen -lf ssh_host_ecdsa_key)"
echo
echo "RSA:     $(ssh-keygen -lf ssh_host_rsa_key -E md5)"
echo "RSA:     $(ssh-keygen -lf ssh_host_rsa_key)"
echo
echo "ED25519: $(ssh-keygen -lf ssh_host_ed25519_key -E md5)"
echo "ED25519: $(ssh-keygen -lf ssh_host_ed25519_key)"
echo

while :; do
	/usr/sbin/sshd -D -e
done
