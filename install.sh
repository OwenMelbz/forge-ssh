#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Creating key file"
touch "$DIR/forge.key"

echo "Creating manifest.json"
echo '{"servers": []}' > "$DIR/manifest.json"

echo "Installing app to /usr/local/bin/forge-ssh"
ln -s "$DIR/app.sh" "/usr/local/bin/forge-ssh"
