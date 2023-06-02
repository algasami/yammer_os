# !/bin/sh
# This script cleans up everything (including the mess you've created)

set -e .
. ./config.sh

# clean up projects
for PROJECT in ${PROJECTS}; do
  (cd ${PROJECT} && ${MAKE} clean)
done

# clean up caches
rm -rf sysroot
rm -rf isodir
rm -rf myos.iso
