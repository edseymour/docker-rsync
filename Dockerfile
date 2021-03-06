FROM fedora:22
MAINTAINER "Ed Seymour" <edwaado@gmail.com>

RUN dnf -y install rsync
ADD rsyncd.conf /etc/rsyncd.conf
ADD start.sh /start.sh
RUN chmod 555 /start.sh && chmod 664 /etc/rsyncd.conf && touch /var/run/rsyncd.lock && chmod 664 /var/run/rsyncd.lock

VOLUME ["/modules"] 

EXPOSE 8873

CMD ["/start.sh"]
