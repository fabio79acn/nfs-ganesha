# Containerfile
FROM registry.fedoraproject.org/fedora:latest

RUN dnf -y install nfs-ganesha nfs-ganesha-vfs dbus && \
    dnf clean all

# Config di Ganesha e entrypoint
COPY ganesha.conf /etc/ganesha/ganesha.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Directory usate da Ganesha/DBus
RUN mkdir -p /export /var/run/dbus /var/log/ganesha && \
    chown -R 0:0 /export /var/run/dbus /var/log/ganesha && \
    chmod -R g+rwX /export /var/run/dbus /var/log/ganesha

EXPOSE 2049/tcp
ENTRYPOINT ["/entrypoint.sh"]

