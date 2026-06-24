# Open-Source Code Harvest Audit for Prism Spectra

## Audit frame and compatibility rubric

This audit is source-harvest focused: what Prism Spectra can **import**, **vendor**, **fork**, **wrap**, **reimplement**, or **avoid**. I treated Prism as aiming for a **local-first, scriptable, permissive-licence-friendly** product with a TypeScript/JS-heavy centre of gravity, explicit approvals, visible diffs, and a low-cognitive-load workbench. Because Prism’s final outbound licence was not specified, I scored compatibility against a **permissive baseline**: MIT, Apache-2.0, BSD, ISC, and similar licences are generally reuse-friendly with notice obligations; MPL-2.0 is usable but brings **file-level copyleft**; GPL and especially AGPL are high-risk for direct combination in a commercial or permissive distribution. MIT requires preservation of copyright and licence notices; Apache-2.0 also requires retention of notices and marking modified files; AGPL adds network copyleft obligations. citeturn33search0turn33search6turn32search2turn33search16turn32search3

The strongest overall finding is that Prism should **build its identity layer itself**—approval semantics, checkpoint ledger, project memory, boundary visibility, and the “calm visual workbench”—while importing a small number of boring, well-licensed libraries for git, diff, graph UI, file typing, JSON repair, and SQLite access. Reusing architecture from AI-agent monoliths is valuable; reusing their code directly is usually not. citeturn17view0turn20view1turn23search2turn26search12turn34search4

## Executive harvest verdict

The best **direct dependency** candidates for Prism are **React Flow** for the focused project map and node UI, **CodeMirror Merge** for compact diff review, **simple-git** for shelling out to the user’s system Git, **jsdiff** for patch/hunk parsing, **jsonrepair**, **file-type**, **mime-types**, **Prettier**, and either **Drizzle** or **Kysely** over plain SQLite tables. The best **interoperability** dependency is the **MCP TypeScript SDK**, but Prism should wrap it in a richer internal manifest because MCP does not natively model approval classes, reversibility, cost, or local/remote boundaries. citeturn30search4turn30search8turn30search18turn7search1turn6search12turn6search16turn12search0turn12search1turn12search3turn12search2turn39search9turn9search2turn34search4turn34search10turn34search12

The most useful **patterns to reimplement** come from **Aider** for repo-map generation, git checkpoint/undo habits, config layering, and repair loops; **Goose** for permission modes, extensions, CLI/server/desktop separation, and recipe-like reusable workflows; **LangGraph** for checkpointing, interrupts, and resumable execution; and **Pydantic AI** for typed outputs, toolset filtering, and approval-aware streaming. These are architectural mines, not copy-paste candidates. citeturn18view0turn18view1turn18view2turn18view3turn22search2turn22search4turn19search6turn34search4turn26search5turn26search10turn27search6turn27search7turn27search12

The clearest **avoid/direct-copy-no** zones are **GPL/AGPL-adjacent ecosystems**, heavy **enterprise orchestration frameworks**, and complex **cloud-first agent stacks**. In practice that means avoiding direct code harvest from **ComfyUI-Manager** because it is GPL-3.0, treating **RxDB** carefully because premium plugins/licensing complicate a clean audit, keeping **OpenHands** and **Semantic Kernel / Agent Framework** as references rather than foundations, and resisting multi-agent role-play frameworks such as **CrewAI** as core architecture for a solo local workbench. citeturn31search2turn40search10turn23search2turn23search3turn28search0turn36search9turn36search4

## Repository harvest matrix

The matrix below prioritises the highest-confidence, highest-impact repositories and libraries. Where a row groups close alternatives, the recommendation applies to each named project in that row.

