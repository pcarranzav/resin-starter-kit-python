FROM resin/rpi-raspbian:wheezy

# Install Dropbear.
RUN apt-get update && apt-get install dropbear

ADD start /start

RUN mkdir -p syncthing/syncthingHome
ADD syncthing-linux-arm-v0.10.30.tar.gz /syncthing/
# So ADD already untars...
#RUN tar xvzf /syncthing/syncthing-linux-arm-v0.10.30.tar.gz -C syncthing
RUN /syncthing/syncthing -generate="/syncthing/syncthingHome" | grep "Device ID" > syncthingID.txt

RUN chmod a+x /start

EXPOSE 8080

CMD /start
