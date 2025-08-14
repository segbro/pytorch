FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

RUN apt-get update
RUN apt-get -y install libglib2.0-dev
RUN apt-get -y install libsm6
RUN apt-get -y install libxrender1
RUN apt-get -y install libxext-dev
RUN apt -y --fix-broken install
RUN apt -y install libgl1-mesa-glx

RUN pip install -U openmim
RUN mim install mmengine
RUN mim install mmcv==2.1.0
RUN pip install pycocotools
RUN pip install shapely
RUN pip install terminaltables
RUN pip install scipy
