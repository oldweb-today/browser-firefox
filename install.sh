#!/bin/bash

if [[ "$FF_VERSION" < "52.0" ]]; then
    echo "Installing Java 6"

    apt-get -y update
    apt-get -qqy install locales java-common

    export DEBIAN_FRONTEND=noninteractive
    echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

    #add-apt-repository ppa:webupd8team/java
    dpkg -i /tmp/oracle-java6-installer.deb
    #apt-get update
    #apt-get -qqy install
    rm -rf /var/lib/apt/lists/*

fi


