docker-ubuntu-ssh
=================

### From Docker Repository

``
$ docker pull franksongfeng/docker-ubuntu-ssh
``

### Build yourself

``
$ git clone https://github.com/franksongfeng/docker-ubuntu-ssh.git
``

``
$ docker image build --rm -t franksongfeng/docker-ubuntu-ssh docker-ubuntu-ssh
``

### Run

``
$ docker run -i -t -p 2222:22 franksongfeng/docker-ubuntu-ssh
``


Trobleshooting
==============
You can find logs under /var/log/ in container.

