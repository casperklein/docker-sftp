# docker-sftp

## Serve files in current directory via SFTP

    PASSWORD='!insecure!"
    PORT=222

    docker run --rm -it -v $(pwd):/mnt -p $PORT:22 --env password="$PASSWORD" casperklein/sftp

## Connect to SFTP
    HOST=localhost
    sftp -P 222 root@"$HOST"
