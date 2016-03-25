#!/bin/sh

bash configure -shared -macAccelerate --with-fftw3=/usr/local --with-netcdf=/usr/local -noarpack clang
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
