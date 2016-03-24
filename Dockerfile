FROM       ubuntu:latest
MAINTAINER Mayur Ahir "https://github.com/ahirmayur"

ENV LANG C.UTF-8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get install -y -q libreadline6 libreadline6-dev software-properties-common sudo apt-utils sudo

RUN add-apt-repository -y ppa:git-core/ppa

RUN apt-get update
RUN apt-get -y -q dist-upgrade

RUN apt-get install -y -q openssh-server vim wget curl htop git-core zip unzip

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN sed -ri 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc
RUN source /root/.bashrc

RUN apt-get autoremove && apt-get autoclean

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
