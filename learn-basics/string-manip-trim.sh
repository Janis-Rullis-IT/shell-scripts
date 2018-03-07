#!/bin/bash
# http://tldp.org/LDP/abs/html/string-manipulation.html

stringZ=abcABC123ABCabc
#       0123456789.....
#       0-based indexing.

# Trim.
echo ${stringZ:0}                            # abcABC123ABCabc
echo ${stringZ:1}                            # bcABC123ABCabc
echo ${stringZ:7}                            # 23ABCabc


echo ${stringZ: -4}                          # Cabc

## Remove extension.
y=${x%.*}
echo ${y##*/}
