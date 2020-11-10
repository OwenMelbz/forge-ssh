#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Installing app to /usr/local/bin/forge-ssh"

touch "$DIR/forge.key"

echo '{"servers": []}' > "$DIR/manifest.json"

#ln -s "$DIR/app.sh" "/usr/local/bin/forge-ssh"
