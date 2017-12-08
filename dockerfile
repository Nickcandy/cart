FROM alpine
MAINTAINER NICK
ENV http_proxy http://web-proxy.houston.hpecorp.net:8080
ENV https_proxy http://web-proxy.houston.hpecorp.net:8080
RUN apk update
RUN apk add wget --no-cache --update-cache  --allow-untrusted

RUN mkdir var/tmp/jdk
RUN mkdir var/tmp/tomcat
RUN mkdir var/tmp/maven
# JDK
RUN apk add openjdk8

# maven
 RUN wget -P /var/tmp/maven http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz
 RUN tar xzf /var/tmp/maven/apache-maven-3.5.2-bin.tar.gz -C /var/tmp/maven && rm -rf /var/tmp/maven/apache-maven-3.5.2-bin.tar.gz

# tomcat
RUN wget -P  /var/tmp/tomcat https://mirrors4.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
RUN tar xzf /var/tmp/tomcat/apache-tomcat-7.0.82.tar.gz -C /var/tmp/tomcat && rm -rf /var/tmp/tomcat/apache-tomcat-7.0.82.tar.gz
RUN chmod 777 /var/tmp/tomcat


#path
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV CATALINA_HOME /var/tmp/tomcat/apache-tomcat-8.5.8
ENV MAVEN_HOME  /var/tmp/maven/apache-maven-3.5.2
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$MAVEN_HOME/bin
EXPOSE 8080

