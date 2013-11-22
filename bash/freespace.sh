#!/bin/sh

df -h $(pwd) | grep -v Filesystem | sed -r "s/\s{1,}/,/g" | cut -d, --output-delimiter=\| -f2,4
