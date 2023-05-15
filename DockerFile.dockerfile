#multi stage dockerfile t build and start the app.
FROM openjdk:11-jdk-slim as bm

COPY . .

RUN chmod +x gradlew
RUN ./gradlew build

FROM openjdk:11-jre-slim

#Copy from the first image the jar file

COPY --from=bm /build/libs/*.jar bm.jar

EXPOSE 8080
#start your application

CMD ["java","-jar","bm.jar"]
