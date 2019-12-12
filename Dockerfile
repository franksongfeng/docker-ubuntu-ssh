FROM ubuntu:16.04
MAINTAINER Feng Song <franksongfeng@yahoo.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV TIME_ZONE Asia/Shanghai

RUN apt-get update \
	&& apt-get install -y apt-utils tzdata net-tools iputils-ping ufw lsof curl wget \
		openssh-server vim-tiny \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "${TIME_ZONE}" > /etc/timezone && \ 
    ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ARG ROOT_PWD=myadmin
ARG PORT_SSH=22
RUN echo 'root:'${ROOT_PWD} | chpasswd
RUN mkdir -p /var/run/sshd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri "s/^Port\s+.*/Port ${PORT_SSH}/" /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    /usr/sbin/sshd -D

EXPOSE ${PORT_SSH}

ENTRYPOINT ["/bin/bash"]
