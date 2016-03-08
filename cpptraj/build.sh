#!/bin/sh

# serial
bash ./configure \
    --with-netcdf=$PREFIX \
    --with-blas=$PREFIX \
    -openblas \
    -noarpack \
    gnu

make install -j${CPU_COUNT}

make clean
# openmp
bash ./configure \
    --with-netcdf=$PREFIX \
    --with-blas=$PREFIX \
    -openblas \
    -noarpack \
    -openmp \
    gnu

make install -j${CPU_COUNT}

cp bin/cpptraj* $PREFIX/bin/
