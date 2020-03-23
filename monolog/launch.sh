#!/bin/bash

fauxpipe=/tmp/monologpipe

trap "rm -f $fauxpipe" EXIT

terminator --title 'MONOLOG' \
  -e "nvim $fauxpipe -u ~/.config/nvim/monolog/config.vim -c startinsert"

sleep 1

while [ ! -f $fauxpipe ]
do
	sleep 0.2
done

outtext="$(cat $fauxpipe)"

oldclipboard=$(xsel -b -o)

printf '%s' "$outtext" | xsel -p -i
printf '%s' "$outtext" | xsel -b -i

sleep 0.3

xdotool key shift+Insert

sleep 0.5

echo $oldclipboard | xsel -b -i
