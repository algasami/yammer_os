echo "[config.sh] configurating GCC environment (assuming bear will override)";

PREFIX="$(pwd)/opt/cross/bin";
export HOST=$(./default-host.sh);
export AR=${PREFIX}/${HOST}-ar;
export AS=${PREFIX}/${HOST}-as;
export CC=${PREFIX}/${HOST}-gcc;
