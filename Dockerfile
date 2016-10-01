FROM resin/rpi-raspbian:jessie

MAINTAINER 1iveowl <liveowl@outlook.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list


# Installing the 'apt-utils' package gets rid of the 'debconf: delaying package configuration, since apt-utils is not installed'
# error message when installing any other package with the apt-get package manager.
RUN apt-get update

RUN apt-get upgrade -y
RUN apt-get install mono-complete -y
 
ENTRYPOINT /bin/bash
CMD /bin/bash
