#!/bin/bash

target=$1
prog=$2

mkdir -p $target/tmp
for f in $(ls ${target}/tests/*.dat); do
  N=$(basename $f)
  $prog < $f > ${target}/tmp/$N.out
  if diff  ${target}/tmp/$N.out  $f.ans; then
    echo "OK $f" > /dev/null
  else
    echo Differs ${target}/tmp/$N.out  $f.ans
  fi

done
