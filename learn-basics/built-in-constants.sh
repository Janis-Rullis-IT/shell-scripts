#!/bin/bash

echo '
=== Built-in constants like $PWD (Print work directory) ===
';

echo "PWD=$PWD";
echo "OLDPWD=$OLDPWD";
echo "IFS=$IFS";
echo "LC_COLLATE=$LC_COLLATE";
echo "LC_CTYPE=$LC_CTYPE";
echo "SHELL=$SHELL";
echo "HISTFILE=$HISTFILE";
echo "USER=$USER";
echo "EUID=$EUID";
echo "UID=$UID";
echo "GROUPS=$GROUPS";
echo "HOSTNAME=$HOSTNAME";
echo "HOSTTYPE=$HOSTTYPE";
echo "MACHTYPE=$MACHTYPE";
echo "OSTYPE=$OSTYPE";
echo "HOME=$HOME";

echo "TERM=$TERM";
echo "TMOUT=$TMOUT";
echo "SHLVL=$SHLVL";
echo "SHELLOPTS=$SHELLOPTS";
echo "PATH=$PATH";
echo "PIPESTATUS=$PIPESTATUS";
echo "BASH_VERSION=$BASH_VERSION";
echo "PPID=$PPID";
echo "PROMPT_COMMAND=$PROMPT_COMMAND";
echo "PS1=$PS1";
echo "PS2=$PS2";
echo "PS3=$PS3";
echo "PS4=$PS4";

echo "RANDOM=$RANDOM";
echo "LINENO=$LINENO";
echo "REPLY=$REPLY";

echo "SECONDS=$SECONDS";
echo "REPLY=$REPLY";

echo "0=$0";
echo "1=$1";
echo "2=$2";
echo "3=$3";
echo "9=$9";

echo "-=$-";
echo "*=$*";
echo "@=$@";
echo "#=$#";
echo "$=$$";

echo "!=$!";
echo "?=$?";
echo "_=$_";

echo "
More info:
* http://tldp.org/LDP/abs/html/internalvariables.html
* https://www.linuxnix.com/linux-shell-inbuild-variables-system-admin/
"