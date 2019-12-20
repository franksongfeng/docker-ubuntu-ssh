FROM ubuntu:16.04
MAINTAINER Feng Song <franksongfeng@yahoo.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV TIME_ZONE Asia/Shanghai
ENV ROOT_PWD admin

RUN apt-get update \
	&& apt-get install -y apt-utils tzdata net-tools iputils-ping \
		vim-tiny \
		supervisor \
		openssh-server \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*


RUN echo "${TIME_ZONE}" > /etc/timezone && \ 
    ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

RUN echo 'root:'${ROOT_PWD} | chpasswd && \
    mkdir -p /var/run/sshd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri "s/^Port\s+.*/Port 22/" /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

WORKDIR /root

ADD startup.sh ./
ADD supervisord.conf ./

EXPOSE 22

ENTRYPOINT ["./startup.sh"]