| Repository | Repo ref | Category | Primary language | Licence / SPDX | Maintenance signal | Local-first friendliness | Complexity / dependency weight | Relevant modules or files | Harvest candidate type | Why useful for Prism | Risks and licence concerns | Recommended action | Fit | Priority |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Aider | `Aider-AI/aider` | AI coding CLI | Python | Apache-2.0 | Large, active repo and recent issues | Good local CLI bias | Medium-high; Python stack and specialised deps | `aider/repomap.py`, `commands.py`, `repo.py`, `args.py`, `main.py`, `linter.py` | Pattern to reimplement | Best source for repo-map heuristics, config layering, git-aware edit flows, lint/test repair loops, and “show me the diff / undo it” habits | Python coupling; recent security issues include command-injection and untrusted repo startup command execution; direct vendoring would drag in Aider’s own assumptions and risk surface | Rebuild the concepts in TS; do not directly import core modules | 5 | P0 citeturn17view0turn18view0turn18view1turn18view2turn16search2turn16search9turn15search2turn15search16 |
| Goose | `aaif-goose/goose` | Local agent desktop + CLI + API | Rust + TypeScript | Apache-2.0 | Large, active repo | Strong | Medium-high; Rust workspace plus Electron desktop | `crates/goose-cli/src/main.rs`, `crates/goose-server/src/main.rs`, `crates/goose/src/agents/agent.rs`, `mcp_client.rs`, `ui/desktop/src/main.ts`, config files | Pattern to reimplement | Very relevant split between core agent, CLI, server, and desktop; permission modes and recipes align with Prism approvals and future parts library | Rust/TS stack shift; extension and recipe bugs; reports of directory-boundary surprises; optional telemetry customisation exists, so boundary handling needs scrutiny | Borrow architecture and approval ideas; do not make Goose a hard dependency | 4 | P1 citeturn20view0turn22search2turn22search4turn22search5turn19search5turn19search6turn19search13turn19search17 |
| OpenHands | `OpenHands/OpenHands` | Agent runtime + web workbench | Python + TypeScript | MIT for OSS code; separate enterprise licence present in repo | Active and heavily developed | Mixed; runs locally by default, but supports cloud backends | Heavy | `openhands/app_server/...`, `frontend/src/...`, websocket context, changes tab, config templates | Reference only / pattern to reimplement | Strong example of frontend/backend/runtime split, change review UI, event streaming, and resumable conversations | Very heavy dependency tree; optional cloud/enterprise orientation; setup and hooks execution in workspaces increase risk; enterprise subtree has different licensing | Study runtime separation and change-review UX only | 3 | P1 citeturn23search2turn23search3turn23search4turn23search5turn23search17turn23search18 |
| Continue | `continuedev/continue` | IDE / CLI assistant | TypeScript | Apache-2.0 | Active release workflows and CLI work | Moderate | Medium-high; strong IDE coupling | `extensions/cli/src/commands/chat.ts`, `core/indexing/chunk/code.ts`, `core/context/providers/*`, `core/tools/*`, VS Code extension package | Pattern to reimplement | Good context-provider model, codebase indexing, CLI command structure, and edit templates | A lot of value is IDE-specific; not a great foundation for a calm standalone workbench | Reuse patterns for indexing and provider abstractions, not the overall product shell | 3 | P1 citeturn24search5turn24search10turn24search6turn24search8turn24search15turn24search4 |
| SWE-agent and mini-swe-agent | `SWE-agent/SWE-agent`, `SWE-agent/mini-swe-agent` | Autonomous repo task runner | Python | MIT | Active project and docs; mini variant emphasises simplicity | Moderate | SWE-agent: heavy; mini-swe-agent: light | `sweagent/run/run_single.py`, tool bundle docs, default configs, demos | Reference only; mini-swe-agent pattern worth borrowing | Useful for minimal execution harnesses, tool bundle shape, and demo/trajectory concepts | Strong autonomy bias; default Docker-centric execution; user prompt can drift into less-safe territory | Borrow harness ideas, not control logic | 3 | P1 citeturn25search12turn25search4turn25search7turn25search10turn25search0 |
| LangGraph | `langchain-ai/langgraph` | Durable orchestration | Python | MIT | Large, active repo | Moderate | Medium-high | checkpoint SQLite/Postgres savers, `langgraph/types.py`, Pregel loop, store base classes, prebuilt tool node | Pattern to reimplement or optionally wrap for prototypes | Best current reference for interrupts, resumable execution, thread/checkpoint model, and streaming state graphs | Framework gravity is high; Python-first; serializer docs warn about untrusted checkpoint data; SQLite saver is explicitly aimed at lightweight use cases | Reimplement core ideas in Prism; only wrap for short-lived prototypes | 5 | P0 citeturn35search4turn26search5turn26search6turn26search7turn26search10turn26search19 |
| Pydantic AI | `pydantic/pydantic-ai` | Typed agent framework | Python | MIT | Large, active repo | Moderate | Medium; slim core with optional extras | `pydantic_ai/_agent_graph.py`, model adapters, `docs/agent.md`, `docs/toolsets.md`, approval-streaming adapter | Pattern to reimplement | Excellent typed-output, validation, toolset, and approval-streaming patterns; better source of payload/schema design than of Prism’s runtime shell | Python-first; broad optional extras increase scope quickly | Copy schema ideas, payload shapes, and toolset patterns into Prism manifests | 4 | P0 citeturn35search1turn27search5turn27search6turn27search7turn27search8turn27search12turn27search11 |
| CrewAI | `crewAIInc/crewAI` | Multi-agent orchestration | Python | MIT | Active | Weak match for Prism phase one | Medium-high | README flows/crews model | Avoid as foundation; reference only | Flow primitives and state gating are useful to understand | Core posture is role-playing, multi-agent orchestration; too much cognitive overhead for Prism’s solo/operator model | Do not adopt as core architecture | 2 | P2 citeturn35search10turn28search0turn28search4 |
| AutoGen and AutoGen Studio | `microsoft/autogen` | Multi-agent framework + studio | Python | MIT for code, CC-BY docs in repo | Active | Mixed | High | AutoGen Studio package, agentchat packages, FAQ | Reference only | Message-flow visualisation and studio concepts are interesting | Heavy framework; rewrite history and broad scope; easier to over-import than to harvest selectively | UI reference only | 2 | P2 citeturn35search3turn35search7turn28search1turn28search8turn28search14 |
| Semantic Kernel and Microsoft Agent Framework | `microsoft/semantic-kernel`, `microsoft/agent-framework` | Enterprise agent frameworks | C# + Python | MIT | Active | Mixed | High | plugin docs, Python/NET samples, observability and hosting packages | Reference only | Useful plugin abstractions and hosting ideas | Enterprise-heavy, broad platform surface, cloud/provider assumptions, lots of conceptual overhead for a solo local-first workbench | Study plugin boundary concepts only | 2 | P2 citeturn36search4turn36search9turn28search19turn28search17turn28search20turn28search16 |
| Textual | `Textualize/textual` | TUI framework | Python | MIT | Strong release cadence and large user base | Strong | Medium | reactive system, `textual serve`, devtools, code browser example | Pattern to reimplement / optional sidecar dependency | Best “calm mode” TUI reference: reactive widgets, tree/code panes, browser serving | Python stack shift if Prism core stays TS; not ideal if you want one-language product | Use as UX reference unless Prism deliberately adds a Python TUI sidecar | 3 | P1 citeturn36search14turn29search3turn29search4turn29search2turn29search1 |
| Bubble Tea | `charmbracelet/bubbletea` | TUI framework | Go | MIT | Active and popular | Strong | Medium | Elm-style model/update/view tutorial and framework | Pattern to reimplement | Great state model for predictable TUIs and keyboard-first flows | Go stack shift; would split Prism’s implementation language | Use as architectural inspiration only | 3 | P2 citeturn37search0turn36search7turn29search0 |
| Ink | `vadimdemedes/ink` | React-style TUI | TypeScript | MIT | Active ecosystem | Strong | Medium | component ecosystem, text input and select components, testing library | Optional dependency / pattern | Best fit if Prism wants a TS-native terminal UI and already thinks in React | Rich TUI apps can become brittle compared with web UI; ecosystem quality varies by component | Viable for a narrow CLI calm mode, not for the main workbench | 3 | P1 citeturn37search1turn37search12turn37search13turn37search16turn37search14 |
| Clipanion and Commander.js | `arcanis/clipanion`, `tj/commander.js` | CLI frameworks | TypeScript / JS | MIT | Mature and active | Strong | Low | typed parser state machine in Clipanion; strict parsing/help in Commander | Direct dependency | These are the cleanest bases for Prism’s authoritative, scriptable CLI mirror | Commander is simpler but less structured; Clipanion is cleaner for deeply nested typed commands | Prefer Clipanion for the core CLI; use Commander only if you want maximum familiarity over architecture | 5 | P0 citeturn37search3turn37search6turn14search2turn14search0turn37search8 |
| React Flow | `xyflow/xyflow` | Node/graph UI | TypeScript | MIT | Active docs and examples | Strong | Medium | `<ReactFlow />`, `<Controls />`, accessibility, undo/redo, copy/paste examples | Direct dependency | Best candidate for Prism’s focused project map and node execution views; good keyboard support and pragmatic controls | Can easily devolve into spaghetti workflows if Prism exposes too much graph power too early | Import directly, but keep Prism’s map filtered and task-focused rather than fully general | 5 | P0 citeturn38search4turn38search8turn30search4turn30search8turn30search0turn30search18turn30search21 |
| Mermaid | `mermaid-js/mermaid` | Static diagram export | TypeScript | MIT | Active | Strong | Low-medium | markdown syntax, CLI/export, theming | Direct dependency | Excellent for static snapshots of plans, workflow summaries, and build graph exports | Not interactive enough for the live workbench; complex diagrams become noisy quickly | Use for export and sharing, not as the main graph surface | 4 | P1 citeturn38search1turn38search5turn30search1turn30search5turn30search9turn30search16 |
| Cytoscape.js | `cytoscape/cytoscape.js` | Graph analysis and visualisation | JavaScript | MIT | Mature | Strong | Medium | core graph lib and layout ecosystem | Pattern to reimplement / optional specialist dependency | Better than React Flow for dense dependency and neighbourhood graphs where analysis matters more than editing | Heavier mental model; less natural for task-node editing UI | Keep as a specialist option for later code-neighbourhood maps | 3 | P2 citeturn38search14turn30search6turn30search2 |
| ComfyUI frontend | `Comfy-Org/ComfyUI_frontend` | Node graph workbench | TypeScript + Vue | Not fully rechecked in this audit; frontend repo is open source | Active | Moderate | High | node component layer, extension callbacks, serialisation behaviour | Pattern to reimplement | Useful cautionary reference for workflow persistence, custom node ecosystem, and node UX | Very easy to inherit node-spaghetti culture; extension callback surface is broad; **ComfyUI-Manager** is GPL-3.0 and should not be harvested into Prism | Borrow only the good parts: reusable workflow parts, not open-ended spaghetti graphs | 2 | P2 citeturn31search0turn31search1turn31search2 |
| Sourcetrail | `CoatiSoftware/Sourcetrail` | Code graph / navigation | C++ | GPL-3.0 | Project is effectively historical | Fair as reference | High | whole product | Reference only / avoid direct copy | Good source-neighbourhood UX ideas | GPL-3.0 makes direct reuse unattractive for Prism; codebase is not a light harvest target | Use only as inspiration for filtered neighbourhood maps | 1 | P3 citeturn4search2turn32search13 |
| simple-git | `steveukx/git-js` | Git wrapper | TypeScript | MIT-like permissive package; audit source notices during vendoring | Mature | Strong | Low | typings and response types | Direct dependency | Strongest fit for Prism’s “system git remains authoritative” rule; small API surface and easy wrapping | Depends on the user’s installed Git rather than embedding semantics | Use for all local git operations and checkpoint metadata; wrap with Prism approval gates | 5 | P0 citeturn6search12turn6search16turn6search4 |
| isomorphic-git | `isomorphic-git/isomorphic-git` | Git implementation | JavaScript | Audit separately before adoption | Active but issue-heavy in tricky paths | Moderate | Medium | core library | Reference only | Useful if Prism ever needs browser-only Git | Real-world push/CORS/auth limitations and ecosystem edge cases make it a poor core for Prism’s authoritative local git model | Avoid as primary git engine | 2 | P2 citeturn6search5turn6search9turn6search13 |
| CodeMirror Merge | `codemirror/merge` | Diff / merge UI | TypeScript | MIT-style CodeMirror licence family; verify exact distribution artefacts in release pipeline | Active | Strong | Low-medium | merge view package | Direct dependency | Best lightweight diff/merge surface for Prism’s approval-before-write UX | Fewer “IDE-like” affordances than Monaco, but that is also a strength for low-noise review | Prefer this for hunk-by-hunk review panes | 5 | P0 citeturn7search1turn7search7turn7search13 |
| Monaco diff editor | `microsoft/monaco-editor` | Diff / editor UI | MIT | Mature | Strong | Medium-high | whole editor | Direct dependency if Prism already uses Monaco | Best if Prism wants full IDE-grade editing and diffing in one component | Heavy compared with CodeMirror; known edge cases on very large diffs and some diff-editor quirks | Use only if Prism commits to Monaco as the primary editor | 3 | P1 citeturn7search0turn7search3turn7search9turn7search12 |
| jsdiff | `kpdecker/jsdiff` | Text diff / patch parsing | JavaScript | BSD-style permissive family; verify lockfile and version due older vulnerabilities | Mature | Strong | Low | patch parsing and diff functions | Direct dependency | Good for patch parsing and hunk-level review | Recent backport/security discussions mean Prism should pin a modern version and test pathological input | Use for patch parsing; combine with CodeMirror Merge for UI | 4 | P0 citeturn6search19turn6search7turn6search11 |
| GitButler and Lazygit | `gitbutlerapp/gitbutler`, `jesseduffield/lazygit` | Git UX references | Rust + TS / Go | GitButler uses permissive open-source licensing; Lazygit uses MIT | Active | Strong | Medium-high | whole products | Pattern to reimplement | Best references for checkpoint browsing, rollback affordances, stacked changes, and keyboard-driven git UX | Full products are too opinionated to embed; Prism should not become “yet another git client” | Reimplement a much narrower checkpoint/history layer | 4 | P1 citeturn7search2turn7search8turn8search0turn8search1turn8search6 |
| better-sqlite3 | `WiseLibs/better-sqlite3` | SQLite wrapper | C++ / JS bindings | MIT in practice; verify package metadata in your supply-chain tooling | Active | Strong | Low runtime, but native build/distribution risk | API docs and native module | Direct dependency for local daemon only | Very strong for a single-user local ledger with synchronous API and worker-thread options | Native module packaging and distribution can be painful in CLIs/Electron auto-update scenarios | Good choice if Prism controls packaging tightly; otherwise consider a more conservative distribution model | 4 | P1 citeturn39search0turn9search8turn9search4 |
| Drizzle ORM | `drizzle-team/drizzle-orm` | TS DB schema / migrations | TypeScript | Apache-2.0 | Active | Strong | Low | schema and SQL layer | Direct dependency | Excellent fit for explicit SQLite tables, typed migrations, and low dependency cost | Earlier ecosystem licensing confusion around some adjacent packages is worth rechecking in lockfiles, but core Drizzle is permissive and lightweight | Preferred ORM if Prism wants explicit schemas with minimal bloat | 5 | P0 citeturn39search9turn39search1turn9search1 |
| Kysely | `kysely-org/kysely` | TS query builder | TypeScript | MIT | Active | Strong | Low-medium | driver abstractions and query builder | Direct dependency | Better fit than a full ORM when you want SQL-first control and less magic | Slightly more manual work than Drizzle for schema ergonomics | Choose Kysely if Prism values SQL clarity over migration ergonomics | 4 | P1 citeturn39search2turn9search2turn39search6 |
| Prisma ORM | `prisma/prisma` | Full ORM | TypeScript + Rust | Apache-2.0 | Active | Moderate | High | whole ORM stack, client generation | Avoid for Prism phase one | Rich tooling, but too much weight for a local single-user provenance ledger | Client generation, binary/runtime complexity, and overkill for explicit event tables | Do not use in the first Prism build | 2 | P2 citeturn39search7turn9search3turn39search15 |
| ElectricSQL and RxDB | `electric-sql/electric`, `pubkey/rxdb` | Local-first sync stacks | TypeScript | Electric appears Apache-style; RxDB has open-source core plus premium/licence complexity | Active | Mixed | High | sync engines and replication systems | Reference only / avoid for phase one | Useful to study sync and replication trade-offs | Too heavy for Prism’s first local-only ledger; RxDB premium ecosystem complicates clean licence posture | Start with plain SQLite tables; revisit only if multi-device sync becomes core | 2 | P2 citeturn40search16turn10search0turn10search2turn40search10turn10search14 |
| jsonrepair, file-type, mime-types, Prettier | `josdejong/jsonrepair`, `sindresorhus/file-type`, `jshttp/mime-types`, `prettier/prettier` | Attachment and repair utilities | TypeScript / JS | MIT family | Active | Strong | Low | parser repair, magic-number detection, MIME mapping, formatting | Direct dependencies | Exactly the kind of boring utility layer Prism should wrap instead of rebuilding | Need clear provenance and repair logs so auto-fix behaviour is visible to users | Import directly and surface each fix in Prism’s provenance/checkpoint ledger | 5 | P0 citeturn12search0turn12search8turn12search1turn12search9turn12search3turn12search15turn12search2turn12search18 |
| MCP TypeScript SDK | `modelcontextprotocol/typescript-sdk` | Tool / plugin interoperability | TypeScript | “SEE LICENSE IN LICENSE”; treat as compatible only after final package-licence verification in your lockfile | Very active, with v2 migration underway | Strong | Medium | server/client docs, `McpServer`, output schema examples, middleware packages | Direct dependency plus Prism overlay | Best interoperability layer for external tools, resources, prompts, streaming transports, and client/server roles | SDK is still evolving; MCP capability model does not encode Prism-specific approval, reversibility, cost, or boundary metadata | Support MCP, but define a stricter Prism capability manifest on top | 5 | P0 citeturn34search0turn34search1turn34search4turn34search10turn34search12turn34search15turn34search16 |
| Node-RED, Home Assistant, Obsidian API | `node-red/node-red`, `home-assistant/core`, `obsidianmd/obsidian-api` | Plugin-system references | JS / Python / TS types | Apache-2.0 / local-first OSS / MIT types | Active | Strong reference value | High as product foundations | node registry and palette ideas; integration scale and local-control posture; plugin type surface | Pattern to reimplement | These are the best references for curated plugin registries, capability discovery, and community extension ecosystems | All are too broad to embed; Prism must prevent extension overload and preserve a calm core | Use as governance references, not code foundations | 3 | P1 citeturn13search3turn13search11turn13search10turn34search3turn13search1turn13search13 |

