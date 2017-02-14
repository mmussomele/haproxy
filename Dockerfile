From haproxy:1.6.4

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY start.go /

RUN apt-get -y update \
&& apt-get install -y golang-go \
&& go build /start.go \
&& apt-get remove --purge -y golang-go $(apt-mark showauto) \
&& rm -rf /var/lib/apt/lists/*


CMD ["/start"]
