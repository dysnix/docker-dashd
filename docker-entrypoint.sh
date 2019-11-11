#!/bin/bash
set -e
GOSU="gosu dash"
# don't use gosu when id is not 0
if [ "$(id -u)" -ne "0" ];then
  GOSU=""
fi
if [[ "$1" == "dash-cli" || "$1" == "dash-tx" || "$1" == "dashd" || "$1" == "test_dash" ]]; then
	exec $GOSU "$@"
else
  exec $GOSU dashd "$@"
fi
