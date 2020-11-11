#/usr/bin/env bash

DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

_forge_completions()
{
  SERVERS=`node $DIR/autocomplete.js`
  SERVERS=($SERVERS)

  for element in "${SERVERS[@]}"
  do
      COMPREPLY+=("$element")
  done
}

complete -F _forge_completions forge-ssh
