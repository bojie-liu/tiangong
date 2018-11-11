#!/bin/bash

set -e

if [ -n "$1" ] ;then
    APP_PATH=$1
else
    echo "Input app path"
    exit 1
fi
DEPLOY_TOOL=/Users/joshualiu/dev/Qt/5.11.0/clang_64/bin/macdeployqt

${DEPLOY_TOOL} ${APP_PATH} -libpath=/Users/joshualiu/dev/env/PythonQt3.2/lib/ -libpath+=/Library/Frameworks/Python.framework/Versions/3.7/lib/
