#!/usr/bin/env bash

MINION_ADMINISTRATOR_EMAIL="april@mozilla.com"
MINION_ADMINISTRATOR_NAME="April King"
MINION_BACKEND=/opt/minion/minion-backend

apt-get update && apt-get -y install build-essential \
  curl \
  git \
  libcurl4-openssl-dev \
  mongodb-server \
  postfix \
  python \
  python-dev \
  python-setuptools \
  rabbitmq-server \
  stunnel

# For some reason, it doesn't seem to want to install rabbitmq-server properly
# on the first try
apt-get -y install rabbitmq-server

# Install minion-backend
# git clone https://github.com/marumari/minion-backend.git ${MINION_BACKEND}
cd ${MINION_BACKEND}
python setup.py develop

# Configure minion-backend
mkdir -p /etc/minion
mv /tmp/backend.json /etc/minion

# Create database directory for MongoDB and start it up
mkdir -p /data/db
mongod --fork --logpath /var/log/mongodb/mongodb.log
sleep 5

# Start RabbitMQ
mkdir /var/run/celery
rabbitmq-server -detached
sleep 5

# Start Minion
cd $MINION_BACKEND
scripts/minion-backend-api runserver -a 0.0.0.0 --debug --reload &
scripts/minion-state-worker &
scripts/minion-scan-worker &
scripts/minion-plugin-worker &
scripts/minion-scanschedule-worker &
scripts/minion-scanscheduler &
sleep 5

# Create the initial administrator and database
scripts/minion-db-init "$MINION_ADMINISTRATOR_EMAIL" "$MINION_ADMINISTRATOR_NAME" y
