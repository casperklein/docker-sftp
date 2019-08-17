FROM	debian:10-slim

RUN	apt update && apt -y install openssh-server

RUN	mkdir /run/sshd

RUN	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
	echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config && \
	echo "ChrootDirectory /mnt/" >> /etc/ssh/sshd_config

ADD	docker-run.sh /

EXPOSE	22

CMD	/docker-run.sh
