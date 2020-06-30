# docker-sftp

![Version][version-shield]
![Supports amd64 architecture][amd64-shield]
![Supports aarch64 architecture][aarch64-shield]
![Supports armhf architecture][armhf-shield]
![Supports armv7 architecture][armv7-shield]
![Docker image size][image-size-shield]

## Share files in current directory via SFTP

    PASSWORD='!insecure!'
    PORT=222

    docker run --rm -it -v $PWD:/mnt -p $PORT:22 -e password="$PASSWORD" casperklein/sftp

### Alias

    alias sftphere='docker run --rm -it -v $PWD:/mnt -p 222:22 -e password="!insecure!" casperklein/sftp'

## Connect to SFTP service

    HOST=localhost
    PORT=222

    sftp -P $PORT root@"$HOST"

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-blue.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-blue.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-blue.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-blue.svg
[version-shield]: https://img.shields.io/github/v/release/casperklein/docker-sftp
[image-size-shield]: https://img.shields.io/docker/image-size/casperklein/sftp/latest
