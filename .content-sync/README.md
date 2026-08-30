# .content-sync

Keeps the workshop `INDEX.md` files in sync with the `agentcore-features/` directory tree, which is maintained in an external git repository and periodically refreshed.

## How it works

```
agentcore-features/ (external repo)
        │
        ▼
  list-examples.sh ── generates listing of all leaf example directories
        │
        ▼
  sync-check.sh ── diffs listing against saved baseline
        │
        ├── no changes → exit 0, nothing to do
        │
        └── changes found → writes pending-diff.json
                │
                ▼ (--apply only)
          claude -p "/index-sync" ── patches affected INDEX.md files
                │
                ▼
          baseline updated, pending-diff.json removed
```

Claude is only invoked when there are actual changes, and only edits the `INDEX.md` files for sections that changed.

## Files

| File | Description |
|------|-------------|
| `list-examples.sh` | Scans `agentcore-features/` and prints all leaf directories whose name starts with two digits — one path per line, relative to `agentcore-features/` |
| `sync-check.sh` | Diffs the current listing against `examples.listing`; optionally invokes Claude and persists the new baseline |
| `examples.listing` | Baseline snapshot — the listing that the current `INDEX.md` files were built from. Commit this alongside any `INDEX.md` changes to keep them in sync |

## Usage

### Check for changes (no Claude, no writes)
```bash
bash .content-sync/sync-check.sh
# exit 0 → nothing changed
# exit 1 → changes found, pending-diff.json written
# exit 2 → no baseline found (run --save first)
```

### Check and apply updates
```bash
bash .content-sync/sync-check.sh --apply
```
Diffs, invokes `claude -p "/index-sync"` if needed, then persists the new baseline.

### Regenerate the baseline from scratch
```bash
bash .content-sync/list-examples.sh --save
```
Use this after a bulk content update or when first setting up the workshop.

### Add to your workshop init script
```bash
bash "$(dirname "$0")/.content-sync/sync-check.sh" --apply
```

## Workflow: `/index-sync`

The Claude workflow lives at `.claude/workflows/index-sync.js`. It is driven entirely by `pending-diff.json` — it does not re-run the diff itself.

For each affected top-level section (e.g. `01-harness`, `07-centralize-...`) it spawns one agent that:
1. Reads the section's `INDEX.md`
2. Reads the `README.md` of each added example to get a description
3. Inserts or removes table rows to match the new listing

Sections are processed in parallel. The baseline is persisted by `sync-check.sh` after the workflow exits successfully, not by the workflow itself.

## Periodic persistence

To avoid INDEX.md drift growing too large, commit both `examples.listing` and any updated `INDEX.md` files together after each sync cycle:

```bash
git add .content-sync/examples.listing **/INDEX.md
git commit -m "chore: sync INDEX.md to latest agentcore-features"
```
