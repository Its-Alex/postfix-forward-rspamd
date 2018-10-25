FROM alpine:3.8 as postfix-build

ADD supervisor.conf /etc/supervisor/supervisor.conf
COPY conf.d /etc/supervisor/conf.d

RUN apk --no-cache add postfix rspamd supervisor ca-certificates rsyslog

EXPOSE 25

CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf"]
