FROM	debian:10-slim as build

RUN	apt-get update				&& \
	apt-get -y install openssh-server	&& \
	mkdir /run/sshd

COPY	sshd_config /etc/ssh/sshd_config
COPY	docker-run.sh /

FROM    scratch
COPY    --from=build / /

EXPOSE	22

CMD	/docker-run.sh
