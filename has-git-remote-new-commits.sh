#!/bin/bash

function getLatestCommitHashFromRemote(){
  echo "Collecting the HASH from the latest REMOTE commit...";
  echo `git ls-remote origin -h refs/heads/master | awk { print $1}`
}  

function getLatestCommitHashFromLocal(){
  echo "Collecting the HASH from the latest LOCAL commit...";
  git rev-parse refs/heads/master
}

function hasRemoteNewCommits(){
  echo "Checking if REMOTE git repo has NEW COMMITS...";
  LOCAL_HASH=getLatestCommitHashFromRemote;
  REMOTE_HASH=getLatestCommitHashFromLocal;

  if [[ $LOCAL_HASH == $REMOTE_HASH ]]; then
    true;
  else
    false
  fi
}

hasRemoteNewCommits