## Cross-cutting design guidance for Prism

Prism should **build** the following itself because they are part of its identity, not commodity plumbing: the approval model; the event/checkpoint ledger; the project-memory schema for conversations, messages, attachments, and artefacts; visible local/remote boundary labelling; reversible vs irreversible action classes; calm graph filtering rules; and the final “command mirror” grammar that keeps the CLI authoritative while the workbench reduces memory burden. None of the reviewed projects carries exactly this combination of safety, local-firstness, and low-cognitive-load UX. The closest inspirations—Aider, Goose, LangGraph, and Pydantic AI—each solve only part of the problem. citeturn18view0turn18view1turn22search2turn19search5turn26search5turn26search6turn27search6turn27search7

Prism should **import** the boring layer. That means: `simple-git` for Git control, `jsdiff` for patch parsing, `@codemirror/merge` for review UI, `@xyflow/react` for focused graph surfaces, `jsonrepair` and `Prettier` for safe repair/normalisation, `file-type` and `mime-types` for attachments, and either `Drizzle` or `Kysely` over SQLite. These dependencies are all narrower than the product and keep Prism’s engineering effort concentrated on the identity layer. citeturn6search12turn6search16turn6search19turn7search1turn30search4turn12search0turn12search2turn12search1turn12search3turn39search9turn9search2

