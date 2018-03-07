#!/bin/bash

## Make globally available with:
# sudo cp res.sh /usr/local/bin/res
# sudo chmod a+x /usr/local/bin/res

echo "== Resize images with ImageMagick ==";

convert "*.png[250x>]" -set filename:base "%[base]" "%[filename:base]-250x.png"
