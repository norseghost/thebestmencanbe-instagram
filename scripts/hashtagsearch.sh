#!/bin/bash

# all hahtags, sequentially, no filename
# FIXME: Parameterize the what-to-search part
# TODO: can one call ripgrep directly?
rg '(?<=\s|^)#(\w*[A-Za-z_]+\w*)' --pcre2 -o --no-column --no-line-number --no-heading -I *.txt

# All hashtags, prefixed by filename
# since filename is a date, this would allow 
# timeline creation and analysis
# rg '(?<=\s|^)#(\w*[A-Za-z_]+\w*)' --pcre2 -o --no-column --no-line-number --no-heading *.txt
