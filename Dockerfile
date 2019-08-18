FROM	debian:10-slim

RUN	apt update && apt -y install openssh-server

RUN	mkdir /run/sshd

ADD     sshd_config /etc/ssh/sshd_config
ADD	docker-run.sh /

EXPOSE	22

CMD	/docker-run.sh
