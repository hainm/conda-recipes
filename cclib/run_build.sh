#!/bin/sh

conda build --python=2.7 cclib
conda build --python=3.4 cclib
conda build --python=3.5 cclib
