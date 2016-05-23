FROM buildpack-deps:xenial
MAINTAINER Frankie Robertson <frankie@robertson.name>

# Apertium
RUN apt-get update && apt-get install -y \
    wget \
    curl \
  && wget http://apertium.projectjj.com/apt/install-nightly.sh -O - | bash \
  && apt-get update \
  && apt-get -f install -y apertium-all-dev


# Jenkins
RUN wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add \
  && sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list' \
  && apt-get update \
  && apt-get -f install -y jenkins

# Python 3
RUN apt-get -f install -y python3
