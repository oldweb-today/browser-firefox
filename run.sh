#!/bin/bash

#fluxbox -display $DISPLAY -log /tmp/fluxbox.log &
jwm -display $DISPLAY &

sudo chown browser:browser /home/browser/ffprofile

cd /home/browser/ffprofile
sudo chown browser:browser /home/browser/ffprofile/*
chmod 644 /home/browser/ffprofile/*

if [[ -n "$PROXY_GET_CA" ]]; then
    curl -x "$PROXY_HOST:$PROXY_PORT"  "$PROXY_GET_CA" > /tmp/proxy-ca.pem

    certutil -A -n "Proxy" -t "TCu,Cuw,Tuw" -i /tmp/proxy-ca.pem -d /home/browser/ffprofile
fi

run_browser /opt/firefox/firefox --profile /home/browser/ffprofile -setDefaultBrowser --new-window "$URL"

