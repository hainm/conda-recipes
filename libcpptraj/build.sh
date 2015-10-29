#!/bin/sh

# only need netcdf, lapack (with blas)
bash ./configure --with-netcdf=$PREFIX -openmp -shared --with-blas=$PREFIX/ --with-lapack=$PREFIX/ -noarpack gnu
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
