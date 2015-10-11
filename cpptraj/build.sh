#!/bin/sh

# serial
bash ./configure --with-arpack=$PREFIX --with-netcdf=$PREFIX gnu
make install -j8
make clean

# openmp
bash ./configure --with-arpack=$PREFIX --with-netcdf=$PREFIX -openmp gnu
make install -j8

mkdir -p $PREFIX/include/cpptraj/

cp bin/cpptraj* $PREFIX/bin/
