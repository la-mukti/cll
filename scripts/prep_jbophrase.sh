#!/bin/sh

IFS='
'

rm scripts/lojban_quotes  scripts/non_lojban_quotes
touch scripts/lojban_quotes  scripts/non_lojban_quotes

for line in $(grep '<quote>' [0-9]*.xml | sed "s;</quote>;</quote>\\${IFS};" | grep '<quote>.*</quote>' | sed 's/.*<quote>/<quote>/' | LC_ALL=C sort | uniq | sed 's/^[[:space]]*//g' | sed 's/[[:space]]*$//')
do
  inside=$(echo $line | sed 's/<quote>//' | sed 's/<\/quote>//')
#  echo "inside: $inside"
#  echo "$inside" | jbofihe >/dev/null 2>&1 && echo "$inside"
  camxescheck=$(echo "$inside" | camxes -ft | grep -v requested)
  if [ "$inside" = "$camxescheck" ]
  then
    echo "$inside" >>scripts/lojban_quotes
  else
    echo "$inside" >>scripts/non_lojban_quotes
  fi
done

