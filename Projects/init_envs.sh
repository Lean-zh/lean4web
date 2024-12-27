#!/bin/bash

cd "$(dirname "$0")"
for dir in v4.*; do
    (cd "$dir" && lake --version && lake update -R && lake build) &
done
wait