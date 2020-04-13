#
# Build stage
#
FROM maven:3.5-jdk-8 AS build  
COPY src /src  
COPY pom.xml
RUN mvn -f pom.xml clean package

#
# Package stage
#
FROM openjdk:8-jdk-alpine
COPY --from=build target/demo-aws-0.0.1-SNAPSHOT.jar demo-aws.jar
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /demo-aws.jar"]
