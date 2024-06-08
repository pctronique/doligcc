#/////////////////////////////////////
#//    DEVELOPPEUR : PCTRONIQUE     //
#/////////////////////////////////////

#!/bin/sh

rm -rf dist
mkdir dist
rm -rf build
mkdir build
cd build
cmake ../
make
cd ..
rm -rf build
