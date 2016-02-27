#!/bin/sh

package=$1
conda build --python '2.7' $package || exit 1
conda build --python '3.4' $package || exit 1
conda build --python '3.5' $package || exit 1
