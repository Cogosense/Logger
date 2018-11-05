FROM alpine
MAINTAINER Steve Williams <swilliams@cogosense.com>

ENV TINI_SHA 066ad710107dc7ee05d3aa6e4974f01dc98f3888

# install dev tools
RUN apk --update add --no-cache rsyslog curl \
    && curl -fsSL https://github.com/krallin/tini/releases/download/v0.5.0/tini-static -o /bin/tini && chmod +x /bin/tini \
    && echo "$TINI_SHA  /bin/tini" | sha1sum -c - \
    && mkdir -p /var/lib/rsyslog \
    && apk del curl \
    && mkdir /logger

COPY rsyslog.conf /etc/rsyslog.conf
COPY rsyslog.sh /var/lib/rsyslog/rsyslog.sh

WORKDIR /var/lib/rsyslog
EXPOSE 514
ENTRYPOINT ["/bin/tini", "--"]
CMD ["sh", "./rsyslog.sh"]

