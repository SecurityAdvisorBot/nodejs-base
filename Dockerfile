FROM ubuntu:20.04
USER root
WORKDIR /home/ubuntu/node
RUN apt-get update
RUN apt-get upgrade -yq
RUN apt-get dist-upgrade -yq
RUN apt-get install curl gnupg htop nano zip -yq
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -yq nodejs
RUN node -v
RUN npm -v

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y

ENV NODE_ENV production
USER node
ENTRYPOINT ["node"]
