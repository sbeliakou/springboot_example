FROM maven:3.3-jdk-8 as builder
LABEL developer "Mikalai Charopkin"
COPY . /build/
RUN ls -la /build/
WORKDIR /build
RUN mvn clean install

FROM openjdk:8-jre
LABEL maintainer "Siarhei Beliakou"
COPY --from=builder /build/target/demoapp.jar /opt/
ENV APP_STARTER ""
EXPOSE 8080
ENTRYPOINT java -Dapplication.starter="${APP_STARTER}" -jar /opt/demoapp.jar