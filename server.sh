#!/bin/bash -eu

root=`pwd`/`dirname $0`
docker build -t apidoc $root/docker
docker run -p 4567:4567 -v $root/source:/slate/source -v $root/build:/slate/build apidoc
