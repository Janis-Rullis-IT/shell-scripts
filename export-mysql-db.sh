#!/bin/bash
# Export and archive a MYSQL database.

readonly DATABASE=$1;
readonly DATE_TIME=`date '+%Y%m%d%H%M%S'`;	
readonly TARGET=$DATE_TIME-$DATABASE.sql

mysqldump --single-transaction=TRUE -uroot -p --default-character-set=utf8 $DATABASE > $TARGET;
7z a $TARGET.7z $TARGET;
