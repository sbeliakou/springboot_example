## Build Application JAR
FROM maven:3.3-jdk-8 as builder

LABEL developer "Mikalai Charopkin (ncherepkin@live.com)"
COPY . /build/
RUN ls -la /build/
WORKDIR /build
RUN mvn clean install


## Package Application into Container
FROM openjdk:8-jre

LABEL maintainer "Siarhei Beliakou (sbeliakou@gmail.com)"
COPY --from=builder /build/target/demoapp.jar /opt/
ENV APP_STARTER ""
EXPOSE 8080
ENTRYPOINT java -Dapplication.starter="${APP_STARTER}" -jar /opt/demoapp.jar