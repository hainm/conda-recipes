#!/bin/bash

# Assume we already have Amber installed -- so copy the
fail() {
    echo "$1"
    exit 1
}

test -z $AMBERHOME && fail "Missing AMBERHOME"

if [ `uname` = "Darwin" ]; then
    test -f "$AMBERHOME/lib/libsander.dylib" || fail "Missing libsander.dylib"
    test -f "$AMBERHOME/lib/libsanderles.dylib" || fail "Missing libsanderles.dylib"
    mkdir -p $PREFIX/lib && \
        cp "$AMBERHOME/lib/libsander.dylib" "$AMBERHOME/lib/libsanderles.dylib" $PREFIX/lib
else
    test -f "$AMBERHOME/lib/libsander.so" || fail "Missing libsander.so"
    test -f "$AMBERHOME/lib/libsanderles.so" || fail "Missing libsanderles.so"
    mkdir -p $PREFIX/lib && \
        cp "$AMBERHOME/lib/libsander.so" "$AMBERHOME/lib/libsanderles.so" $PREFIX/lib
fi
test -f "$AMBERHOME/include/sander.h" || fail "Missing sander.h"

mkdir -p $PREFIX/include && cp "$AMBERHOME/include/sander.h" $PREFIX/include

$PYTHON setup.py install
