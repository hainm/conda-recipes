#!/bin/sh

bash ./configure --with-netcdf=$PREFIX \
                 --with-blas=$PREFIX \
                 --with-bzlib=$PREFIX \
                 --with-zlib=$PREFIX \
                 -openmp \
                 -shared \
                 -openblas -noarpack gnu
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
