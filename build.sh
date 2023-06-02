#!/bin/sh
# This builds most stuff with subdirectory makefiles.
# *Principles*
#   1. Must obey ONE-SINGLE-JOB principle. You have one job, literally X)
#   2. Can't think of anything right now Zzz

set -e

. ./config.sh

for PROJECT in ${PROJECTS}; do
    (cd ${PROJECT} && DESTDIR="${SYSROOT}" ${MAKE} install)
done
