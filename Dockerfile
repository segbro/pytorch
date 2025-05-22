FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime

RUN apt-get update
RUN apt-get -y install libglib2.0-dev
RUN apt-get -y install libsm6
RUN apt-get -y install libxrender1
RUN apt-get -y install libxext-dev
RUN apt -y --fix-broken install
RUN apt -y install libgl1-mesa-glx

RUN pip install -U openmim
RUN mim install mmcv-full==1.7.0
RUN pip install yapf==0.32.0
