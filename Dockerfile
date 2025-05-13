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
RUN wget https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz && \
    tar -xvf Python-3.8.5.tgz

# 编译&安装python
RUN cd Python-3.8.5 && \
    ./configure --enable-optimizations && \
    make && \
    make install

WORKDIR /workspace

RUN rm -r /temp && \
    ln -s /usr/local/bin/python3 /usr/local/bin/python && \
    ln -s /usr/local/bin/pip3 /usr/local/bin/pip

RUN pip install torch==1.7.1+cu110 torchvision==0.8.2+cu110 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip install -U openmim
RUN mim install mmcv-full==1.7.0
RUN pip install yapf==0.32.0
