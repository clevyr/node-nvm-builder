FROM debian

RUN apt-get update && apt-get -y upgrade && apt-get install -y libfontconfig git python make build-essential curl libkrb5-dev zip

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 4.8.3

RUN mkdir /root/.nvm

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && nvm install-latest-npm

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH