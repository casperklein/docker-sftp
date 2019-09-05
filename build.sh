#!/bin/bash

USER=casperklein
NAME=sftp
TAG=latest

[ -n "$USER" ] && TAG=$USER/$NAME:$TAG || TAG=$NAME:$TAG

DIR=$(dirname "$(readlink -f "$0")") &&
cd "$DIR" &&
echo "Building: $TAG" &&
echo &&	
docker build -t $TAG .