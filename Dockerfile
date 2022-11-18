# DockerFile

# ----- ----- ----- ----- -----
# Using Alpine base image
FROM alpine:latest

USER root

RUN apk update
RUN apk upgrade

RUN mkdir -p /data
COPY ./plugins/ /data/

RUN mkdir -p /java
COPY .jdk*.tar.gz /java/
RUN tar -zxvf jdk*.tar.gz
RUN ln -s /java/jdk*/ /java/current
RUN export JAVA_HOME=/java/current
RUN export PATH=$PATH:$JAVA_HOME/bin
RUN sh /etc/profile.d/java.sh
RUN apk add paxctl
RUN cd /java/jdk*/
RUN paxctl -c javac; paxctl -m javac

COPY .*.jar /data
RUN mv /data/*.jar /data/paper.jar
RUN echo eula=true > /data/eula.txt

EXPOSE 25565

CMD ["java -Xms4G -Xmx4G -jar /data/paper.jar --nogui"]
