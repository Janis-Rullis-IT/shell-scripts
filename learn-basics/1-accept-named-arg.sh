# set -Eeuo pipefail; # set -o xtrace;
IFS=$'\n\t'

USER_ID_ERROR='Pass the list of user IDs like this --user_id=1,2,3';
if [[ ! -n $1 ]]; then
  echo ${USER_ID_ERROR}
  exit;
fi
if [[ "$1" != *"--user="* ]]; then
  echo ${USER_ID_ERROR}
  exit;
fi
USER_IDS_STR=$1
USER_IDS_STR=${USER_IDS_STR/'--USER_id='/}
if [ -z "$USER_IDS_STR" ]; then
  echo ${USER_ID_ERROR}
  exit;
fi
USER_IDS=(`tr ',' '\n' <<< $USER_IDS_STR;`)
if [ ${#USER_IDS[@]} == 0 ]; then
  echo ${USER_ID_ERROR}
  exit;
fi

echo "================="

for USER_ID in ${USER_IDS[@]}; do
	echo $USER_ID
done
