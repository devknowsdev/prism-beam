# Ecosystem Overview

Purpose: a concise map of the Prism local-first ecosystem so future work stays
aligned across repos, roles, and data ownership.

## Current Repos

| Repo | Current role | Current fact | Not the owner of |
|---|---|---|---|
| `prism-spectra` | AI-Forge / Prism Core / executive forge | Local-first orchestration, routing, capability execution, memory, safety, and execution provenance live here. | ADHDashboard state, music CRM state, public press-kit publication |
| `prism-focus` | ADHDashboard / operations dashboard | Human-facing planning, review, task execution, and dashboard UI live here. | Core model routing, adapter policy, external publishing logic |
| `prism-beam` | Workspace/meta coordination and support spine repo | Docs, scripts, templates, reusable patterns, and workspace-level conventions live here. | Runtime behavior, app state, feature execution |
| `EPK` | Public-facing artist surface | Public press-kit content and browser-facing publication live here. | The whole music business, internal orchestration, or dashboard state |

## Long-Term Layer Model

The current four-repo shape maps cleanly to three long-term layers:

| Layer | Purpose | Primary owner today |
|---|---|---|
| Executive / Forge layer | Reasoning, delegation, capability routing, governance, memory, file operations, coding workflows, and provenance | `prism-spectra` |
| Operations dashboard layer | Planning, budgeting, tracking, daily execution, task management, review, and UI | `prism-focus` |
| Music business / output layer | Bookings, mail, social posts, content, publishing, design, website, networking, gigs, releases, CRM, and commercial operations | `prism-music`, with `EPK` as one public surface |

## Architectural Decision

- `prism-spectra` is the executive brain and engineering forge.
- `prism-focus` is the human operations company and dashboard.
- `prism-beam` is the coordination, documentation, and reusable support layer.
- `prism-music` is the Prism-named music management layer.
- `EPK` is a public surface of `prism-music`, not the whole layer.

## What This Means

- Keep runtime behavior in the repo that owns the domain.
- Keep coordination notes in `prism-beam`.
- Keep public-facing brand publication separate from internal operations.
- Treat `prism-music` as a business/output layer, not as a
  shortcut to merge the other repos.
