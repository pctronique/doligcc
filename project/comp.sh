#/////////////////////////////////////
#//    DEVELOPPEUR : PCTRONIQUE     //
#/////////////////////////////////////

#!/bin/sh

cd ${0%/*}

while read line  
do
    if [[ (! $line =~ ^#.*) && ($line =~ .*=.*) ]]; then
        export "$line"
    fi
done < ${0%/*}/.env

rm -rf dist
mkdir dist
rm -rf build
mkdir build
cd build
cmake ../
make
cd ..
rm -rf build
