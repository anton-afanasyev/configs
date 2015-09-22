#!/bin/sh

df -h $(pwd) | grep -v Filesystem | grep -v Файл.система | sed -r "s/\s{1,}/,/g" | cut -d, --output-delimiter=\| -f2,4
