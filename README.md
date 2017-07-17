# Docker-hikyuu
using docker build hikyuu

##基于fasiondog的hikyuu搭建hikyuu环境

##本文件在linux环境下测试（windows下不能保障,需要修改相应的脚本）

##安装前请确认已配置好docker环境。

##安装步骤：

 *   下载： git clone https://github.com/pchaos/Docker-hikyuu.git

 *   cd Docker-hikyuu

 *   buildName='hikyuu:hikyuutest' && docker build -t=$buildName .

上面最后一步需要用到网络在线安装需要的资源，可能会需要几个小时完成。

##安装完成后，运行：

   ./start.sh


感谢制作docker过程中fasiondog的鼎力支持。


--------------------------------------------------
git add Dockerfile README.md build.sh cleanUnUsedDocker.sh sh/10_SetUpBasicEnvironment.sh sh/15_buildboost.sh sh/20_build_talib.sh sh/25_buildlog4plus.sh sh/30_buildhikyuu.sh start.sh

