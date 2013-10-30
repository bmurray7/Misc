#!/bin/sh
if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` regex [search path] "
  exit 0
fi

searchPath="$2"
if [ -z "$2" ]; then
  searchPath="."
fi

find $2 -name "*.jar"|while read f
do
  result=$(unzip -p  $f|strings | grep   $1)
  if [ "$result" ]; then
    echo $f
    echo $result|grep  --color $1
    echo
  fi
  
done
