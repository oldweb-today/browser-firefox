FROM webrecorder/base-browser

RUN apt-get update && apt-get install -y \
    libgtk-3-0 libasound2 libdbus-glib-1-2 libnss3-tools jwm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /download

ENV FF_VERSION 49.0.1

RUN wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FF_VERSION/linux-x86_64/en-US/firefox-$FF_VERSION.tar.bz2 && \
    tar xvf firefox-$FF_VERSION.tar.bz2
RUN sudo mv ./firefox /opt/firefox

USER browser

#WORKDIR /home/browser/ffprofile

COPY ./ffprofile/. /home/browser/ffprofile/

COPY jwmrc /home/browser/.jwmrc

COPY run.sh /app/run.sh

RUN sudo chmod a+x /app/run.sh

CMD /app/entry_point.sh /app/run.sh

LABEL wr.browser="ff" \
      wr.version="49" \
      wr.os="lin" \
      wr.release="2016-09-23" \
      wr.about="https://en.wikipedia.org/wiki/Firefox" \
      wr.caps.flash="1" \
      wr.icon="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADeUlEQVR4AU1TU2DEaBicP8m6tm3zbNu2ns62bdu27att2263q2yTTbL5rtvjw3yambdvQG+dDPlCsNeuu4w/9skuLrB/PrIWd1eD/fTra5y3XV/juO2WetcpLw/I0QHura5ZVvP81XxgDmCn/P7hLdwOOaWHXPHlzGPHfbzuPOmLDbrou1X9ou/X9LO+XKYLPp/bfL1z4/5vRbIFtD19d+14WKBsDNdV9hv33P+eyEdO9Lhcu+XEj1BUhImmsTcZORV2n8ppdhG7hijshFxxRf359Sv3TfZ+9Pt+93ECAIwP2w7SrYsPni/eogVHi/70sHXuQufTnF0ghJIXXlmFZd1JQ8ua/+xqW2zkQZUf9vR9IB1Qc8vXHACYrMaUlKBNHIAW2sfSzytTGtt/8BvssfAZ3GsizHY3jKrG5hadfO848ydVhCHj0NArAYDN3ZoX71ujbo1YLFl5MsQxpqk+WMR0vGM6GB95q2DeckL3erElA6nBa/TdoxpjqFmTl78vFnwO7KWIiIWRSND9jNwcIhM13O3aCz/OFSGSLUIWJSieze2+hbLDspjPN0zwFcV0vdZyIud1Ilz1AdBAqsxgH1Bx07d74rt+K9TFCcxMOeFcnAe5V+BZmEduUjesMTP6zKKIXk9ymiBL0JiPQeAJikqwmYDdw1fQOzuP+HAfqjMcqBkKx+SUB0ZNRpBzDHA4WLCqYI982xirOzIvyy+jK9hCwWYbiBkZM1s0+HgBAvkxLgt4eyUbP3XZUJG9hM/uXiGESUwbFDapy1LB7X1K8YS8Re0ekUGVoZNKEEUB33ZbcdHnCTjx42x82wrYNDtOrXKCc2u0XmNDz4/WuejyglkOADQFj4segltk8G2BDDrhoGwJJ1Z6cXbRKq4oWcKHpyzh6HgFG41GfapVwOA41wwAwvePDHBHXVfy3fsP9DwHnb+E/EzTNHBWs86OiXSx4+MBZmDk34Z3CrrsZoLZrdTtEaPcCOCvLPQdVsQARN6VlPzFx4U59MtueXr9AfnUcngedRyVR93HBpDv/2r/AnqqOP1XAFEB3/mp0QyBYb+wEFZos1qB7QcLDrvlwZSUntdyM10flWZrn1RmKx9VZTleL88cPTsp5VkBXF5GhNF8a2ES908a/8XPZUUcz8ADiAsDv+v+1pCjq0xBh1vAVwOIB3bCx/7v+RODWtK1Q31ZvwAAAABJRU5ErkJggg=="

