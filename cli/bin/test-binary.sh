#!/bin/bash -e

BASEDIR=`dirname $0`/..

cd $BASEDIR

if [ -f "$BASEDIR/env/bin/activate" ]; then
        source $BASEDIR/env/bin/activate
else
        $BASEDIR/env/Scripts/activate
fi

DCOS_CONFIG=tests/data/dcos.toml
PATH=$(pwd)/dist:$PATH
py.test tests/integrations
deactivate
