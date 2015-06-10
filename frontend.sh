#!/usr/bin/env bash

MINION_FRONTEND=/opt/minion/minion-frontend

apt-get update && apt-get install -y build-essential \
  curl \
  git \
  libcurl4-openssl-dev \
  python \
  python-dev \
  python-setuptools \
  stunnel

# Install minion-frontend
# git clone https://github.com/marumari/minion-frontend.git ${MINION_FRONTEND}
cd ${MINION_FRONTEND}
python setup.py develop

# Configurure minion-frontend
mkdir -p /etc/minion
mv /tmp/frontend.json /etc/minion

# Start up minion-frontend
scripts/minion-frontend -a 0.0.0.0 --debug --reload &
