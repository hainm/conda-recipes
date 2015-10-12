#!/bin/sh

# serial
bash ./configure --with-arpack=$PREFIX --with-netcdf=$PREFIX --with-lapack=$PREFIX --with-blas=$PREFIX gnu
make install -j${CPU_COUNT}

# openmp
make clean
bash ./configure --with-arpack=$PREFIX --with-netcdf=$PREFIX --with-lapack=$PREFIX --with-blas=$PREFIX gnu
make install -j${CPU_COUNT}

mkdir -p $PREFIX/include/cpptraj/

cp bin/cpptraj* $PREFIX/bin/
