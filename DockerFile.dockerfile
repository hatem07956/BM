#multi stage dockerfile t build and start the app.
FROM openjdk:11-jdk-slim as bm

COPY . .

RUN chmod +x gradlew
RUN ./gradlew build

FROM openjdk:11-jre-slim

COPY --from=bm /build/libs/*.jar bm.jar

EXPOSE 8080

CMD ["java","-jar","bm.jar"]
