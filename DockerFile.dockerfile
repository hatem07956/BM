FROM openjdk:11-jdk-slim as build
#WORKDIR /app
COPY . .
RUN chmod +x gradlew
RUN ./gradlew build

FROM openjdk:11-jre-slim

EXPOSE 8080

#WORKDIR /app

COPY --from=build /build/libs/*.jar app.jar

ENTRYPOINT ["java","-jar","app.jar"]
