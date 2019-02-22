FROM tensorflow/tensorflow:latest-gpu-py3

RUN pip3 install --upgrade pip keras scikit-image sklearn
RUN apt-get install sudo

#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
