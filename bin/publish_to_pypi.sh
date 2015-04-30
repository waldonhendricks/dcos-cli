#!/bin/bash -x
set -o errexit -o nounset -o pipefail

# move the dcos package
cd /dcos-cli

# move generated pypirc configuration to correct location
mv .pypirc ~/.pypirc

make clean env
source env/bin/activate
env/bin/python setup.py bdist_wheel upload
echo "Wheel should now be online at: https://pypi.python.org/pypi/dcos"
deactivate

# Move down to the dcoscli package
cd cli

make clean env
source env/bin/activate
env/bin/python setup.py bdist_wheel upload
echo "Wheel should now be online at: https://pypi.python.org/pypi/dcoscli"
deactivate
