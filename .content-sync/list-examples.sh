#!/usr/bin/env bash
# List every "leaf" directory under agentcore-features whose name starts with
# two digits — i.e. a numbered directory that contains no further numbered
# subdirectories (the final layer in the numeric hierarchy).
#
# Usage:
#   ./list-examples.sh                  # print to stdout
#   ./list-examples.sh --save           # print to stdout AND write .content-sync/examples.listing
#   ./list-examples.sh <root>           # use a custom agentcore-features root
#   ./list-examples.sh <root> --save    # both

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSHOP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT="$WORKSHOP_DIR/agentcore-features"
SAVE=0
LISTING_FILE="$SCRIPT_DIR/examples.listing"

for arg in "$@"; do
  case "$arg" in
    --save) SAVE=1 ;;
    *)      ROOT="$arg" ;;
  esac
done

listing=$(find "$ROOT" -mindepth 1 -type d -name '[0-9][0-9]*' | sort | while IFS= read -r dir; do
  if ! find "$dir" -mindepth 1 -type d -name '[0-9][0-9]*' -print -quit | grep -q .; then
    # store paths relative to ROOT so the listing is portable
    echo "${dir#"$ROOT/"}"
  fi
done)

echo "$listing"

if [[ $SAVE -eq 1 ]]; then
  {
    echo "# agentcore-features example listing"
    echo "# generated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    echo "# root: $ROOT"
    echo "$listing"
  } > "$LISTING_FILE"
  echo "→ saved to $LISTING_FILE" >&2
fi
