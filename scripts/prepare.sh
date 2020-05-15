#!/bin/bash

PACKAGE_NAME="src"
BUILD_DIR="dist"

PROTO_FILE_NAME="ql2.proto"
PROTO_FILE_URL="https://raw.githubusercontent.com/rethinkdb/rethinkdb/next/src/rdb_protocol/${PROTO_FILE_NAME}"
TARGET_PROTO_FILE="${BUILD_DIR}/${PROTO_FILE_NAME}"

FILE_CONVERTER_NAME="./scripts/convert_protofile.py"

CONVERTED_PROTO_FILE_NAME="proto-def.js"
TARGET_CONVERTED_PROTO_FILE="${BUILD_DIR}/${CONVERTED_PROTO_FILE_NAME}"

rm -rf ${BUILD_DIR}
mkdir ${BUILD_DIR}
curl -qo ${TARGET_PROTO_FILE} ${PROTO_FILE_URL}
python ${FILE_CONVERTER_NAME} -l javascript -i ${TARGET_PROTO_FILE} -o ${TARGET_CONVERTED_PROTO_FILE}
rm -rf ${TARGET_PROTO_FILE}
