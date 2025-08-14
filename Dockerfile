FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

# 安装基础包
RUN apt update && \
    apt install -y \
        wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
        libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /temp

# 下载python
RUN wget https://www.python.org/ftp/python/3.9.10/Python-3.9.10.tgz && \
    tar -xvf Python-3.9.10.tgz

# 编译&安装python
RUN cd Python-3.9.10 && \
    ./configure --enable-optimizations && \
    make && \
    make install

WORKDIR /workspace

RUN rm -r /temp && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip

RUN pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2
RUN pip install -U openmim
RUN mim install mmengine
RUN mim install mmcv==2.1.0
RUN pip install pycocotools
RUN pip install shapely
RUN pip install terminaltables
RUN pip install scipy
