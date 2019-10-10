#!/bin/bash

echo "
=== Replace the letter 'N' in the word 'BANANA' with '*' ===
";

tr 'N' '-' <<< "BANANA";

echo "
=== More examples ===
* https://www.thegeekstuff.com/2012/12/linux-tr-command/
"

# Remove ':' from the date.
DATE_FILENAME=${DATE//:/}
