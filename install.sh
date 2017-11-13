#!/bin/bash

if [[ "$FF_VERSION" < "52.0" ]]; then
    echo "Installing Java 6"

    export DEBIAN_FRONTEND=noninteractive
    echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
    echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections

    add-apt-repository ppa:webupd8team/java
    apt-get update
    apt-get -qqy install oracle-java6-installer
    rm -rf /var/lib/apt/lists/*

fi


