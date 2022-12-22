#!/bin/bash

. /start-utils
if isTrue "${DEBUG_AUTOSTOP}"; then
  set -x
fi

/auto/resume.sh stop
logAutostopAction "Stopping Java process"
if isTrue "${AUTOSTOP_PKILL_USE_SUDO:-false}"; then
  sudo pkill -f --signal SIGTERM mc-server-runner
else
  pkill -f --signal SIGTERM mc-server-runner
fi
