#!/bin/sh

PLATFORM=`uname -s | awk '{print $1}'`

if [[ $PLATFORM = "Darwin" ]] ; then
    bash configure -shared -macAccelerate --with-fftw3=/usr/local --with-netcdf=/usr/local -noarpack clang
else
    bash ./configure --with-netcdf=$PREFIX \
                     --with-blas=$PREFIX \
                     --with-bzlib=$PREFIX \
                     --with-zlib=$PREFIX \
                     -openmp \
                     -shared \
                     -openblas -noarpack gnu
fi
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
