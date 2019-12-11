# docker-sftp

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
