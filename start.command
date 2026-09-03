#!/bin/zsh

# Optional launcher. Opening index.html directly already works for everything
# except "Load system fonts", which needs a secure context (localhost).
# This script serves the folder at http://localhost:4173 and opens Chrome.
cd "$(dirname "$0")" || exit 1

PORT=4173
URL="http://localhost:$PORT"

if ! lsof -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; then
  python3 server.py >/tmp/nameplate-studio.log 2>&1 &
  SERVER_PID=$!
  trap 'kill "$SERVER_PID" 2>/dev/null' EXIT INT TERM
fi

if [[ -d "/Applications/Google Chrome.app" ]]; then
  open -a "Google Chrome" "$URL"
else
  open "$URL"
fi

[[ -n "$SERVER_PID" ]] && wait "$SERVER_PID"
