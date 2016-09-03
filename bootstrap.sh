#!/usr/bin/env bash

apt-get update
apt-get upgrade
debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password exodia89'
debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password exodia89'
apt-get -y install mysql-server-core-5.6
apt-get -y install mysql-server-5.6

apt-get install -y default-jre
apt-get install -y default-jdk

#jenkins installation
mkdir jenkins
cd jenkins

wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

#Dependencies for Jenkins
composer global require "squizlabs/php_codesniffer=*"
composer global require 'phploc/phploc=*'
composer global require "pdepend/pdepend"
composer global require "phpmd/phpmd"
composer global require "sebastian/phpcpd=*"

wget http://phpdox.de/releases/phpdox.phar
chmod +x phpdox.phar
mv phpdox.phar /usr/local/bin/phpdox
phpdox --version

#jenkins installation

#wget http://localhost:8080/jnlpJars/jenkins-cli.jar
#curl -L https://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack
#sudo java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin checkstyle cloverphp crap4j dry htmlpublisher jdepend plot pmd violations warnings xunit
#sudo java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart
