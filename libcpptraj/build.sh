#!/bin/sh

bash ./configure --with-netcdf=$PREFIX -openmp -shared -nomathlib gnu
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
