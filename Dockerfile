FROM ubuntu:latest
VOLUME /tmp
ADD target/gs-spring-boot-docker-0.1.0.jar app.jar
RUN sh -c 'touch /app.jar' && \
	apt-get install --no-install-recommends -y software-properties-common && \
	add-apt-repository ppa:webupd8team/java && \
	apt-get update && \
	echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | /usr/bin/debconf-set-selections && \
	apt-get install --no-install-recommends -y oracle-java8-installer
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]


