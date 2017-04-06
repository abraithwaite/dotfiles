function u2d () {
if [[ $# > 0 ]]; then
  date -u -Iseconds -d @$1
else
  date -u -Iseconds
fi
}

function d2u () {
if [[ $# > 0 ]]; then
  date -u -d $1 +%s
else
  date -u +%s
fi
}