FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

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
RUN mim install "mmcv==2.0.0"
RUN pip install "mmsegmentation>=1.0.0"
RUN pip install "mmdet>=3.0.0"
RUN pip install xformers=='0.0.20' # optional for DINOv2
RUN pip install future tensorboard
RUN pip install numpy==1.26.4
RUN pip install ftfy
RUN pip install scipy
RUN pip install prettytable
RUN pip install matplotlib
RUN pip install regex
RUN pip install timm
RUN pip install einops
