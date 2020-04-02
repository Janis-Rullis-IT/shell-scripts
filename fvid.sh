#!/bin/bash

echo "== Copy 1920x JPGs here ==";

for f in `find $1 -name "*1920x.jpg"`
do
        echo $f;
        cp $f .
done

