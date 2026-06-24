#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

copy_file() {
  src="$1"; dst="$2"
  if [ -f "$dst" ]; then
    echo "Skipping $dst (exists)"
  else
    cp "$src" "$dst"
    echo "Installed $dst"
  fi
}

for repo in "${ROOT}/../EPK" "${ROOT}/../prism-focus" "${ROOT}/../prism-spectra"; do
  if [ -d "$repo" ]; then
    echo "Installing templates into $repo"
    mkdir -p "$repo/.github"
    copy_file "$ROOT/templates/PULL_REQUEST_TEMPLATE.md" "$repo/.github/PULL_REQUEST_TEMPLATE.md"
    copy_file "$ROOT/templates/CODEOWNERS" "$repo/.github/CODEOWNERS"
  else
    echo "Repo not found: $repo"
  fi
done