Prism should **vendor or fork sparingly**. The only realistic place I would consider vendoring is a small, stable utility whose behaviour Prism wants to pin tightly—most likely a diff/patch helper or a tiny CLI parser adjunct. I would **not** vendor Aider, Goose, Continue, or LangGraph wholesale. Their value is in ideas, not in transplanting their dependency graph and product assumptions into Prism. citeturn17view0turn20view0turn24search5turn35search4

Prism should **support MCP but not stop at MCP**. MCP gives a strong interoperability shell around tools, resources, prompts, transports, and approval-oriented invocation, but Prism still needs an internal capability manifest with fields such as `risk_level`, `approval_class`, `reversible`, `cost_profile`, `local_remote_boundary`, `provenance`, and `checkpoint_policy`. Borrow the protocol; own the safety semantics. citeturn34search4turn34search6turn34search10turn34search12

For the graph/workbench layer, Prism should prefer a **filtered neighbourhood map** over a general-purpose node editor. React Flow is the best substrate, but only if Prism limits the surface to tight, contextual maps: “current task”, “changed files”, “active tools”, “recent checkpoints”, “neighbouring code symbols”, and “attachments in play”. ComfyUI is the archetypal warning: open-ended node power quickly becomes spaghetti. GitButler and Lazygit are the opposite lesson—tight, opinionated history and diff views reduce anxiety. citeturn30search18turn30search21turn31search1turn31search2turn7search2turn8search0

