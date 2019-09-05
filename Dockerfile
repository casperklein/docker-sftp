ARG	FROM=debian:10-slim

FROM    $FROM as build

ENV	PACKAGES="openssh-server"

# Install openssh-server
RUN     apt-get update \
&&	apt-get -y install $PACKAGES

# Copy root filesystem
COPY	rootfs /

RUN	mkdir /run/sshd

# Build final image
RUN	apt-get -y install dumb-init \
&&	rm -rf /var/lib/apt/lists/*
FROM	scratch
COPY	--from=build / /
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

EXPOSE  22

CMD	["/run.sh"]
