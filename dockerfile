
FROM alpine
MAINTAINER NICK
RUN export http_proxy=http://web-proxy.houston.hpecorp.net:8080
RUN export https_proxy=http://web-proxy.houston.hpecorp.net:8080
RUN apk update
RUN apk add wget --no-cache --update-cache  --allow-untrusted

RUN mkdir var/tmp/jdk
RUN mkdir var/tmp/tomcat
RUN mkdir var/tmp/maven
# JDK
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  -P /var/tmp/jdk http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/jdk-8u152-linux-x64.tar.gz
RUN tar xzf /var/tmp/jdk/jdk-8u111-linux-x64.tar.gz -C /var/tmp/jdk && rm -rf /var/tmp/jdk/jdk-8u111-linux-x64.tar.gz

# maven
 RUN wget -P /var/tmp/maven https://mirrors4.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.2/source/apache-maven-3.5.2-src.tar.gz
 RUN tar xzf /var/tmp/maven/apache-maven-3.5.2-src.tar.gz -C /var/tmp/maven && rm -rf /var/tmp/maven/apache-maven-3.5.2.tar.gz

# tomcat
RUN wget -P  /var/tmp/tomcat https://mirrors4.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
RUN tar xzf /var/tmp/tomcat/apache-tomcat-7.0.82.tar.gz -C /var/tmp/tomcat && rm -rf /var/tmp/tomcat/apache-tomcat-7.0.82.tar.gz



#path
ENV JAVA_HOME /var/tmp/jdk/jdk1.8.0_111
ENV CATALINA_HOME /var/tmp/tomcat/apache-tomcat-8.5.8
ENV MAVEN_HOME  /var/tmp/maven/apache-maven-3.5.2
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$MAVEN_HOME/bin
EXPOSE 8080