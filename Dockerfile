FROM ubuntu:14.04
MAINTAINER BJ Terry, ""
 
RUN echo deb http://archive.ubuntu.com/ubuntu trusty universe >> /etc/apt/sources.list
RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.617/jenkins.war /opt/jenkins.war
RUN ln -sf /jenkins /root/.jenkins

# GIT
RUN apt-get install -q -y git

# SLOCCount
RUN apt-get install -q -y sloccount

# pyenv
RUN apt-get install -q -y python-pip
RUN pip install -q --upgrade virtualenv
  
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
