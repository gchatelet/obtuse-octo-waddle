#!/bin/bash
MAX_FILES=`find $1 -type f | wc -l`
for BITS in {1..128}
do
  MAX_COLLISION=`find $1 -type f | ./build/hash | cut -c-${BITS} | sort | uniq -c | cut -c-7 | python -c"import sys; print(sum((int(l)-1) for l in sys.stdin))"`
  echo "bits:${BITS} collisions:${MAX_COLLISION}/${MAX_FILES} = `python -c"import sys; print(float(${MAX_COLLISION})/${MAX_FILES})"`"
done
