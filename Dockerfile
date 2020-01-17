FROM registry.access.redhat.com/ubi7/ubi-minimal:latest

RUN /usr/bin/microdnf install util-linux


ARG dsx_uid=1000320999
ARG dsx_gid=1000320999

RUN groupadd -g ${dsx_gid} higroup \
 && useradd  -u ${dsx_uid} -g ${dsx_gid} -G users -m -c "" -e "" \
             -l -s /bin/bash hiuser \
 && ls -lR /home

USER ${dsx_uid}:root

RUN id
