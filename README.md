# docker-sftp

## Serve files in current directory via SFTP

    PASSWORD='!insecure!'
    PORT=222

    docker run --rm -it -v $(pwd):/mnt -p $PORT:22 --env password="$PASSWORD" casperklein/sftp

### Alias

    alias sftphere='docker run --rm -it -v $(pwd):/mnt -p 222:22 --env password="!insecure!" casperklein/sftp'

## Connect to SFTP service

    HOST=localhost
    PORT=222

    sftp -P $PORT root@"$HOST"
