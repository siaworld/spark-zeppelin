FROM apache/zeppelin:0.8.1

ENV Z_VERSION="0.8.1"
ENV LOG_TAG="[ZEPPELIN_${Z_VERSION}]:" \
    Z_HOME="/zeppelin" \
    LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    ZEPPELIN_ADDR="0.0.0.0"

ENV ZEPPELIN_NOTEBOOK_DIR="/notebook"

RUN wget http://apache.mirror.triple-it.nl/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz \
&&  tar -xzf spark-2.4.4-bin-hadoop2.7.tgz \
&&  mv spark-2.4.4-bin-hadoop2.7 /opt/spark
ENV SPARK_HOME=/opt/spark

RUN apt-get remove scala-library scala \
&&  wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.deb \
&&  dpkg -i scala-2.11.8.deb 

EXPOSE 8080

WORKDIR ${Z_HOME}
CMD ["bin/zeppelin.sh"]
