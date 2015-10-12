#!/bin/bash

cp -r $RECIPE_DIR/../ $SRC_DIR
cp -r $RECIPE_DIR/../../config.h $SRC_DIR
make install -f Makefile_conda