## Harvest cards

The cards below cover the **P0 and P1** candidates with the best evidence-to-effort ratio.

**Name:** React Flow  
**Repo:** `xyflow/xyflow`  
**Licence:** MIT  
**Target Prism feature:** Focused project map, graph execution view, calm node-based previews  
**Relevant source files/modules:** `<ReactFlow />`, `<Controls />`, accessibility hooks, undo/redo examples, copy/paste examples  
**What it does:** It provides the core node/edge canvas, controls, keyboard support, and state hooks needed to build node-based UIs. React Flow’s docs and examples also show snapshot-based undo/redo and practical graph affordances rather than academic graph theory. citeturn30search4turn30search8turn30search0turn30search18turn30search21turn38search4  
**How Prism could use it:** Build a tightly filtered “live project neighbourhood” surface: current task, current files, executed tools, next safe actions, checkpoints, and attachments. Resist exposing general graph editing until there is a proven need.  
**Reuse mode:** dependency  
**Implementation effort:** Medium  
**Licence risk:** Low  
**Dependency risk:** Moderate, because React Flow makes it easy to overbuild the graph layer  
**Performance risk:** Moderate if Prism renders large, dense graphs  
**Security risk:** Low  
**Neurodivergent UX value:** High, because a filtered visual context map reduces working-memory load without replacing the CLI  
**First experiment:** Render a current-task neighbourhood with nodes for task, changed files, last checkpoint, next proposed actions, and cost/boundary badges  
**Codex prompt:** “Implement a React Flow project-neighbourhood panel that renders only the current task context, supports fit-view, keyboard navigation, and snapshot undo/redo, and never exposes arbitrary node creation.”  

