ARG RHEL_VER

FROM registry.access.redhat.com/rhel${RHEL_VER}

COPY etc/yum.repos.d/* /etc/yum.repos.d/
COPY etc/pki /etc/pki
COPY etc/rhsm /etc/rhsm
RUN rm -f /etc/yum.repos.d/docker*.repo &&\
  rpm --initdb --dbpath /var/lib/rpm
