FROM openjdk:12-jdk-alpine
VOLUME /tmp
EXPOSE 8080

MAINTAINER sayana.shrestha@smoothstack.com

COPY target/utopiaAirline-0.0.1-SNAPSHOT.jar .

ENTRYPOINT java -jar utopiaAirline-0.0.1-SNAPSHOT.jar