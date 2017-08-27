#!/bin/bash

pushd /io

source /env.sh

pushd arrow/cpp/build
make install
popd

pushd parquet-cpp/build
make install
popd

pushd arrow/python
python setup.py build_ext --build-type=$ARROW_BUILD_TYPE \
       --with-parquet --inplace

/bin/bash
