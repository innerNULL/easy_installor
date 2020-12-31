## build our image on top of Debian latest version
FROM debian:latest

WORKDIR /home/
COPY ./build.sh /home
RUN cd /home && bash build.sh

## expose for ssh
EXPOSE 22
## expose for spark use
EXPOSE 7000-8000
## expose for master webui
EXPOSE 8080
## expose for slave webui
EXPOSE 8081
