FROM phusion/baseimage:0.11

# For more information about this base image, see
# https://blog.ubuntu.com/2018/07/09/minimal-ubuntu-released
# http://phusion.github.io/baseimage-docker/
# https://github.com/phusion/baseimage-docker/issues/508

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir app
# ENV SCRIPTS_PATH /opt/src

COPY bin app/bin
COPY src app/src
COPY demo_catchment app/demo_catchment
COPY run_scripts app/run_scripts

COPY utils app/utils

WORKDIR app/run_scripts

# MUST NOT use an ENTRYPOINT in derivative containers, else the system services
# will not run (e.g. fluentd).  The CMD is recommended by phusion/baseimage
# documentation and it's easier to work with.  Use baseimage-docker's init
# system.  It will run items in /etc/service/*/run
#CMD [ "./run_GisToSWMM5_rect"]
CMD [ "./run_GisToSWMM5_adap"]

