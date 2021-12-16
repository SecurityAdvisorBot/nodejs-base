FROM ubuntu:20.04
USER root
RUN apt-get update
RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node
RUN apt-get update
RUN apt-get upgrade -yq
RUN apt-get dist-upgrade -yq
RUN apt-get install automake make curl g++ gcc unzip gnupg htop nano zip python python3 -yq
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -yq nodejs
RUN node -v
RUN npm -v
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [ "node" ]
