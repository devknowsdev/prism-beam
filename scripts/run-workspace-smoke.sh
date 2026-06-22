#!/usr/bin/env bash
set -euo pipefail

# Run smoke tests for both repos. Assumes repos are siblings of this directory.
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ROOT_DIR="${BASE_DIR}"

# Prefer parent of workspace-meta when running from a sibling folder layout
if [ -d "${ROOT_DIR}/../ADHDashboard-git" ]; then
  ROOT_DIR="${ROOT_DIR}/.."
fi

echo "Running ADHDashboard tests..."
if [ -d "${ROOT_DIR}/ADHDashboard-git" ]; then
  (cd "${ROOT_DIR}/ADHDashboard-git" && node src/test_workflows.js)
else
  echo "ADHDashboard-git repo not found at ${ROOT_DIR}/ADHDashboard-git" >&2
  exit 1
fi

echo "Running AI-Forge tests..."
if [ -d "${ROOT_DIR}/AI-Forge" ]; then
  (cd "${ROOT_DIR}/AI-Forge" && npm test --silent)
else
  echo "AI-Forge repo not found at ${ROOT_DIR}/AI-Forge" >&2
  exit 1
fi

echo "All workspace smoke tests completed."
