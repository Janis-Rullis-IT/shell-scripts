#!/bin/bash

echo "New lines are not stored if you just 'echo Text with newlines'";
echo "";
echo "SOLUTION 1:";
echo "Add -e parameter to echo like this";
echo 'echo -e "First line\nSecond line" > tmp-multiple-lines.md;';

echo -e "First line\nSecond line" > tmp-multiple-lines.md;

echo "SOLUTION 2:";
echo 'printf "First line\nSecond line" > tmp-multiple-lines.md;';