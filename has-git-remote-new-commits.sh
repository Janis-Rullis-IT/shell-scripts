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

function getLatestCommitHashFromRemote(){
  echo "Collecting the HASH from the latest REMOTE commit...";
  readonly LAST_REMOTE_COMMIT_SHORT==`git ls-remote origin -h refs/heads/"${BRANCH_TO_CHECK}" | awk '{ print $1}'`;
  echo $LAST_REMOTE_COMMIT_SHORT;
}  

function getLatestCommitHashFromLocal(){
  echo "Collecting the HASH from the latest LOCAL commit...";
  git rev-parse refs/heads/master
}

function hasRemoteNewCommits(){
  echo "Checking if REMOTE git repo has NEW COMMITS...";
  LOCAL_HASH=getLatestCommitHashFromRemote;
  REMOTE_HASH=getLatestCommitHashFromLocal;

  #ocal res=$(fun1)

  if [[ $LOCAL_HASH == $REMOTE_HASH ]]; then
    true;
  else
    false
  fi
}

initGlobals
getLatestCommitHashFromRemote
# getLatestCommitHashFromLocal
# hasRemoteNewCommits