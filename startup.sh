
#!/bin/bash

# prepare ssh server
ROOT_PWD=myadmin
echo 'root:'${ROOT_PWD} | chpasswd
mkdir -p /var/run/sshd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri "s/^Port\s+.*/Port 22/" /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# start up supervisord, all daemons should launched by supervisord.
/usr/bin/supervisord -c /root/supervisord.conf

# start a shell
/bin/bash
