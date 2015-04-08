FROM resin/rpi-raspbian

RUN apt-get update && apt-get install -y dropbear python python-dev python-pip

ADD start /start
ADD src/ /src
ADD syncthing-linux-arm-v0.10.30.tar.gz /
RUN mv syncthing-linux-arm-v0.10.30 syncthing

RUN chmod a+x /start

RUN pip install flask

EXPOSE 8080

CMD bash /start
