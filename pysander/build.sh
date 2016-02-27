#!/bin/bash

# Assume we already have Amber installed -- so copy the
fail() {
    echo "$1"
    exit 1
}

test -z $AMBERHOME && fail "Missing AMBERHOME"
test -f "$AMBERHOME/lib/libsander.so" || fail "Missing libsander.so"
test -f "$AMBERHOME/lib/libsanderles.so" || fail "Missing libsanderles.so"
test -f "$AMBERHOME/include/sander.h" || fail "Missing sander.h"

mkdir -p $PREFIX/lib && cp "$AMBERHOME/lib/libsander*.so" $PREFIX/lib
mkdir -p $PREFIX/include && cp "$AMBERHOME/include/sander.h" $PREFIX/include

python setup.py install
