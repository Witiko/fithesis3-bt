#!/bin/sh
# Maps the input containing thesis data in the following format:
#
#   FACULTY_ID DEGREE DEFENSE_YEAR MARK FILE_NR MIME SUFFIX <EMPTY> <EMPTY> PDF_CREATOR PDF_PRODUCER
#
# to a set of lines in the following format:
#
#   FACULTY_ID DEGREE_MAPPED DEFENSE_YEAR MARK USED_TEX
#
# where each line represents one thesis or dissertation.

parseColumn() {
  printf "%s\n" "$1" | cut -f $2 | sed 's/^"\(.*\)"$/\1/'
}

LASTID=0
TEX=0
IFS=$'\n'; while read -r line; do
  FACULTY="$(   parseColumn "$line" 1)"
  DEGREE="$(    parseColumn "$line" 2)"
  YEAR="$(      parseColumn "$line" 3)"
  MARK="$(      parseColumn "$line" 4)"
  ID="$(        parseColumn "$line" 5)"
  MIME="$(      parseColumn "$line" 6)"
  SUFFIX="$(    parseColumn "$line" 7)"
  HEURISTIC1="$(parseColumn "$line" 8)"
  HEURISTIC2="$(parseColumn "$line" 9)"
  CREATOR="$(   parseColumn "$line" 10)"
  PRODUCER="$(  parseColumn "$line" 11)"

  # Degree mapping
  case "$DEGREE" in
    C)    DEGREE=0;;
    B)    DEGREE=1;;
    [MN]) DEGREE=2;;
    [RD]) DEGREE=3;;
    *)    continue;;
  esac

  # We aggregate adjoining lines
  if [ $ID -lt $((LASTID + 1)) ]; then
    # A next student
    printf '%s\n' "$LASTOUTPUT"
    TEX=0
  fi; LASTID=$ID

  # Evaluating the TeX heuristic
  if [ -n "$HEURISTIC1" -o -n "$HEURISTIC2" ]     ||
     printf "%s\n" "$SUFFIX"   | grep -iq '^tex$' ||
     printf "%s\n" "$CREATOR"  | fgrep -q 'TeX'   ||
     printf "%s\n" "$PRODUCER" | fgrep -q 'TeX'; then
    TEX=1
  fi
  
  LASTOUTPUT="$(printf '%d\t%d\t%d\t%d\t%c\t%d\n'\
    $FACULTY $DEGREE $YEAR $MARK $TEX)"

done
printf '%s\n' "$LASTOUTPUT"
