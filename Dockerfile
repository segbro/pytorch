FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

RUN apt-get update && apt-get install -y libgl1-mesa-glx libpci-dev curl nano psmisc zip git && apt-get --fix-broken install -y

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
