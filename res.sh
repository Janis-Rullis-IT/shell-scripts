#!/bin/bash

echo "== Resize images with ImageMagick ==";

convert "*.png[250x>]" -set filename:base "%[base]" "%[filename:base]-250x.png"
