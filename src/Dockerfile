# Containerfile
FROM registry.fedoraproject.org/fedora:latest

# Installa solo Ganesha (FSAL VFS). Niente dbus.
RUN dnf -y install --setopt=install_weak_deps=False \
        nfs-ganesha nfs-ganesha-vfs \
    && dnf clean all

# Config di Ganesha
COPY ganesha.conf /etc/ganesha/ganesha.conf

# Directory necessarie.
# Nota: settiamo group=0 e g=u per compatibilità con UID arbitrari (OpenShift).
RUN mkdir -p /export /var/log/ganesha \
 && chgrp -R 0 /export /var/log/ganesha /etc/ganesha \
 && chmod -R g=u /export /var/log/ganesha /etc/ganesha

EXPOSE 2049/tcp

# Entrypoint minimale: solo Ganesha in foreground
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

