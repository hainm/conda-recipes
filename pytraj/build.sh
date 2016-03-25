#!/bin/sh

export CPPTRAJ_LIBDIR=$PREFIX/lib/
export CPPTRAJ_HEADERDIR=$PREFIX/include/cpptraj/

PLATFORM=`uname -s | awk '{print $1}'`

if [[ $PLATFORM = "Darwin" ]] ; then
    $PYTHON setup.py install --disable-openmp
else
    # $PYTHON setup.py clean
    $PYTHON setup.py install
fi
