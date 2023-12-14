#!/bin/bash

# Script to ensure that we can clone and build without error in 3 commands
# creates a temporary directory tmp/, clones and build the application.
# Returns 0 if no errors
# Returns 1 if error
if [ -d tmp ]; then
	rm -rf tmp
fi

mkdir tmp || { echo 'mkdir tmp failed' ; exit 1; }
cd tmp || { echo 'pushd tmp failed' ; exit 1; }

# Three key commands (ok technically 4)
git clone git@gitlab.com:johnmarianhoffman/personal-site-2.git || { echo 'git clone failed' ; exit 1; }
cd personal-site-2
make build || { echo 'make build failed' ; exit 1; }
APP_HOST=localhost APP_PORT=8181 make run || { echo 'make run failed' ; exit 1; }


cd ../../ || { echo 'popd failed' ; exit 1; }
exit 0;