#!/bin/bash

terminator --title 'MONOLOG' \
  -e "nvim -u ~/.config/nvim/monolog/config.vim -c startinsert"
