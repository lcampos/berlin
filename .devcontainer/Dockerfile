# Use the maven jdk 8 image
FROM maven:3.6-jdk-8

# Setup Java path
COPY settings.vscode.json /root/.vscode-remote/data/Machine/settings.json

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

# Verify git, needed tools installed
RUN apt-get -y install git procps curl

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
RUN apt-get install -y nodejs

# Install salesforce cli
RUN npm i -g sfdx-cli

# Create cert in order to use in JWT flow
# https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_key_and_cert.htm
RUN apt-get install -y openssl
RUN mkdir /root/JWT
RUN openssl genrsa -des3 -passout pass:xmachina -out /root/JWT/server.pass.key 2048 && \
    openssl rsa -passin pass:xmachina -in /root/JWT/server.pass.key -out /root/JWT/server.key && \
    rm /root/JWT/server.pass.key && \
    openssl req -new -key /root/JWT/server.key -out /root/JWT/server.csr \
        -subj "/C=US/ST=California/L=San Francisco/O=SFDX/OU=Dev/CN=dx.com" && \
    openssl x509 -req -sha256 -days 365 -in /root/JWT/server.csr -signkey /root/JWT/server.key -out /root/JWT/server.crt

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog