#!/bin/bash

echo "
=== Replace the letter 'N' in the word 'BANANA' with '*' ===
";

tr 'N' '-' <<< "BANANA";

echo "
=== More examples ===
* https://www.thegeekstuff.com/2012/12/linux-tr-command/
"

# #2 Remove ':' from the date.
DATE_W_HYPENS=`tr ':' '-' <<< ${DATE}`;
DATE_W_DOTS=`tr ':' '.' <<< ${DATE}`.;
DATE_SHORT=${DATE//:/};

# Remove user_id

USER_ID_STR=${USER_ID_STR/'--user_id='/}
