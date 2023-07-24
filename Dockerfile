FROM	debian:12-slim as build

ARG	PACKAGES="openssh-server dumb-init"

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

ARG	VERSION="unknown"

LABEL	org.opencontainers.image.description="Share files via SFTP"
LABEL	org.opencontainers.image.source="https://github.com/casperklein/docker-sftp/"
LABEL	org.opencontainers.image.title="docker-sftp"
LABEL	org.opencontainers.image.version="$VERSION"

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD	["/run.sh"]

EXPOSE	22

COPY	--from=build / /
