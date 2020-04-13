#
# Package stage
#
FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/demo-aws-0.0.1-SNAPSHOT.jar demo-aws.jar
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /demo-aws.jar"]
