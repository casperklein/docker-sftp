FROM	debian:10-slim as build

ENV	PACKAGES="openssh-server dumb-init"

# Install openssh-server
RUN	apt-get update \
&&	apt-get -y upgrade \
&&	apt-get -y --no-install-recommends install $PACKAGES \
&&	rm -rf /var/lib/apt/lists/*

# Copy root filesystem
COPY	rootfs /

RUN	mkdir /run/sshd

# Build final image
FROM	scratch

ARG	VERSION
ENV	Version=$VERSION

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD	["/run.sh"]

EXPOSE	22

COPY	--from=build / /
