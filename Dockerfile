FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y build-essential nodejs dropbear

ADD start /start
ADD src/ /src
ADD syncthing-linux-arm-v0.10.30.tar.gz /
RUN mv syncthing-linux-arm-v0.10.30 syncthing

#RUN /syncthing/syncthing -generate="/syncthing/syncthingHome"

RUN chmod a+x /start

RUN cd /src && npm install

EXPOSE 8080

CMD bash /start
