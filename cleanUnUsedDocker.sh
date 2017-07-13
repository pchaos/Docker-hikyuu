#!/bin/bash
echo cleaing ..............................

docker rm -v $(docker ps -a -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)
docker run -d -v /var/run/docker.sock:/var/run/docker.sock:rw  -v /var/lib/docker:/var/lib/docker:rw --restart=unless-stopped meltwater/docker-cleanup:latest

echo clean done
