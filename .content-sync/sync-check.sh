#!/usr/bin/env bash
# sync-check.sh — pure-bash diff of agentcore-features example listing.
#
# Usage (call from your existing workshop init script):
#   bash sync-check.sh          # diff only; exits 0 if clean, 1 if changes found
#   bash sync-check.sh --apply  # diff + invoke Claude for INDEX.md updates if needed
#
# Writes .content-sync/pending-diff.json when changes are detected.
# On successful Claude run (--apply), persists the new listing as the baseline.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WORKSHOP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BASELINE="$SCRIPT_DIR/examples.listing"
PENDING="$SCRIPT_DIR/pending-diff.json"
LIST_SCRIPT="$SCRIPT_DIR/list-examples.sh"
FEATURES_DIR="$WORKSHOP_DIR/agentcore-features"
PAGES_DIR="$WORKSHOP_DIR/workshop-pages"
APPLY=0

for arg in "$@"; do
  [[ "$arg" == "--apply" ]] && APPLY=1
done

# ── 1. Generate current listing ───────────────────────────────────────────────
CURRENT=$(bash "$LIST_SCRIPT")

# ── 2. Load baseline (strip comment lines) ────────────────────────────────────
if [[ ! -f "$BASELINE" ]]; then
  echo "No baseline found at $BASELINE — run: bash list-examples.sh --save" >&2
  exit 2
fi
SAVED=$(grep -v '^#' "$BASELINE" | grep -v '^$')

# ── 3. Compute diff ───────────────────────────────────────────────────────────
ADDED=$(comm -13 <(echo "$SAVED") <(echo "$CURRENT"))
REMOVED=$(comm -23 <(echo "$SAVED") <(echo "$CURRENT"))

if [[ -z "$ADDED" && -z "$REMOVED" ]]; then
  echo "index-sync: no changes detected." >&2
  exit 0
fi

echo "index-sync: $(echo "$ADDED" | grep -c . || true) added, $(echo "$REMOVED" | grep -c . || true) removed" >&2
[[ -n "$ADDED"   ]] && echo "$ADDED"   | sed 's/^/  + /' >&2
[[ -n "$REMOVED" ]] && echo "$REMOVED" | sed 's/^/  - /' >&2

# ── 4. Write pending-diff.json — includes section classification ──────────────
python3 - <<PYEOF
import json, os, sys

added   = [l for l in """$ADDED""".splitlines()   if l.strip()]
removed = [l for l in """$REMOVED""".splitlines() if l.strip()]

sections = {}
for path in added:
    sec = path.split('/')[0]
    sections.setdefault(sec, {'added': [], 'removed': []})['added'].append(path)
for path in removed:
    sec = path.split('/')[0]
    sections.setdefault(sec, {'added': [], 'removed': []})['removed'].append(path)

# Classify each section on disk — no guessing needed
features_dir = '$FEATURES_DIR'
pages_dir    = '$PAGES_DIR'
for sec, data in sections.items():
    data['section_dir_exists'] = os.path.isdir(os.path.join(features_dir, sec))
    data['page_exists']        = os.path.isfile(os.path.join(pages_dir, sec + '.md'))

# Derived classification (informational — workflow uses the booleans above)
for sec, data in sections.items():
    if data['section_dir_exists'] and not data['page_exists']:
        data['classification'] = 'new_section'
    elif not data['section_dir_exists'] and data['page_exists']:
        data['classification'] = 'deleted_section'
    else:
        data['classification'] = 'changed'

out = {
    'added':    added,
    'removed':  removed,
    'sections': sections,
    'current_listing': [l for l in """$CURRENT""".splitlines() if l.strip()],
}
with open('$PENDING', 'w') as f:
    json.dump(out, f, indent=2)

counts = {}
for d in sections.values():
    counts[d['classification']] = counts.get(d['classification'], 0) + 1
print(f"pending-diff written: {len(sections)} section(s) — {counts}", file=sys.stderr)
PYEOF

[[ $APPLY -eq 0 ]] && exit 1   # signal to caller that changes exist, but don't run Claude

# ── 5. Invoke Claude for INDEX.md patches ────────────────────────────────────
echo "index-sync: invoking Claude to patch INDEX.md files..." >&2
claude -p "/index-sync"
CLAUDE_EXIT=$?

if [[ $CLAUDE_EXIT -ne 0 ]]; then
  echo "index-sync: Claude run failed (exit $CLAUDE_EXIT) — baseline NOT updated." >&2
  exit $CLAUDE_EXIT
fi

# ── 6. Persist new baseline ───────────────────────────────────────────────────
{
  echo "# agentcore-features example listing"
  echo "# generated: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "# root: $WORKSHOP_DIR/agentcore-features"
  echo "$CURRENT"
} > "$BASELINE"
rm -f "$PENDING"
echo "index-sync: baseline updated ($(echo "$CURRENT" | wc -l | tr -d ' ') examples)." >&2
