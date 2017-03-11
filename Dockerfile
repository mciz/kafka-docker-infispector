FROM jboss/base-jdk:7
MAINTAINER tsykora
ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.8.2.2
ENV KAFKA_HOME kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"
ENV KAFKA_OPT /opt/jboss/"$KAFKA_HOME"
ENV LOG_DIR /tmp/kafka-logs
ENV ADVERTISED_HOSTNAME=127.0.0.1

EXPOSE 2181 2888 3888 8084 
USER jboss
WORKDIR /opt/jboss

RUN 	curl http://mirror.nexcess.net/apache/kafka/"$KAFKA_VERSION"/"$KAFKA_HOME".tgz \
	| tar -xzf - -C /opt/jboss \
	&& mv "$KAFKA_OPT" /opt/jboss/kafka 

CMD ["/opt/jboss/kafka/bin/kafka-server-start.sh", "/opt/jboss/kafka/config/server.properties"]










