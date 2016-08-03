#!/bin/bash
while :
do
  clear
  cat<<EOF
  -----------------------------------
         -- Scenario Loader --

  r = (r)andomize
  b = revert to (b)aseline
  q = (q)uit

  -----------------------------------

EOF

source scenarios/c
echo "  "Currently loaded scenario is [$SCENARIO].
echo
echo "  Enter Command:"

  read -n1 -s
  case "$REPLY" in
  "r") echo "  Applying Randomization."; r=$(shuf -i '1-4' -n '1'); cp scenarios/$r scenarios/c;;
  "b") echo "  Reverting to Baseline."; cp scenarios/0 s cenarios/c;;
  "q") echo "  Quitting..."; break;;
  *) echo    Invalid option;;
  esac

  sleep 1
done
