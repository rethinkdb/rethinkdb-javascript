#!/bin/bash

ls -1 src/*.coffee | while read fname; do
  fname=$(basename "${fname}" | cut -f 1 -d '.')
  coffee -b -p -c "src/${fname}.coffee" > "dist/${fname}.js"
done
