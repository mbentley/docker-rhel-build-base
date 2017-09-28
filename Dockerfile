FROM registry.access.redhat.com/rhel7.3

COPY yum.repos.d/* /etc/yum.repos.d/
COPY pki /etc/pki
COPY rhsm /etc/rhsm
COPY rpm /var/lib/rpm
