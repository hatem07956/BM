#dockerfile to uild and start the app.

FROM openjdk:11-jre-slim

COPY  /build/libs/*.jar bm.jar

EXPOSE 8080

CMD ["java","-jar","bm.jar"]
