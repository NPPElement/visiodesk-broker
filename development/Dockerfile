# Pull base image.
FROM debian:buster-slim

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get -y update \
 && apt-get -y install \
      nginx \
      wget \
      libssl-dev \
      build-essential \
      gdb \
      zlib1g-dev \
      libpq-dev \
      postgresql-server-dev-all \
      build-essential \
      gcc \
      make \
      cmake \
      cmake-gui \
      cmake-curses-gui \
      git \
      doxygen \
      graphviz \
      libssl-dev \
      mc \
      openssh-server

RUN apt-get clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN sed -i "0,/nginx/s/nginx/docker-nginx/i" /usr/share/nginx/html/index.html
RUN git clone "https://github.com/eclipse/paho.mqtt.c.git" /opt/paho/paho.mqtt.c \
&& git clone "https://github.com/eclipse/paho.mqtt.cpp.git" /opt/paho/paho.mqtt.cpp \
&& cmake /opt/paho/paho.mqtt.c \
      -Bbuild -H. -DPAHO_WITH_SSL=ON \
      --build build/ --target install 
#&& cp -P build/src/libpaho*.* /usr/local/lib \
#      build/src/libpaho*.* /usr/lib64 \
#&& ldconfig \
#
#&& cmake /opt/paho/paho.mqtt.cpp \ 
#      -Bbuild -H. -DPAHO_BUILD_DOCUMENTATION=TRUE -DPAHO_BUILD_SAMPLES=TRUE \
#      --build build/ --target install \
#&& ldconfig

EXPOSE 22

# Set environment variables.
# ENV HOME /root

# Define working directory.
# WORKDIR /root

CMD [ "nginx" ]