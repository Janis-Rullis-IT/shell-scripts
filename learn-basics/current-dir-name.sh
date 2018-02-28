#!/bin/bash

echo "
=== Print current directory's name ===
";

result=${PWD##*/};
echo $result;
