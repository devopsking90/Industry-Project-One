From tomcat:8.0.51-jre8-alpine

LABEL maintainer="devopsconsious@gmail.com"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY ./target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
