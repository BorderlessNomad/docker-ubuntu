# docker build -f ubuntu.dockerfile -t ahirmayur/ubuntu .
# docker run -d -p 22 ahirmayur/ubuntu
# $ docker port 35a3926b505d 22
# 0.0.0.0:32771
# ssh root@192.168.99.100 -p 32771
# password = root

FROM       ubuntu:latest
MAINTAINER Mayur Ahir "https://github.com/ahirmayur"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get install -y -q apt-utils sudo
RUN apt-get -y -q dist-upgrade

RUN apt-get install -y -q openssh-server vim wget curl htop
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN sed -ri 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc
RUN source /root/.bashrc

RUN apt-get autoremove && apt-get autoclean

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
