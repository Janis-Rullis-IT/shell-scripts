#!/bin/bash

echo "
=== Examples of  'if' conditions ===
";

echo 'Syntax: if CONDITIONS ; then
	...
else
	...
fi
';

non_existing_script='i-totaly-do-not-exist.sh';

echo "Simple boolean check to understand the structure:";

echo "";
echo "if true:";
if [[ true = true ]]; then
	echo '[[ true = true ]]';
fi

echo "";
echo "else if true != false:";
if [[ true != true ]]; then
	echo 'if [  true != true ]];';
elif [[ true != false ]]; then
	echo 'elif [[ true != false ]];';
fi

echo "";
echo "else:";
if [[ true != true ]]; then
	echo 'if [[  true != true ]];';
else
	echo 'else';
fi

echo "";
echo "Logical operators AND (&&), OR (||):";
if [[ true = true ]] && [[ false = false ]]; then
	echo '[[ true = true ]] && [[ false = false ]];';
fi

str_1='foo';
str_2='bar';

echo "";
echo "Compare strings '$str_1' and '$str_2':";

echo "";
echo "'$str_1' is equal to '$str_1':";
if [[ $str_1 == $str_1 ]]; then
	echo '[[ $str_1 == $str_1 ]];';
fi

echo "";
echo "'$str_1' is not equal to '$str_2':";
if [[ $str_1 != $str_2 ]]; then
	echo '[[ $str_1 != $str_2 ]];';
fi

echo "";
echo "The length of '$str_1' is greater than zero:";
if [[ -n $str_1 ]]; then
	echo '[[ -n $str_1 ]];';
fi

int_1=5;
int_2=3;
int_3=7;

echo "";
echo "Compare integers $int_1, $int_2 and int_3:";

echo "";
echo "$int_1 is equal to $int_1";

if (( $int_1 == $int_1 )); then
	echo '(( $int_1 == $int_1 ))';
fi

echo "";
echo "$int_1 is greater than $int_2";

if (( $int_1 > $int_2 )); then
	echo '(( $int_1 > $int_2 ))';
fi

echo "";
echo "$int_1 is less than int_3";

if (( $int_1 < int_3 )); then
	echo '(( $int_1 < int_3 ))';
fi

echo "";
echo "Check file:
-d FILE	exists and is a directory.
-e FILE	exists.
-r FILE	exists and the read permission is granted.
-s FILE	exists and it's size is greater than zero (ie. it is not empty).
-w FILE	exists and the write permission is granted.
-x FILE	exists and the execute permission is granted.
";

echo "";
echo "Is this script readable?:";
if [[ -r $0 ]]; then
	echo 'if [[ -r $0 ]]';
fi

echo "";
echo "Is non-existing script '$non_existing_script' NOT readable?:";
if [[ ! -r $non_existing_script ]]; then
	echo "if [[ ! -r $non_existing_script ]];";
fi


echo "
More info:
* https://linuxacademy.com/blog/linux/conditions-in-bash-scripting-if-statements/
* https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
* https://stackoverflow.com/a/13618376
* https://askubuntu.com/a/766845

";