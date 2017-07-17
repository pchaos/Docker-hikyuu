# Docker-hikyuu
using docker build hikyuu

## 基于fasiondog的hikyuu搭建hikyuu环境。

本docker 基于ubuntu 16.04构建，安装了gcc相关开发包、Anaconda3-4.4.0-Linux-x86_64、boost 1.64、log4cplus 1.2.1等相关资源

## 本文件在linux环境下测试（windows下不能保障,需要修改相应的脚本）

## 安装前请确认已配置好docker环境。

## 安装步骤：

 *   下载： git clone https://github.com/pchaos/Docker-hikyuu.git

 *   cd Docker-hikyuu

 *   ./build.sh （或 sudo ./build.sh)

上面最后一步需要用到网络在线安装需要的资源，可能会需要几个小时完成。

## 安装完成后，运行：

 *   ./start.sh （或 sudo ./start.sh）
 * 输入 jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root ，在浏览器中输入 127.0.0.1：8888， 即可使用jupyter

感谢制作docker过程中fasiondog的鼎力支持。


--------------------------------------------------
git add Dockerfile README.md build.sh cleanUnUsedDocker.sh sh/10_SetUpBasicEnvironment.sh sh/15_buildboost.sh sh/20_build_talib.sh sh/25_buildlog4plus.sh sh/30_buildhikyuu.sh start.sh

To run Docker, your machine must have a 64-bit operating system running Windows 7 or higher. Additionally, you must make sure that virtualization is enabled on your machine.

https://docs.docker.com/toolbox/toolbox_install_windows/#step-2-install-docker-toolbox
