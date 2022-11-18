# DockerFile

# ----- ----- ----- ----- -----
# Using Alpine base image
FROM openjdk:17-oracle

USER root

RUN mkdir -p /data/plugins
COPY ./plugins/* /data/plugins/

COPY ./*.jar /data/
RUN mv /data/*.jar /data/paper.jar
RUN echo eula=true > /data/eula.txt
RUN chmod -R 777 /data/*

WORKDIR /data/
EXPOSE 25565

CMD java -Xms4G -Xmx4G -jar /data/paper.jar --nogui
