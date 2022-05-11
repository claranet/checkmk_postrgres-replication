#!/bin/bash

VERSION=$(cat VERSION)
BUILD_DIR=./build
BUILD_DIR=$(realpath ${BUILD_DIR})
mkdir -p ${BUILD_DIR}

for d in src/*/; do
  tar cf ${BUILD_DIR}/$(basename $d).tar -C $d $(ls -1 $d | xargs)
done

cp ./src/info ${BUILD_DIR}
cp ./src/info.json ${BUILD_DIR}

tar czf checkmk_postgres_replication_${VERSION}.mkp -C ${BUILD_DIR} $(ls -1 $BUILD_DIR| xargs)

#rm -rf $BUILD_DIR
