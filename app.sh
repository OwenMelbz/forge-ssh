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
  exit 1
fi

if [ $1 = "update" ]; then
  echo
  echo "Updating server manifest."
  node $DIR/sync.js
  exit 0
fi

echo "Looking for server named: $1."

IP=`node $DIR/find-server.js $1`

if [ -z "$IP" ]
then
  echo
  echo "Could not find server name $1."
  exit 1
fi

echo "Connecting to $1 on $IP."

ssh forge@$IP
