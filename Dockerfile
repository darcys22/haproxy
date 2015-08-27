FROM haproxy 

ENV VERSION 0.7.1 

ADD https://github.com/kelseyhightower/confd/releases/download/v${VERSION}/confd-${VERSION}-linux-amd64 \ 
  /usr/local/bin/confd 
RUN chmod u+x /usr/local/bin/confd 

ADD configuration.toml /etc/confd/conf.d/configuration.toml 
ADD haproxy.cfg /etc/confd/templates/haproxy.cfg

COPY boot.sh /usr/local/bin/boot.sh
COPY configuration.toml /usr/haproxy/config

CMD ["/usr/local/bin/boot.sh"]
