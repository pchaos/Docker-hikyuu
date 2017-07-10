FROM ubuntu:16.04
MAINTAINER chaos "p19992003@gmail.com"
#安装中文和英文语言支持
RUN apt-get update --fix-missing && apt-get install -y language-pack-zh-hant language-pack-zh-hans language-pack-en apt-utils
run cat /etc/os-release
#设置时区和默认语言
ENV TZ Asia/Shanghai
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# install development environment
#RUN apt-get install -y build-essential git wget sudo vim
RUN apt-get install -y git vim
RUN git clone https://github.com/fasiondog/hikyuu.git
#RUN git clone https://git.oschina.net/fasiondog/hikyuu.git
EXIT

RUN conda
# modified  2017 07 08

# add user fashingdog
#RUN useradd fashingdog -m -p hikyuu && echo 'export PATH=/home/fashingdog/miniconda3/bin:$PATH'  > /etc/profile.d/conda.sh
RUN  echo 'export PATH=/opt/conda/bin:$PATH'  > /etc/profile.d/conda.sh && mkdir /home/fashingdog

#USER fashingdog

WORKDIR /home/fashingdog

# download Miniconda3
COPY conda3.sh /tmp/
#RUN  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  -O /tmp/Miniconda3.sh && bash /tmp/Miniconda3.sh -b && source ~/.bash_profile

RUN  bash /tmp/conda3.sh -b -p /opt/conda  && rm /tmp/conda3.sh

ENV PATH=/opt/conda/bin:$PATH

#RUN conda config --add channels conda-forge
RUN conda update -y conda

#RUN conda install -y pandas numpy mkl flask beautifulsoup4 requests ipython matplotlib lxml hdf5

#RUN conda install -y jupyter tushare

#ENTRYPOINT "export PATH=/opt/conda/bin:$PATH && conda update -y conda"

#conda install using environment.yml
COPY environment.yml /tmp/environment.yml
#RUN conda env create  -f /tmp/environment.yml && rm /tmp/environment.yml
#ENTRYPOINT ["source activate hikyuu"]

#tar -xzf ta-lib-0.4.0-src.tar.gz

RUN apt-get install -y locales locales-all
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
RUN  apt-get update -y

COPY ta-lib-0.4.0-src.tar.gz build_ta-lib.sh  /tmp/

# build ta-lib and install
RUN /tmp/build_ta-lib.sh && pip install ta-lib && rm /tmp/ta-lib-0.4.0-src.tar.gz /tmp/build_ta-lib.sh

RUN echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen
ENV LANGUAGE zh_CN.UTF-8
#download hikyuu
RUN git clone https://github.com/fasiondog/hikyuu.git

RUN apt-get install -y vim
#libboost-dev
#   libmysqlclient-dev mysql-server

ENV LANG en_US.UTF-8
CMD locale && date

# && rm -rf /var/lib/apt/lists/* && apt-get clean
