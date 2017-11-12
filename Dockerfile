FROM ubuntu:14.04

RUN apt-get -q update && \
  apt-get -qy install build-essential g++ git wget xz-utils python && \
  apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/* && \
  wget https://nodejs.org/dist/latest-v8.x/node-v8.9.1-linux-x64.tar.xz && \
  tar -C /usr/local --strip-components 1 -xJf node-v8.9.1-linux-x64.tar.xz && \
  git clone -b development https://github.com/exsilium/cloud9.git && \
  cd cloud9 && \
  npm install && \
  mkdir /app

WORKDIR /cloud9

CMD ./bin/cloud9.sh -l 0.0.0.0 -w /app
