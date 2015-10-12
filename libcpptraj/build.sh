#!/bin/sh

ls $PREFIX/lib/

bash ./configure -shared --with-arpack=$PREFIX --with-lapack=$PREFIX --with-netcdf=$PREFIX --with-blas=$PREFIX -openmp gnu
make libcpptraj -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp src/*.h $PREFIX/include/cpptraj/
