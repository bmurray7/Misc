#!/bin/sh
if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [regular expression]"
  exit 0
fi
find . -name "*.jar"|while read f
do
  result=$(unzip -p  $f|strings | grep   $1)
  if [ "$result" ]; then
    echo $f
    echo $result|grep  --color $1
    echo
  fi
  
done
