#!/usr/bin/env bash

sudo pip install grip
find . -name *.md | xargs -I '{}' -t sh -c 'grip {} --export'
