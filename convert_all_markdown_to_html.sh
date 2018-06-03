#!/usr/bin/env bash

find . -name *.md | xargs -I '{}' -t sh -c 'markdown {} >{}.html'
