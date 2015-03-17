#!/bin/sh
# Tests the availability of the commands given as positional params.
for cmd; do
  type "$cmd" >/dev/null 2>&1 || { echo >&2 "Command \`$cmd\` is unavailable."; exit 1; }
done
