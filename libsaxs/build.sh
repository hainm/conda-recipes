#!/bin/bash

cp -r $RECIPE_DIR/../ $SRC_DIR

# config.h from AMBERHOME
cp -r $RECIPE_DIR/../../config.h $SRC_DIR

mkdir -p $PREFIX/include/saxs/
mkdir $PREFIX/lib/

make lib -f $RECIPE_DIR/Makefile
cp *.h $PREFIX/include/saxs/
cp libsaxs_md.so libsaxs_rism.so $PREFIX/lib/
