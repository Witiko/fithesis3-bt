#!/bin/sh
# Removes empty pages from "$1" while retaining bookmark entries.
# The result is stored in "$2".

# Retrieve information about empty pages
PAGES=`mktemp`
toolbox/detect-nonempty.pl "$1" > $PAGES

# Retrieves bookmarks metadata from the input document
DATA1=`mktemp`
pdftk "$1" dump_data_utf8 | sed -n /^Bookmark/p > $DATA1

# Remove bookmark entries for missing pages and shift
# the page numbers of existing entries.
while read PAGE MISSING; do
  TEMP=`mktemp`
  if [ -z $MISSING ]; then
    sed -En '/BookmarkBegin/{N;N;N;/BookmarkPageNumber:\s*'$PAGE'$/!p}' $DATA1 > $TEMP
  else
    sed -E '/BookmarkBegin/{N;N;N;s/(BookmarkPageNumber:\s*)'$PAGE'$/\1'$(($PAGE-$MISSING))'/}' $DATA1 > $TEMP
  fi
  mv $TEMP $DATA1
done < $PAGES

# Remove the pages and inject the updated bookmarks
DATA2=`mktemp`; DATA3=`mktemp`; TEMP=`mktemp`
pdftk "$1" cat `< $PAGES sed -En 's/(.*)\t.*/\1/p'` output $TEMP
pdftk $TEMP dump_data_utf8 | sed -n /^Bookmark/\!p > $DATA2
cat $DATA1 $DATA2 > $DATA3
pdftk $TEMP update_info_utf8 $DATA3 output "$2"

# Clean up
rm $DATA1 $DATA2 $DATA3 $PAGES $TEMP