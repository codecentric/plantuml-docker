FROM openjdk:17-jdk-alpine3.14
LABEL maintainer="Daniel Kocot <daniel.kocot@codecentric.de>" \
      description="Internal Docker image for PlantUML"

ENV PLANTUML_VERSION 1.2021.16

RUN apk update && \
    apk add --no-cache graphviz git wget ca-certificates ttf-dejavu fontconfig && \
    apk add --no-cache bash && \
    wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
    apk del wget ca-certificates

WORKDIR /plantuml

ENTRYPOINT [ "java", "-Djava.awt.headless=true", "-jar", "/opt/plantuml/plantuml.jar" ]