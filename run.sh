#!/bin/bash

if xhost >& /dev/null; then
  run_forever jwm -display "$DISPLAY" &

  HEADLESS=""
else
  HEADLESS="-headless"
fi

sudo chown browser:browser /home/browser/ffprofile

cd /home/browser/ffprofile
sudo chown browser:browser /home/browser/ffprofile/*
chmod 644 /home/browser/ffprofile/*

if [[ -n "$PROXY_HOST" ]]; then
    sed -i s/'$PROXY_HOST'/$PROXY_HOST/g ~/proxy.js
    sed -i s/'$PROXY_PORT'/$PROXY_PORT/g ~/proxy.js
    cat ~/proxy.js >> ~/ffprofile/user.js

    if [[ -n "$PROXY_CA_FILE" ]]; then
        certutil -A -n "Proxy" -t "TCu,Cuw,Tuw" -i "$PROXY_CA_FILE" -d /home/browser/ffprofile
    fi
fi

run_forever /opt/firefox/firefox "$HEADLESS" --profile /home/browser/ffprofile -setDefaultBrowser --new-window "$URL"