**Name:** CodeMirror Merge  
**Repo:** `codemirror/merge`  
**Licence:** permissive CodeMirror family; verify exact artefact licence in lockfile  
**Target Prism feature:** Diff review, hunk approval, safe write preview  
**Relevant source files/modules:** `@codemirror/merge` package  
**What it does:** It implements a merge/diff interface for CodeMirror with lighter weight than Monaco. citeturn7search1turn7search7  
**How Prism could use it:** Show per-file diffs before approval, allow accepting/rejecting hunks, and bind checkpoint creation to accepted patch sets.  
**Reuse mode:** dependency  
**Implementation effort:** Low-medium  
**Licence risk:** Low after lockfile verification  
**Dependency risk:** Low  
**Performance risk:** Low-medium  
**Security risk:** Low  
**Neurodivergent UX value:** High, because compact unified diffs are calmer than full IDE side-by-side editors for many change-review tasks  
**First experiment:** Build a “proposed edits” drawer with unified diff as default and side-by-side as a toggle  
**Codex prompt:** “Create a CodeMirror merge view component for proposed AI edits with accept/reject controls, file-level approval, and checkpoint metadata hooks.”  

**Name:** simple-git  
**Repo:** `steveukx/git-js`  
**Licence:** permissive; confirm notices during dependency audit  
**Target Prism feature:** Git-backed checkpoints, rollback, status, compare, and commit metadata  
**Relevant source files/modules:** `typings/simple-git.d.ts`, `typings/response.d.ts`  
**What it does:** It wraps the system Git executable behind a small Node API surface instead of reimplementing Git semantics. citeturn6search12turn6search16turn6search4  
**How Prism could use it:** Make Git the authoritative checkpoint engine while Prism adds higher-level semantics: “pending write set”, “approved patch”, “rollback target”, and “workspace health”.  
**Reuse mode:** dependency  
**Implementation effort:** Low  
**Licence risk:** Low  
**Dependency risk:** Low  
**Performance risk:** Low  
**Security risk:** Medium only if Prism passes unsanitised shell strings elsewhere; simple-git itself is not the high-risk part  
**Neurodivergent UX value:** High, because it enables reliable undo paths and visible state  
**First experiment:** Create checkpoint/create, checkpoint/list, compare, and rollback commands backed by system Git  
**Codex prompt:** “Wrap simple-git in a PrismGit service that exposes checkpoint, rollback, diff, file-status, and staged-preview APIs with audit logging and no destructive action without approval.”  

**Name:** jsdiff  
**Repo:** `kpdecker/jsdiff`  
**Licence:** permissive BSD-style family; pin modern version  
**Target Prism feature:** Patch parsing, hunk visualisation, sidecar repair previews  
**Relevant source files/modules:** release notes, patch parsing paths  
**What it does:** It provides text differencing and patch handling that Prism can use before handing diffs to UI components. citeturn6search19turn6search7turn6search11  
**How Prism could use it:** Parse model-generated edits into hunks, classify risk by file/pattern, and feed structured changes into review UIs and checkpoint metadata.  
**Reuse mode:** dependency  
**Implementation effort:** Low  
**Licence risk:** Low  
**Dependency risk:** Low  
**Performance risk:** Medium on pathological diffs unless pinned and tested  
**Security risk:** Medium if old vulnerable versions are allowed into the tree  
**Neurodivergent UX value:** Medium-high, because structured hunks make approval more predictable  
**First experiment:** Parse AI patch output into per-file hunk cards with reversible/non-reversible tags  
**Codex prompt:** “Build a patch parser service on top of jsdiff that converts unified diffs into Prism hunk objects with file path, line ranges, edit summary, and risk tags.”  

