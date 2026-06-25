#!/usr/bin/env bash
# check-token-budgets.sh
# Checks key Beam files against hard token-budget maxes from CONTEXT_BUDGETS.md.
# Uses 4 chars ≈ 1 token as a proxy.
# Run from the repo root: bash scripts/check-token-budgets.sh

set -euo pipefail

FAIL=0
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

check_file() {
  local path="$1"
  local hard_max_tokens="$2"
  local label="$3"
  local hard_max_chars=$(( hard_max_tokens * 4 ))
  local full_path="$REPO_ROOT/$path"

  if [ ! -f "$full_path" ]; then
    echo "SKIP  $label — file not found: $path"
    return
  fi

  local char_count
  char_count=$(wc -c < "$full_path")
  local token_estimate=$(( char_count / 4 ))

  if [ "$char_count" -gt "$hard_max_chars" ]; then
    echo "FAIL  $label — ~${token_estimate} tokens (hard max: ${hard_max_tokens}t) — $path"
    FAIL=1
  else
    echo "PASS  $label — ~${token_estimate} tokens (hard max: ${hard_max_tokens}t) — $path"
  fi
}

echo "=== Beam Token Budget Check ==="
echo ""

# Tiny bootstrap — hard max 1,500 tokens
check_file "ai-guides/TINY_BOOT.md"                              1500 "Tiny bootstrap"

# App mini-packs — hard max 2,000 tokens
check_file "context-packs/workspace/current-state.min.md"        2000 "Workspace mini-pack"
check_file "context-packs/prism-spectra/current-surface.min.md"  2000 "Spectra mini-pack"
check_file "context-packs/prism-focus/current-surface.min.md"    2000 "Focus mini-pack"
check_file "context-packs/epk/current-surface.min.md"            2000 "EPK mini-pack"

# Current-surface packs — hard max 6,000 tokens
check_file "context-packs/prism-spectra/harvest-current.md"      6000 "Spectra harvest pack"
check_file "context-packs/prism-spectra/model-routing-current.md" 6000 "Spectra routing pack"

# Core routing/session files — hard max 3,000 tokens
check_file "AI_LOAD_ME_FIRST.md"                                  3000 "Load-me-first"
check_file "ai-guides/AI_PROMPT_ROUTER.md"                        3000 "Prompt router"
check_file "ai-guides/AI_PROGRESS_PROTOCOL.md"                    3000 "Progress protocol"
check_file "ai-guides/AI_DELEGATION_PROTOCOL.md"                  3000 "Delegation protocol"
check_file "ai-guides/AI_USAGE_LIMITS.md"                         2500 "Usage limits"
check_file "ai-guides/AI_SESSION_LOADING_POLICY.md"               2000 "Session loading policy"
check_file "ai-guides/FREE_AI_MODE.md"                            1500 "Free AI mode"

# Progress log — hard max 5,000 tokens
check_file "AI_PROGRESS_LOG.md"                                   5000 "Progress log"

echo ""
if [ "$FAIL" -eq 1 ]; then
  echo "RESULT: One or more files exceed their hard token budget."
  echo "Action: Create a .min.md version, add a summary header, split into task packs, or archive."
  exit 1
else
  echo "RESULT: All checked files within budget."
  exit 0
fi
