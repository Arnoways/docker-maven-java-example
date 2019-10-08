FROM maven:3.6.2-jdk-11
WORKDIR /usr/src/app/
COPY src/ src/
COPY pom.xml .
COPY docker-maven/maven-entrypoint.sh .
RUN chmod +x maven-entrypoint.sh

ENTRYPOINT [ "/usr/src/app/maven-entrypoint.sh" ]
