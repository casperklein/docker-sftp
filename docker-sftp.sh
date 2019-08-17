#!/bin/bash

PASSWORD='!insecure!'
PORT=222

docker run --rm -it -v $(pwd):/mnt -p $PORT:22 --env password="$PASSWORD" casperklein/sftp
