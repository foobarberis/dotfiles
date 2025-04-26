#!/bin/sh

TAG=$(grep -e "--\[ @[0-9]*." | awk '{print $3}' | sort -u | fzf)
echo $TAG
