#!/bin/bash
KILL_AFTER_S=30
npm run dev > /dev/null 2>&1 &
PROC_ID=$!
echo "Will kill this after ${KILL_AFTER_S} seconds."
sleep $KILL_VUE_WATCHER_AFTER_S && kill -9 $PROC_ID 