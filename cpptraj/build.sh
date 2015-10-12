#!/bin/sh

# serial
bash ./configure --with-arpack=$PREFIX --with-netcdf=$PREFIX --with-lapack=$PREFIX --with-blas=$PREFIX gnu
make install -j${CPU_COUNT}

# openmp
#bash ./configure --with-arpack=$PREFIX --with-netcdf=$PREFIX --with-lapack=$PREFIX --with-blas=$PREFIX -openmp gnu
#make install -j${CPU_COUNT}

cp bin/cpptraj* $PREFIX/bin/
