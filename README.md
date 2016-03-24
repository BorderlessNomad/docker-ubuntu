# Base Docker Image

Ubuntu latest version with SSH support

## Base for these containers:

* [ahirmayur/ubuntu-dev](https://github.com/ahirmayur/docker-ubuntu-dev)
* [ahirmayur/nginx-php7](https://github.com/ahirmayur/docker-nginx-php)
* [ahirmayur/phpmyadmin](https://github.com/ahirmayur/docker-phpmyadmin)

## Installation
```
$ docker build -t ahirmayur/ubuntu .
$ docker run -d -p 22 ahirmayur/ubuntu
5f1b7a6404c8

$ docker port 5f1b7a6404c8 22
0.0.0.0:32771

$ ssh root@localhost -p 32771 # when promoted for password enter 'root' (without quotes)
```