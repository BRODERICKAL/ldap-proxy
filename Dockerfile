FROM registry.access.redhat.com/ubi8/ubi-minimal
ARG version="1.10.0.0"
ARG source="ibm-operator-catalog"

LABEL name="cp4s rh based nginx" \
      vendor="IBM" \
      version="1.10.0.0" \
      release="1.10.0.0" \
      summary="CP4S nginx LDAP proxy" \
      description="The Cloud Pak for Security Core installation"

RUN microdnf -y update && microdnf -y install nginx-mod-stream && rm -rf /usr/share/doc/perl*
USER 1001:1001
