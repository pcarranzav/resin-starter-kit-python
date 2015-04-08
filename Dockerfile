FROM resin/rpi-node

# Install Dropbear.
RUN apt-get update && apt-get install dropbear

ADD start /start
ADD src/ /src
ADD syncthing-linux-arm-v0.10.30.tar.gz /
RUN mv syncthing-linux-arm-v0.10.30 syncthing

#RUN /syncthing/syncthing -generate="/syncthing/syncthingHome"

RUN chmod a+x /start

EXPOSE 8080

CMD bash /start
