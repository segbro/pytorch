FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

RUN apt-get update
RUN apt-get -y install libglib2.0-dev
RUN apt-get -y install libsm6
RUN apt-get -y install libxrender1
RUN apt-get -y install libxext-dev
RUN apt -y --fix-broken install
RUN apt -y install libgl1-mesa-glx

pip install -U openmim
mim install mmengine
mim install mmcv==2.1.0
pip install pycocotools
pip install shapely
pip install terminaltables
pip install scipy
