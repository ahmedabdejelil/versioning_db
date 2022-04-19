FROM postgres
# Install GPG for package vefification
RUN apt-get update \
  && apt-get -y install default-jdk

# Make /liquibase directory and change owner to liquibase
RUN mkdir /liquibase && chown root /liquibase
RUN mkdir -p /home/user/ && chown root /home/user/
WORKDIR /liquibase

# Change to the liquibase user
USER root


ENV PATH "$PATH:/home/user/liquibase/"


COPY liquibase.tar.gz /liquibase
RUN  tar -xzvf liquibase.tar.gz

RUN cp -R /liquibase/home/user/liquibase /home/user/ &&  cp /liquibase/liquibase.tar.gz /home/user/
