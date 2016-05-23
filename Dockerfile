FROM jenkinsci/jenkins:latest
MAINTAINER Frankie Robertson <frankie@robertson.name>

USER root

# Apertium
RUN apt-get update && apt-get install -y \
    wget \
    curl \
  && wget http://apertium.projectjj.com/apt/install-nightly.sh -O - | bash \
  && apt-get update \
  && apt-get -f install -y apertium-all-dev

# Python 3
RUN apt-get -f install -y python3
RUN echo "deb http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu trusty main" >> /etc/apt/sources.list.d/deadsnakes.list \
  && echo "deb-src http://ppa.launchpad.net/fkrull/deadsnakes/ubuntu trusty main" >> /etc/apt/sources.list.d/deadsnakes.list \
  && (gpg --keyserver keyserver.ubuntu.com --recv-keys DB82666C || true) \
  && gpg --export DB82666C | apt-key add - \
  && apt-get update \
  && apt-get -f install -y python3.5

# Build essential
RUN apt-get -f install -y build-essential automake

USER jenkins
