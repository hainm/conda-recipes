#!/bin/sh

bash ./configure -shared -nomathlib --with-netcdf=$PREFIX -openmp gnu
make libcpptraj -j8
make install -j8

mkdir -p $PREFIX/include/cpptraj/

cp lib/libcpptraj* $PREFIX/lib/
cp bin/cpptraj* $PREFIX/bin/

cp src/*.h $PREFIX/include/cpptraj/
