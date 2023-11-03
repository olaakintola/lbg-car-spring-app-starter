# Build stage
FROM maven:3.6.0-jdk-11-slim AS build 
WORKDIR /app 
COPY . .
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:11-jre-slim 
WORKDIR /app 
COPY --from=build /app/target/cardatabase-0.0.1-SNAPSHOT.jar  /app/
EXPOSE 8080
CMD ["java", "-jar", "cardatabase-0.0.1-SNAPSHOT.jar"]
