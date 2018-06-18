#!/bin/bash

echo "
=== Is Elixir OK? ===
Run tests and return status.
"

function initGlobals(){
  # echo "Define error reporting level, file seperator, and init direcotry.";
  set -Eeuo pipefail; # set -o xtrace;
  IFS=$'\n\t'
  readonly DATE_TIME=`date '+%Y%m%d%H%M%S'`;	
  readonly DIR=$PWD;
  readonly STORAGE_DIR="$DIR/storage"
  readonly LOG_DIR="$STORAGE_DIR/logs"
  readonly LOG_FILENAME="$DATE_TIME-tests.log"
  readonly LOG_FILE="$LOG_DIR/$LOG_FILENAME"
  readonly SUCCESS_KEYWORD=', 0 failures'
}

function prepareLogsDirectory(){
  # echo 'Prepare logs directory.'
  
  if [[ ! -d $STORAGE_DIR ]]; then
		mkdir $STORAGE_DIR;
    echo "Created $STORAGE_DIR"
	fi
  if [[ ! -d $LOG_DIR ]]; then
		mkdir $LOG_DIR;
    echo "Created $LOG_DIR"
	fi 
}

function runTests(){
  # echo "Run tests."
  mix test > $LOG_FILE

  # Silent.
  # mix test > $LOG_FILE 2>&1 &
  # sleep 15s
}

function doesFileContainString(){
	file=$1
	string=$2

  return `grep -q "$string" "$file"`
}

function areTestsSuccessful(){
  return `doesFileContainString $LOG_FILE $SUCCESS_KEYWORD`
}

initGlobals
prepareLogsDirectory
runTests

if areTestsSuccessful; then
  echo 'ok.'
else
  echo 'fail.'
fi
