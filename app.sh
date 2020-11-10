#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

if [ -z "$1" ]
then
  echo
  echo "Please provide a server name."
  echo
  exit 1
fi

if [ $1 = "update" ]; then
  echo
  echo "Updating server manifest."
  echo
  node $DIR/sync.js
  exit 0
fi

if [ $1 = "list" ]; then
  echo
  echo "Connected servers:"
  echo
  node $DIR/sync.js
  node $DIR/list-servers.js
  exit 0
fi

echo "Looking for server named: $1."

IP=`node $DIR/find-server.js $1`

if [ -z "$IP" ]
then
  echo
  echo "Could not find server name $1."
  echo
  exit 1
fi

echo
echo "Connecting to $1 on $IP."
echo

ssh forge@$IP
