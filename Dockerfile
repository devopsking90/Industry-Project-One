From tomcat:8.0.51-jre8-alpine

LABEL maintainer="devopsconsious@gmail.com"

RUN rm -rf /usr/local/tomcat/webapps/*

COPY ./target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
