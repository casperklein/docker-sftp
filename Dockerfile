FROM	debian:10-slim

RUN	apt-get update				&& \
	apt-get -y install openssh-server	&& \
	mkdir /run/sshd

ADD	sshd_config /etc/ssh/sshd_config
ADD	docker-run.sh /

EXPOSE	22

CMD	/docker-run.sh
