# Docker-hikyuu
using docker build hikyuu

## 基于fasiondog的hikyuu搭建hikyuu环境。

本docker 基于ubuntu 16.04构建，安装了gcc相关开发包、Anaconda3-4.4.0-Linux-x86_64、boost 1.64、log4cplus 1.2.1等相关资源

## 本文件在linux环境下测试（windows下不能保障,需要修改相应的脚本）

## 安装前请确认已配置好docker环境。 docker image保存目录建议有20G以上磁盘剩余空间

## 安装步骤：

 *   下载： git clone https://github.com/pchaos/Docker-hikyuu.git

 *   cd Docker-hikyuu

 *   ./build.sh （或 sudo ./build.sh)

上面最后一步需要用到网络在线安装需要的资源，可能会需要几个小时完成。
编译完成后的hikyuu主目录在docker中的 /home/fasiondog/hikyuu

## 安装完成后，运行：

 *   ./start.sh （或 sudo ./start.sh   不使用sudo运行docker参见： https://docs.docker.com/engine/installation/linux/linux-postinstall/）
 *   在docker中输入 jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root ，
 *   浏览器（docker之外的主系统）中输入 127.0.0.1：8888， 即可使用jupyter


***感谢制作docker过程中fasiondog的鼎力支持。***


--------------------------------------------------
### Docker基础技术
* http://coolshell.cn/articles/17010.html
* http://coolshell.cn/articles/17029.html
* Docker文档整理与汇总  http://www.jianshu.com/p/7e4796cd35a0

## remarks:

To run Docker, your machine must have a 64-bit operating system running Windows 7 or higher. Additionally, you must make sure that virtualization is enabled on your machine.

* https://docs.docker.com/toolbox/toolbox_install_windows/#step-2-install-docker-toolbox


Tip: Get permission denied when running docker commands?
If you get an error like this when running docker commands:
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
and you can work around it by running 'sudo docker', your user might not be in the docker group. You should avoid running sudo whenever possible, as it runs (possibly unsafe) programs with superuser privileges. Try running the following:

sudo usermod -aG docker $USER

After you log out and log back in, you should be able to run docker commands as your own user (ie. without 'sudo').