**Name:** Drizzle ORM  
**Repo:** `drizzle-team/drizzle-orm`  
**Licence:** Apache-2.0  
**Target Prism feature:** SQLite schema and migration layer for event ledger and project memory  
**Relevant source files/modules:** schema/migration layer, SQLite support  
**What it does:** It adds typed schema and migration ergonomics without dragging in Rust engines or runtime-heavy ORM machinery. Drizzle’s repo emphasises low weight and zero runtime dependencies. citeturn39search9turn9search1turn39search1  
**How Prism could use it:** Define explicit tables for `events`, `checkpoints`, `attachments`, `conversations`, `messages`, `tool_runs`, `boundary_marks`, and `repair_actions`, while keeping SQL transparent.  
**Reuse mode:** dependency  
**Implementation effort:** Low-medium  
**Licence risk:** Low  
**Dependency risk:** Low  
**Performance risk:** Low  
**Security risk:** Low  
**Neurodivergent UX value:** Indirect but high, because explicit schemas support stable memory and provenance  
**First experiment:** Model the event ledger with append-only events plus materialised read tables for fast UI queries  
**Codex prompt:** “Design a Drizzle SQLite schema for Prism with append-only events, revision checkpoints, conversation memory, attachment provenance, tool executions, and rollback metadata.”  

**Name:** better-sqlite3  
**Repo:** `WiseLibs/better-sqlite3`  
**Licence:** treated as MIT in practice; verify package/licence artefacts in the final SBOM  
**Target Prism feature:** Embedded local ledger storage  
**Relevant source files/modules:** API docs, synchronous DB surface  
**What it does:** It offers a fast synchronous SQLite API for Node, including transactions and worker-thread support. citeturn39search0turn9search8  
**How Prism could use it:** Back the single-user local daemon with explicit transactions around event writes, checkpoint creation, and rollback metadata updates.  
**Reuse mode:** dependency  
**Implementation effort:** Low  
**Licence risk:** Low after final package audit  
**Dependency risk:** Medium due native builds  
**Performance risk:** Low  
**Security risk:** Low  
**Neurodivergent UX value:** Indirect; it makes the “nothing got lost” promise believable  
**First experiment:** Append-only event writes plus FTS-backed search over messages and attachments  
**Codex prompt:** “Implement a SQLite event store using better-sqlite3 with atomic append operations, checkpoint snapshots, attachment metadata, and fast read projections for Prism UI panels.”  

**Name:** MCP TypeScript SDK  
**Repo:** `modelcontextprotocol/typescript-sdk`  
**Licence:** package metadata points to a repo licence file; treat as pending final lockfile validation  
**Target Prism feature:** External tool interoperability and capability discovery  
**Relevant source files/modules:** `McpServer`, server/client guides, output-schema examples, middleware packages  
**What it does:** It provides server and client primitives for MCP tools, resources, prompts, transports, and streaming patterns. citeturn34search1turn34search4turn34search6turn34search10turn34search12turn34search15  
**How Prism could use it:** Support MCP import/export at the edge, but map every MCP capability into a richer Prism capability manifest with approval/risk/cost/boundary fields.  
**Reuse mode:** dependency  
**Implementation effort:** Medium  
**Licence risk:** Low if final licence file checks out cleanly  
**Dependency risk:** Medium because the SDK is evolving rapidly  
**Performance risk:** Low-medium  
**Security risk:** Medium unless every remote capability is clearly boundary-labelled and approval-gated  
**Neurodivergent UX value:** High if it prevents custom plugin sprawl and keeps tools describable in one standard way  
**First experiment:** Build an MCP bridge that imports tool metadata and forces a Prism-side risk manifest before activation  
**Codex prompt:** “Create a Prism MCP bridge that discovers MCP tools/resources/prompts and compiles them into Prisma capability records with added approval, reversibility, cost, and boundary metadata.”  

**Name:** Aider repo-map and git workflow patterns  
**Repo:** `Aider-AI/aider`  
**Licence:** Apache-2.0  
**Target Prism feature:** Repo map, context pruning, git checkpoint UX  
**Relevant source files/modules:** `aider/repomap.py`, `repo.py`, `args.py`, `commands.py`, `linter.py`  
**What it does:** Aider combines tree-sitter/grep-ast based repo mapping with git-aware editing and repair loops. citeturn18view0turn18view2turn16search2turn16search9  
**How Prism could use it:** Recreate the *idea* of a cheap, cached repository overview, but tie it to Prism’s visual map and memory panels instead of stuffing it only into prompts.  
**Reuse mode:** reimplement pattern  
**Implementation effort:** Medium-high  
**Licence risk:** Low  
**Dependency risk:** Medium  
**Performance risk:** Medium on very large repos  
**Security risk:** High if Prism blindly copies command execution behaviour instead of its higher-level ideas | Aider has active security concerns worth learning from, not inheriting. citeturn15search2turn15search16  
**Neurodivergent UX value:** Very high, because a repo map is a memory aid, not just an LLM context trick  
**First experiment:** Build a cached “project neighbourhood” index with symbol anchors, changed-file weighting, and attachment-to-file links  
**Codex prompt:** “Reimplement an Aider-style repository map in TypeScript using file summaries, symbol extraction, cached refresh, and changed-file weighting, with output optimised for both Prism UI and model context.”  

