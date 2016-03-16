# docker build -f ubuntu-dev.dockerfile -t ahirmayur/ubuntu-dev .
# docker run -d -p 22 ahirmayur/ubuntu-dev
# $ docker port 35a3926b505d 22
# 0.0.0.0:32771
# ssh root@192.168.99.100 -p 32771
# password = root

FROM       ahirmayur/ubuntu
MAINTAINER Mayur Ahir "https://github.com/ahirmayur"

RUN apt-get install -y build-essential sudo ntpdate vim openssh-server gcc \
	curl git mercurial bzr make binutils bison wget axel \
	python-software-properties htop unzip dos2unix
RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y python g++ make nodejs

RUN npm install -g grunt-cli coffee-script bower forever pm2

RUN apt-get autoremove && apt-get autoclean
