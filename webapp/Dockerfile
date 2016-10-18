FROM alpine

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install virtualenv \
    && rm -rf /var/cache/apk/*

RUN apk add --update nodejs-lts \
    && rm -rf /var/cache/apk/* \
    && npm install -g bower

# Creación del usuario webapp
RUN adduser -D webapp

USER webapp
WORKDIR /home/webapp
RUN virtualenv ~/venv
COPY src/requirements.txt /tmp
RUN venv/bin/pip install -r /tmp/requirements.txt
# && rm /tmp/requirements.txt

