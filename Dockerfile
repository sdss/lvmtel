FROM python:3.10-slim-bullseye

MAINTAINER Florian Briegel briegel@mpia.de
LABEL org.opencontainers.image.source https://github.com/sdss/lvmtel

WORKDIR /opt

COPY . lvmtel

RUN pip3 install -U pip setuptools wheel
RUN cd lvmtel && pip3 install .
RUN rm -Rf lvmtel

ENTRYPOINT lvmtel -c $LVMTEL_CONFIG --rmq_url=$LVMTEL_RMQ_URL actor start --debug
