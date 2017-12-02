
FROM alpine
MAINTAINER NICK
RUN yum install -y wget
RUN mkdir var/tmp/jdk
RUN mkdir var/tmp/tomcat
RUN mkdir var/tmp/maven
# JDK
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  -P /var/tmp/jdk http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz
RUN tar xzf /var/tmp/jdk/jdk-8u111-linux-x64.tar.gz -C /var/tmp/jdk && rm -rf /var/tmp/jdk/jdk-8u111-linux-x64.tar.gz

# tomcat
RUN wget -P  /var/tmp/tomcat http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.8/bin/apache-tomcat-8.5.8.tar.gz
RUN tar xzf /var/tmp/tomcat/apache-tomcat-8.5.8.tar.gz -C /var/tmp/tomcat && rm -rf /var/tmp/tomcat/apache-tomcat-8.5.8.tar.gz

# maven
RUN wget -p /var/tmp/maven http://mirrors.koehn.com/apache/maven/maven-3/3.5.2/source/apache-maven-3.5.2-src.tar.gz
RUN tar xzf /var/tmp/maven/apache-maven-3.5.2-src.tar.gz -C /var/tmp/maven && rm -rf /var/tmp/maven/apache-maven-3.5.2-src.tar.gz

#path
ENV JAVA_HOME /var/tmp/jdk/jdk1.8.0_111
ENV CATALINA_HOME /var/tmp/tomcat/apache-tomcat-8.5.8
ENV MAVEN_HOME  /var/tmp/maven/apache-maven-3.5.2-src
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$MAVEN_HOME/bin
EXPOSE 8080