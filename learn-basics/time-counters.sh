#/bin/bash
# https://superuser.com/a/611582

echo "== 10 seconds to 0 ==
";

seconds=10; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ge `date +%s` ]; do 
    echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
done
echo 'Done.'