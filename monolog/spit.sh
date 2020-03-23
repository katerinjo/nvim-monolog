outtext="$(cat -)"

oldclipboard=$(xsel -b -o)

printf '%s' "$outtext" | xsel -p -i
printf '%s' "$outtext" | xsel -b -i

sleep 0.3

xdotool key shift+Insert

sleep 0.5

echo $oldclipboard | xsel -b -i

