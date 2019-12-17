FROM ubuntu:16.04
MAINTAINER Feng Song <franksongfeng@yahoo.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV TIME_ZONE Asia/Shanghai

RUN apt-get update \
	&& apt-get install -y apt-utils tzdata net-tools iputils-ping \
		vim-tiny \
		supervisor \
		openssh-server \
		xfce4 xfce4-goodies \
		x11vnc xvfb \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*


RUN echo "${TIME_ZONE}" > /etc/timezone && \ 
    ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

WORKDIR /root

ADD startup.sh ./
ADD supervisord.conf ./

EXPOSE 22

ENTRYPOINT ["./startup.sh"]
