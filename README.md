# Docker-hikyuu
using docker build hikyuu

本文件在linux环境下测试（windows下不能保障）

安装前请确认配置好docker环境

安装步骤：

  下载： git clone https://github.com/pchaos/Docker-hikyuu.git
  
  cd Docker-hikyuu
  
  buildName='hikyuu:hikyuutest' && docker build -t=$buildName .

上面最后一步需要用到网络在线安装需要的资源，可能会需要几个小时完成。

运行：

   docker run -i -t $buildName /bin/bash
   
