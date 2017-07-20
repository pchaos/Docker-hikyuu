#!/bin/bash
echo 清理不用的docker磁盘空间
echo cleaing ..............................
echo .............................. 1
docker rm -v $(docker ps -a -q -f status=exited)
echo .............................. 2
docker rmi $(docker images -f "dangling=true" -q)
echo .............................. 3
docker run -d -v /var/run/docker.sock:/var/run/docker.sock:rw  -v /var/lib/docker:/var/lib/docker:rw meltwater/docker-cleanup:latest

#定时清理docker空间，会定时删掉所有用户docker image，。请谨慎使用
#docker run -d -v /var/run/docker.sock:/var/run/docker.sock:rw  -v /var/lib/docker:/var/lib/docker:rw --restart=unless-stopped meltwater/docker-cleanup:latest

echo .............................. clean done
