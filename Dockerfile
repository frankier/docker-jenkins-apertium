FROM jenkinsci/jenkins
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

# Build essential
RUN apt-get -f install -y build-essential automake

USER jenkins
