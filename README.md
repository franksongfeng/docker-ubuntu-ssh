docker-ubuntu-ssh
=================

### From Docker Repository

``
$ docker pull franksongfeng/ubuntu-ssh
``

### Build yourself

``
$ git clone https://github.com/franksongfeng/docker-ubuntu-ssh.git
``

``
$ docker image build --rm -t franksongfeng/ubuntu-ssh docker-ubuntu-ssh
``

### Run

``
$ docker run -i -t -p 2222:22 franksongfeng/ubuntu-ssh
``


Trobleshooting
==============
You can find logs under /var/log/ in container.

