#!/bin/bash

terminator --title 'MONOLOG' \
  -e "nvim $fauxpipe -u ~/.config/nvim/monolog/config.vim -c startinsert"
