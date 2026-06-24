#!/usr/bin/env bash
set -euo pipefail

# Run lightweight Beam reference checks. If sibling app repos are available,
# report their presence without treating Beam as their runtime owner.
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROOT_DIR="$(cd "${BASE_DIR}/.." && pwd)"

required_files=(
  "README.md"
  "docs/COORDINATION.md"
  "ai-guides/START_HERE.md"
  "ai-guides/REVIEW_FIRST.md"
  "context-packs/workspace/current-state.md"
  "context-packs/epk/current-surface.md"
  "context-packs/prism-focus/current-surface.md"
  "context-packs/prism-spectra/current-surface.md"
  "app-guides/prism-focus/session-start.md"
  "app-guides/prism-spectra/session-start.md"
)

for file in "${required_files[@]}"; do
  test -f "${BASE_DIR}/${file}"
  echo "Found ${file}"
done

for repo in "EPK" "prism-focus" "prism-spectra" "prism-beam"; do
  if [ -d "${ROOT_DIR}/${repo}" ]; then
    echo "Sibling repo present: ${repo}"
  else
    echo "Sibling repo not present: ${repo}"
  fi
done

echo "Beam reference smoke check completed."
