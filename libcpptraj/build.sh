#!/bin/sh

bash ./configure -shared --with-arpack=$PREFIX --with-lapack=$PREFIX --with-netcdf=$PREFIX -openmp gnu
make libcpptraj -j8

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
