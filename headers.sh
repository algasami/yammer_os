#!/bin/sh
#Does something like build but only headers are installed

set -e
. ./config.sh

for PROJECT in ${SYSTEM_HEADER_PROJECTS}; do
  (cd ${PROJECT} && DESTDIR="${SYSROOT}" ${MAKE} install-headers)
done
