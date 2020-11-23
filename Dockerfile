# Use official base image of Java Runtim
FROM openjdk:8-jdk-alpine

# Set volume point to /tmp
VOLUME /tmp

RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

# Make port 8432 available to the world outside container
EXPOSE 8432

# Set application's JAR file
ARG JAR_FILE="target/service-discovery.jar"

# Add the application's JAR file to the container
ADD ${JAR_FILE} app.jar

RUN ls

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app.jar"]