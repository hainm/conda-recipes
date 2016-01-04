#!/bin/sh

bash ./configure --with-netcdf=$PREFIX -openmp -shared --with-blas=$PREFIX/ -openblas -noarpack gnu
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
