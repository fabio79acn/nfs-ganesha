FROM registry.fedoraproject.org/fedora:40

RUN dnf -y install --setopt=install_weak_deps=False \
      nfs-ganesha nfs-ganesha-vfs iproute \
      acl     \
  && dnf clean all

COPY ganesha.conf /etc/ganesha/ganesha.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /export && chown  0:0 /export


EXPOSE 2049/tcp

ENTRYPOINT ["/entrypoint.sh"]

