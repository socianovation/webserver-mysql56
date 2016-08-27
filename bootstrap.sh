#!/usr/bin/env bash

apt-get update
apt-get upgrade
debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password exodia89'
debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password exodia89'
apt-get -y install mysql-server-core-5.6
apt-get -y install mysql-server-5.6