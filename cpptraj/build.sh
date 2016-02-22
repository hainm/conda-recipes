#!/bin/sh

# serial
bash ./configure \
    --with-netcdf=$PREFIX \
    --with-blas=$PREFIX \
    -openblas \
    gnu

make install -j${CPU_COUNT}

cp bin/cpptraj* $PREFIX/bin/
