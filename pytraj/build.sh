#!/bin/sh

export CPPTRAJ_LIBDIR=$PREFIX/lib/
export CPPTRAJ_HEADERDIR=$PREFIX/include/cpptraj/

# $PYTHON setup.py clean
$PYTHON setup.py install --disable-openmp
