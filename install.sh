#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing app to /usr/local/bin/forge"

touch "$DIR/forge.key"

ln -s "$DIR/app.sh" "/usr/local/bin/forge"
