##!/bin/bash

echo "== Checks if a REMOTE git repo has NEW COMMITS ==
";

function initGlobals(){
    set -Eeuo pipefail; # set -o xtrace;
    IFS=$'\n\t'
    readonly DIR=$PWD;
    readonly BRANCH_TO_CHECK="master";
    readonly ROOT_DIR="$(dirname "${DIR}")";
}

function getLatestCommitHashFromLocal(){
  echo "Collecting the HASH from the latest LOCAL commit..." >&2;
  local readonly LAST_LOCAL_COMMIT=`git rev-parse refs/heads/"${BRANCH_TO_CHECK}"`;
  echo $LAST_LOCAL_COMMIT >&2;
  echo $LAST_LOCAL_COMMIT;
}

function getLatestCommitHashFromRemote(){
  echo "Collecting the HASH from the latest REMOTE commit..." >&2;
  local readonly LAST_REMOTE_COMMIT=`git ls-remote origin -h refs/heads/"${BRANCH_TO_CHECK}" | awk '{ print $1}'`;
  echo $LAST_REMOTE_COMMIT >&2;
  echo $LAST_REMOTE_COMMIT;
}

function hasRemoteNewCommits(){
  echo "Checking if REMOTE git repo has NEW COMMITS..." >&2;
  local LOCAL_HASH=$(getLatestCommitHashFromLocal);
  local REMOTE_HASH=$(getLatestCommitHashFromRemote);

  if [[ $LOCAL_HASH != $REMOTE_HASH ]]; then
    echo true;
  else
    echo false;
  fi
}

initGlobals

readonly HAS_REMOTE_NEW_COMMITS=$(hasRemoteNewCommits);

if [[ $HAS_REMOTE_NEW_COMMITS = true ]]; then
  echo "REMOTE has new COMMITS!";
else
  echo "Nothing new."
fi