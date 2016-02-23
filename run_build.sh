#!/bin/sh

package=$1
conda build --python '2.7' $package
conda build --python '3.4' $package 
conda build --python '3.5' $package 
