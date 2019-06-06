#!/bin/bash
#
# datacleanup.sh
# 
# Usage: datacleanup.sh somedir/
# Will parse filenames in a directory for date information
# (in YYYY-MM-DD format, at start of filename) and copies any that
# fall within begin_ts and end_ts to a new directory

# TODO:
# - accept prefix/output dir as parameter
# - accpt daterange as parameter
# - only require one of begin/end date

#Date cutoffs

begin_ts=$(date --date="2019-01-13" +%s)
end_ts=$(date --date="2019-04-08" +%s)

# backup dir
# currently made in script exection dir
# FIXME: be smarter about this
prefix="filtered"
if [ ! -d "${prefix}_${1}" ]; then
   mkdir "${prefix}_${1}"
fi

for file in ${1}*; do
    # parse file date
    file_date=$(echo $file | cut -d '_' -f1 |cut -d '/' -f2 )
    # convert to a timestamp
    file_ts=$(date --date=$file_date +%s)
    # compare file timestamp to desired range
    if [ "$file_ts" -gt "$begin_ts" -a  "$file_ts" -lt "$end_ts" ]; then
        # copy files to output dir
        cp "$file" "${prefix}_${1}"
     fi
 done

