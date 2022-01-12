#2 para construir el contenedor ejecutamos --> docker build -t dragondisk .
# usar la version de ubuntu 18.04
FROM ubuntu:18.04
# actulizar y instalar las actuliazaciones
RUN apt-get update && apt-get upgrade -y
# instalar las depencia para que funcione
RUN apt-get install -y \
        libqt4-network \
        libqt4-xml \
        libqtcore4 \
        libqtgui4 \
        libssl1.0-dev
# apt-get install libssl1.0-dev
#Decargamos el dragondisk
ADD http://www.s3-client.com/download-amazon-s3-client/dragondisk_1.0.5-0ubuntu_amd64.deb /opt/
# Lo instalamos en el docker
RUN dpkg -i /opt/dragondisk_1.0.5-0ubuntu_amd64.deb
# y lo ejecutamos
CMD /usr/bin/dragondisk
# luego debemos darle permiso a la maquina para que pueda ejecutar la aplicación
# en la terminal ejecutamos ->  xhost +
# y luego construimos la imagen
# docker run -d --name dragondiskFront -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/:/home/ dragondisk
# tenemos que ejcutar esto en para acceder al interior de docker
# docker exec -it dragondiskFront /bin/bash
# y ejecutar esto para que nos de imagen
# QT_X11_NO_MITSHM=1 dragondisk