**Name:** LangGraph checkpoint and interrupt model  
**Repo:** `langchain-ai/langgraph`  
**Licence:** MIT  
**Target Prism feature:** Durable execution, pause/resume, human-in-the-loop interrupts  
**Relevant source files/modules:** SQLite saver, Postgres saver, Pregel loop, `GraphOutput`, store base classes  
**What it does:** It separates graph execution state, checkpoint storage, interrupts, and resume commands in a way that is directly relevant to Prism’s execution model. citeturn26search5turn26search6turn26search1turn26search7  
**How Prism could use it:** Mirror the concepts without importing the framework wholesale: execution thread, interrupt, pending approval action, checkpoint ID, resume command, and replay.  
**Reuse mode:** reimplement pattern  
**Implementation effort:** High  
**Licence risk:** Low  
**Dependency risk:** Medium-high  
**Performance risk:** Medium  
**Security risk:** Medium because untrusted checkpoint stores are explicitly dangerous with some serializers | Prism should store plain JSON-safe payloads only. citeturn26search10  
**Neurodivergent UX value:** High, because resumability reduces context-loss anxiety  
**First experiment:** Add “interrupt before write”, “resume after approval”, and “rollback to checkpoint” to Prism’s daemon API  
**Codex prompt:** “Design a Prism execution engine with LangGraph-style interrupts and checkpoints, but using JSON-safe serialisation and explicit human approval steps before file writes or destructive actions.”  

**Name:** Goose permission model and recipes  
**Repo:** `aaif-goose/goose`  
**Licence:** Apache-2.0  
**Target Prism feature:** Approval classes, parts library, CLI/server/workbench split  
**Relevant source files/modules:** entry points in `goose-cli`, `goose-server`, desktop UI, agent core, recipe docs  
**What it does:** Goose shows how one product can expose CLI, server, desktop, MCP client/server behaviour, and reusable recipe-like workflows without giving up local execution. citeturn22search2turn22search4turn19search6turn19search10  
**How Prism could use it:** Treat “recipes” as an early model for Prism’s future reusable tools/parts library, but simplify heavily and attach stronger provenance/approval metadata.  
**Reuse mode:** reimplement pattern  
**Implementation effort:** Medium-high  
**Licence risk:** Low  
**Dependency risk:** Medium-high  
**Performance risk:** Medium  
**Security risk:** Medium because extensions and boundary rules can sprawl if not tightly governed  
**Neurodivergent UX value:** High if recipes become reusable “less thinking, more starting point” bundles  
**First experiment:** Implement a tiny “parts” manifest with a single approved flow: inspect → diff → approval → write → checkpoint  
**Codex prompt:** “Create a Prism parts-library manifest inspired by Goose recipes, but add risk class, approval requirements, reversibility flags, local/remote boundary tags, and provenance logging.”  

**Name:** jsonrepair  
**Repo:** `josdejong/jsonrepair`  
**Licence:** MIT-style permissive  
**Target Prism feature:** Safe file repair pipeline  
**Relevant source files/modules:** core parser repair library  
**What it does:** It repairs malformed JSON and is specifically useful when LLM outputs are almost-valid but not quite. citeturn12search0turn12search8turn12search12  
**How Prism could use it:** Wrap it as a visible repair tool that shows before/after, categorises the fix, and emits provenance events.  
**Reuse mode:** dependency  
**Implementation effort:** Low  
**Licence risk:** Low  
**Dependency risk:** Low  
**Performance risk:** Low  
**Security risk:** Low if only applied to files the user can inspect  
**Neurodivergent UX value:** High, because it converts frustrating “almost works” failures into clear reviewable repairs  
**First experiment:** Add a “repair JSON” action to attachment and file preview panes with visible diff and one-click checkpointing  
**Codex prompt:** “Integrate jsonrepair into Prism as a repair pipeline step that always shows a diff, stores provenance metadata, and requires explicit approval before overwriting the original file.”  

## Build, import, vendor, and never-copy list

Prism should **build itself**: the event ledger, approval semantics, rollback/checkpoint discipline, project memory model, calm visual filtering, local/remote boundary model, and the CLI-to-workbench mirror. That is the product.

Prism should **import as libraries**: React Flow, CodeMirror Merge, simple-git, jsdiff, jsonrepair, file-type, mime-types, Prettier, Drizzle or Kysely, and an MCP SDK wrapper. citeturn30search4turn7search1turn6search12turn6search19turn12search0turn12search1turn12search3turn12search2turn39search9turn9search2turn34search4

Prism should **vendor or fork only when pinning tiny, stable behaviour matters**, not as a shortcut around design. My default is **dependency first**, **reimplementation second**, **vendoring last**.

Prism should **never copy directly** from: GPL/AGPL or premium-licence-adjacent surfaces without counsel; ComfyUI-Manager; Sourcetrail code; heavy cloud-first agent shells; and any code path that collapses approval boundaries or executes untrusted repository scripts by default. citeturn31search2turn32search13turn33search16turn15search16

## Open questions and limitations

A few items remain intentionally conservative because the available evidence was strong enough for a design recommendation but not for a final procurement-style legal sign-off. In particular, I would run one more internal SBOM-level check on the exact published licence artefacts for **MCP TypeScript SDK**, **CodeMirror Merge**, **simple-git**, and **better-sqlite3** before freezing Prism’s dependency list. The design recommendation does not change; the final packaging decision should still pass through a lockfile + NOTICE audit. citeturn34search0turn7search7turn6search12turn9search4

I also did not elevate sync frameworks such as Electric, Replicache, RxDB, Yjs, or Automerge to first-wave dependencies because Prism’s current direction is explicitly **local-first first**, not **multi-device collaborative sync first**. If that product direction changes, a second pass should compare SQLite event replication versus CRDT documents much more deeply. citeturn10search0turn10search1turn10search2turn10search3turn11search0