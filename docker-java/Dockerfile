FROM openjdk:11
WORKDIR /entrypoint
COPY docker-java/java-entrypoint.sh .
RUN chmod +x java-entrypoint.sh
ENTRYPOINT [ "/entrypoint/java-entrypoint.sh" ]
