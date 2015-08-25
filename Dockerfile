FROM ubuntu:14.04
MAINTAINER Tyler Land <tland9@uw.edu>
RUN apt-get update && apt-get install -y git make gcc

RUN mkdir -p /root/.ssh/
ADD uwlabmed-deployment-key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts && ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN mkdir -p src
RUN git clone git@bitbucket.org:uwlabmed/bio_installs.git src/bio_installs
RUN src/bio_installs/install_scripts/install_blast.sh 2.2.30 /usr/local src
