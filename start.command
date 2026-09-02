#!/bin/zsh

# Serve the folder locally so canvas export works consistently in every browser.
cd "$(dirname "$0")" || exit 1
PORT=4173
python3 -m http.server "$PORT" >/tmp/name-card-generator.log 2>&1 &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null' EXIT INT TERM
if open -Ra "Google Chrome"; then
  open -a "Google Chrome" "http://localhost:$PORT"
else
  open "http://localhost:$PORT"
fi
wait "$SERVER_PID"
