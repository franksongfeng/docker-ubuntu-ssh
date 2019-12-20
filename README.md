docker-ubuntu-ssh
=================

### Build image

``
$ git clone https://github.com/franksongfeng/docker-ubuntu-ssh.git
``

``
$ docker image build --rm -t ubuntu-ssh .
``

### Create custom bridge network

``
$ docker network create -d bridge --sub-net 172.20.0.0/16 custom-bridge`
``

### Run solo container with custom bridge network

``
$ docker container run -ti -m 2g --memory-swap -1 --name docker-ubuntu-ssh-1 --network custom-bridge --ip 172.20.0.10 -p 2222:22 ubuntu-ssh
``


Trobleshooting
==============
You can find logs under /var/log/ in container.

