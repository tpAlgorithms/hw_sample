#!/bin/bash

target=$1
prog=$2

for f in $(ls ${target}/tests/*.dat); do
  $prog < $f > $f.out
  if cmp $f.out $f.ans; then
    echo "OK $f" #> /dev/null
  else
    echo Differs $f.out  $f.ans
  fi

done
