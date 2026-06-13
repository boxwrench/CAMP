# CAMP Distribution Format & Brand Banner Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship CAMP as a one-step Claude Code plugin with clean skill names, a branded banner (monochrome ASCII in-skill + white-on-purple SVG in the README), self-sufficient references, and a committed verification gate.

**Architecture:** Rename the nine skill folders to canonical names, add a `.claude-plugin/plugin.json`, fix the one hard cross-skill reference, add startup + README banners, rewrite the stale install docs, and gate the whole thing behind `scripts/verify-camp.sh`. No runtime scripts ship inside skills; the verify script is dev/CI-only.

**Tech Stack:** Markdown skill files, one JSON manifest, one SVG, one Bash verification script. Reference: spec at `docs/superpowers/specs/2026-06-12-camp-distribution-design.md`.

**Note on "tests":** No application code. The acceptance test is `scripts/verify-camp.sh`. Per-task checks use `grep`, `test -f`, and that script. Written first so it fails, then made to pass.

**Execution note:** Tasks 2 (renames) and 3 (reference updates) are large mechanical batches — good candidates to hand to a cheaper subagent during execution.

---

## File Structure

- Create: `scripts/verify-camp.sh` — dev/CI acceptance gate (reference resolution, stale-slug scan, frontmatter/folder match, skill count, plugin validate).
- Create: `.claude-plugin/plugin.json` — plugin manifest (`name: camp`).
- Create: `assets/camp-banner.svg` — white-on-purple README hero banner.
- Create: `skills/verify/references/deep-research-handoff.md` — `verify`'s own copy (removes the hard cross-skill dep). (Created after the rename in Task 2 moves the folder.)
- Rename (git mv): the nine skill folders to canonical names.
- Modify: each `SKILL.md` frontmatter `name:`, plus reference rewordings.
- Modify: `docs/interaction-protocol.md` — add the Startup Banner section.
- Modify: `README.md` — embed the SVG; update folder-path references.
- Rewrite: `INSTALLATION.md`, `docs/using-camp-with-agents.md`.

---

## Task 1: Write the verification gate (fails first)

**Files:**
- Create: `scripts/verify-camp.sh`

- [ ] **Step 1: Create `scripts/verify-camp.sh` with this exact content**

```bash
#!/usr/bin/env bash
# verify-camp.sh — dev/CI verification for the CAMP skill stack.
# NOT installed into any agent. Checks that references resolve, no stale folder
# slugs remain, each frontmatter name matches its folder, and 9 skills exist.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
fail=0
err() { echo "FAIL: $*" >&2; fail=1; }

# --- 1. Reference resolution --------------------------------------------------
# Scan SKILL.md files + top-level docs (excluding superpowers history) + knowledge
# + README/INSTALLATION. A reference is a backtick or link token starting with a
# known prefix. references/* resolve relative to the skill folder; everything else
# (and ${CLAUDE_PLUGIN_ROOT}/*) resolves relative to repo root.
tmpfail="$(mktemp)"
ref_re='(\$\{CLAUDE_PLUGIN_ROOT\}/)?(skills|docs|knowledge|references|assets)/[A-Za-z0-9._/-]+'
{
  find skills -name SKILL.md
  find docs -maxdepth 1 -name '*.md'
  find knowledge -name '*.md'
  ls README.md INSTALLATION.md 2>/dev/null
} | while read -r f; do
  [ -f "$f" ] || continue
  skilldir="$(dirname "$f")"
  grep -oE "$ref_re" "$f" 2>/dev/null | while read -r ref; do
    p="${ref#\$\{CLAUDE_PLUGIN_ROOT\}/}"
    p="${p%.}"
    case "$p" in
      references/*) target="$skilldir/$p" ;;
      *)            target="$ROOT/$p" ;;
    esac
    [ -e "$target" ] || echo "$f -> unresolved reference: $ref" >> "$tmpfail"
  done
done
if [ -s "$tmpfail" ]; then
  echo "FAIL: unresolved references:" >&2
  sed 's/^/  /' "$tmpfail" >&2
  fail=1
fi
rm -f "$tmpfail"

# --- 2. No stale folder slugs -------------------------------------------------
slugs='abundance-diagnosis|abundance-foresight|abundance-recode|abundance-verify|abundance-translate|abundance-test|abundance-learn|abundance-build|skills/camp'
stale="$(grep -rEn "$slugs" --include='*.md' --include='*.json' . \
  | grep -v '^\./docs/superpowers/' \
  | grep -v '^\./scripts/verify-camp.sh' || true)"
if [ -n "$stale" ]; then
  echo "FAIL: stale folder slug(s):" >&2
  echo "$stale" | sed 's/^/  /' >&2
  fail=1
fi

# --- 3. Frontmatter name matches folder ---------------------------------------
for d in skills/*/; do
  name="$(basename "$d")"
  fm="$(awk -F': *' '/^name:/{print $2; exit}' "$d/SKILL.md" 2>/dev/null)"
  [ "$fm" = "$name" ] || err "frontmatter name '$fm' != folder '$name' in $d"
done

# --- 4. Skill count -----------------------------------------------------------
count="$(find skills -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')"
[ "$count" -eq 9 ] || err "expected 9 skills, found $count"

# --- 5. Plugin validation (best-effort) ---------------------------------------
if command -v claude >/dev/null 2>&1; then
  claude plugin validate >/dev/null 2>&1 || echo "WARN: 'claude plugin validate' reported issues" >&2
else
  echo "INFO: claude CLI not found; skipping plugin validate" >&2
fi

if [ "$fail" -ne 0 ]; then echo "verify-camp: FAILED" >&2; exit 1; fi
echo "verify-camp: OK"
```

- [ ] **Step 2: Make it executable**

Run: `chmod +x scripts/verify-camp.sh`

- [ ] **Step 3: Run it — expect FAIL (folders not yet renamed)**

Run: `./scripts/verify-camp.sh; echo "exit=$?"`
Expected: `FAIL: stale folder slug(s):` lines and `frontmatter name ... != folder` lines, ending `verify-camp: FAILED` and `exit=1`.

- [ ] **Step 4: Commit**

```bash
git add scripts/verify-camp.sh
git commit -m "Add dev verification gate for CAMP stack"
```

---

## Task 2: Rename skill folders to canonical names

**Files:**
- Rename: nine folders under `skills/`
- Modify: each renamed `SKILL.md` frontmatter `name:`

- [ ] **Step 1: Rename the folders with git mv**

```bash
git mv skills/abundance-diagnosis skills/diagnose
git mv skills/abundance-foresight skills/foresight
git mv skills/abundance-recode skills/recode
git mv skills/abundance-verify skills/verify
git mv skills/abundance-translate skills/translate
git mv skills/abundance-test skills/test
git mv skills/abundance-learn skills/learn
git mv skills/abundance-build skills/build
git mv skills/camp skills/start
```

- [ ] **Step 2: Update each SKILL.md frontmatter `name:` to its folder name**

In each file, change the `name:` line:

- `skills/diagnose/SKILL.md`: `name: abundance-diagnosis` → `name: diagnose`
- `skills/foresight/SKILL.md`: `name: abundance-foresight` → `name: foresight`
- `skills/recode/SKILL.md`: `name: abundance-recode` → `name: recode`
- `skills/verify/SKILL.md`: `name: abundance-verify` → `name: verify`
- `skills/translate/SKILL.md`: `name: abundance-translate` → `name: translate`
- `skills/test/SKILL.md`: `name: abundance-test` → `name: test`
- `skills/learn/SKILL.md`: `name: abundance-learn` → `name: learn`
- `skills/build/SKILL.md`: `name: abundance-build` → `name: build`
- `skills/start/SKILL.md`: `name: camp` → `name: start`

- [ ] **Step 3: Verify folders and names**

Run: `for d in skills/*/; do printf "%s -> " "$(basename "$d")"; awk -F': *' '/^name:/{print $2; exit}' "$d/SKILL.md"; done`
Expected: nine lines, each `X -> X` (folder equals name), names: build, diagnose, foresight, learn, recode, start, test, translate, verify.

- [ ] **Step 4: Commit**

```bash
git add -A
git commit -m "Rename CAMP skill folders to canonical names"
```

---

## Task 3: Fix references — hard dependency + folder paths

**Files:**
- Create: `skills/verify/references/deep-research-handoff.md`
- Modify: `skills/verify/SKILL.md`
- Modify: `README.md`

- [ ] **Step 1: Give `verify` its own deep-research template (removes the cross-skill hard dep)**

```bash
cp skills/diagnose/references/deep-research-handoff.md skills/verify/references/deep-research-handoff.md
```

- [ ] **Step 2: Point `verify` at its own copy**

In `skills/verify/SKILL.md`, change the deep-research reference line:

Old:
```markdown
- See `skills/abundance-diagnosis/references/deep-research-handoff.md` for the prompt pattern. Do not offer it for every memo — only when deeper evidence would materially change the diagnosis.
```
New:
```markdown
- See `references/deep-research-handoff.md` for the prompt pattern. Do not offer it for every memo — only when deeper evidence would materially change the diagnosis.
```

- [ ] **Step 3: Update folder-path references in `README.md`**

Replace each old skill path with its canonical path. Apply these exact substitutions in `README.md`:

- `skills/abundance-diagnosis` → `skills/diagnose`
- `skills/abundance-foresight` → `skills/foresight`
- `skills/abundance-recode` → `skills/recode`
- `skills/abundance-verify` → `skills/verify`
- `skills/abundance-translate` → `skills/translate`
- `skills/abundance-test` → `skills/test`
- `skills/abundance-learn` → `skills/learn`
- `skills/abundance-build` → `skills/build`
- `skills/camp` → `skills/start`

Also update the prose line in the Installation section that reads `skills/abundance-diagnosis -> diagnose` to `skills/diagnose -> /camp:diagnose (plugin) or diagnose (manual)`.

- [ ] **Step 4: Verify no old slugs remain outside history and the verify script**

Run: `grep -rEn 'abundance-diagnosis|abundance-foresight|abundance-recode|abundance-verify|abundance-translate|abundance-test|abundance-learn|abundance-build|skills/camp' --include='*.md' . | grep -v '^\./docs/superpowers/' | grep -v '^\./scripts/' || echo "CLEAN (no stale slugs)"`
Expected: `CLEAN (no stale slugs)` — except possibly `INSTALLATION.md` and `docs/using-camp-with-agents.md`, which are rewritten in Task 7. If only those two files appear, that is acceptable at this step.

- [ ] **Step 5: Commit**

```bash
git add -A
git commit -m "Fix cross-skill reference and update folder paths"
```

---

## Task 4: Add the plugin manifest

**Files:**
- Create: `.claude-plugin/plugin.json`

- [ ] **Step 1: Confirm the repo license to put in the manifest**

Run: `head -3 LICENSE`
Expected: shows the license type (e.g., MIT). Use that value for the `license` field below; if it is MIT, the content below is correct as-is.

- [ ] **Step 2: Create `.claude-plugin/plugin.json`**

```json
{
  "name": "camp",
  "description": "CAMP — Capacity, Abundance, Mechanisms, Policy. A civic-systems diagnosis skill stack: diagnose before advocating. Front door is /camp:start.",
  "version": "0.1.0",
  "author": { "name": "boxwrench" },
  "homepage": "https://github.com/boxwrench/CAMP",
  "repository": "https://github.com/boxwrench/CAMP",
  "license": "MIT"
}
```

- [ ] **Step 3: Verify it is valid JSON**

Run: `python3 -c "import json; json.load(open('.claude-plugin/plugin.json')); print('valid json')"`
Expected: `valid json`

- [ ] **Step 4: If the `claude` CLI is available, validate the plugin**

Run: `command -v claude >/dev/null && claude plugin validate || echo "claude CLI absent; skipping"`
Expected: validation success, or `claude CLI absent; skipping`.

- [ ] **Step 5: Commit**

```bash
git add .claude-plugin/plugin.json
git commit -m "Add CAMP plugin manifest"
```

---

## Task 5: Startup banner (in-skill, monochrome)

**Files:**
- Modify: `docs/interaction-protocol.md`
- Modify: `skills/start/SKILL.md`

- [ ] **Step 1: Add a Startup Banner section to `docs/interaction-protocol.md`, immediately after the `## Principle` section (before `## 1. Loop Map`)**

```markdown
## Startup Banner

The `start` router — and only the router — prints this exact banner verbatim on entry, before the loop map. Worker skills do not print it; they keep the one-line header plus loop map. The banner is a fixed literal, never generated at runtime (no dependency on figlet or any binary).

\`\`\`
 ██████╗ █████╗ ███╗   ███╗██████╗
██╔════╝██╔══██╗████╗ ████║██╔══██╗
██║     ███████║██╔████╔██║██████╔╝
██║     ██╔══██║██║╚██╔╝██║██╔═══╝
╚██████╗██║  ██║██║ ╚═╝ ██║██║
 ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝
   Capacity · Abundance · Mechanisms · Policy
\`\`\`

A skill emits only text; it cannot set terminal colors. The banner is monochrome. Brand color lives in the README hero banner.
```

(When inserting, replace the `\`\`\`` markers above with real triple-backtick fences.)

- [ ] **Step 2: Tell the `start` router to print the banner**

In `skills/start/SKILL.md`, in the `## Interaction` section, change the first bullet:

Old:
```markdown
- On entry, print the loop map with no skill bracketed (you are choosing where to start).
```
New:
```markdown
- On entry, print the Startup Banner (see `docs/interaction-protocol.md`), then the loop map with no skill bracketed (you are choosing where to start).
```

- [ ] **Step 3: Verify the banner section and the pointer exist**

Run: `grep -c '## Startup Banner' docs/interaction-protocol.md && grep -c 'Startup Banner' skills/start/SKILL.md`
Expected: `1` and `1`.

- [ ] **Step 4: Commit**

```bash
git add docs/interaction-protocol.md skills/start/SKILL.md
git commit -m "Add CAMP startup banner to the start router"
```

---

## Task 6: README hero banner (white-on-purple SVG)

**Files:**
- Create: `assets/camp-banner.svg`
- Modify: `README.md`

- [ ] **Step 1: Create `assets/camp-banner.svg`**

```svg
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="320" viewBox="0 0 1200 320" role="img" aria-label="CAMP — Capacity, Abundance, Mechanisms, Policy">
  <defs>
    <linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="#7a5cff"/>
      <stop offset="1" stop-color="#070028"/>
    </linearGradient>
  </defs>
  <rect width="1200" height="320" fill="url(#bg)"/>
  <text x="600" y="175" text-anchor="middle"
        font-family="'Segoe UI', Helvetica, Arial, sans-serif"
        font-size="150" font-weight="800" letter-spacing="14"
        fill="#fff5eb">CAMP</text>
  <rect x="400" y="205" width="400" height="4" fill="#f8bc23"/>
  <text x="600" y="258" text-anchor="middle"
        font-family="'Segoe UI', Helvetica, Arial, sans-serif"
        font-size="30" letter-spacing="4" fill="#fff5eb">Capacity · Abundance · Mechanisms · Policy</text>
</svg>
```

- [ ] **Step 2: Verify it is well-formed XML**

Run: `python3 -c "import xml.dom.minidom,sys; xml.dom.minidom.parse('assets/camp-banner.svg'); print('valid svg')"`
Expected: `valid svg`

- [ ] **Step 3: Embed the banner at the very top of `README.md`**

The README currently begins:
```markdown
# CAMP

**Capacity, Abundance, Mechanisms, Policy.**
```
Change it to:
```markdown
![CAMP](assets/camp-banner.svg)

# CAMP

**Capacity, Abundance, Mechanisms, Policy.**
```

- [ ] **Step 4: Verify the reference and file**

Run: `grep -c 'assets/camp-banner.svg' README.md && test -f assets/camp-banner.svg && echo OK`
Expected: `1` and `OK`.

- [ ] **Step 5: Commit**

```bash
git add assets/camp-banner.svg README.md
git commit -m "Add white-on-purple CAMP banner to README"
```

---

## Task 7: Rewrite the install docs

**Files:**
- Rewrite: `INSTALLATION.md`
- Rewrite: `docs/using-camp-with-agents.md`

- [ ] **Step 1: Replace `INSTALLATION.md` with whole-stack instructions**

Write `INSTALLATION.md` covering: the nine-skill stack; the plugin path (`claude --plugin-dir ./CAMP`, then `/reload-plugins`, skills appear as `/camp:diagnose` … `/camp:start`); the manual tree-copy path for all hosts (copy the whole repo so `skills/`, `docs/`, `knowledge/` keep their relationship); and a smoke test invoking `/camp:start` then a diagnose run. Do not reference any single `abundance-*` folder and do not include any personal machine path. Use this content:

```markdown
# Installation

CAMP is a stack of nine Agent Skills plus shared docs. Install the whole stack as one unit.

## Clone

```bash
git clone https://github.com/boxwrench/CAMP.git
cd CAMP
```

## Claude Code / Cowork (recommended: plugin)

CAMP ships as a Claude Code plugin (`.claude-plugin/plugin.json`). Load the whole stack in one step:

```bash
claude --plugin-dir ./CAMP
```

Inside the session, run `/reload-plugins` if needed. The skills appear namespaced:

```text
/camp:start      front door — routes you to the right skill
/camp:diagnose   /camp:foresight  /camp:recode   /camp:verify
/camp:translate  /camp:test       /camp:learn    /camp:build
```

To auto-load every session, place the plugin under `~/.claude/skills/camp/` (it carries its own manifest and loads as `camp@skills-dir`).

Start with:

```text
/camp:start
```

## Codex, Antigravity, and other hosts (manual tree copy)

These hosts read each skill as a folder but do not understand plugins. Copy the whole repo tree so `skills/`, `docs/`, and `knowledge/` keep their relationship, and point the host's skills directory at `skills/`. The skills carry inline summaries, so they work even where the shared docs are not auto-loaded. Skill names are plain (`diagnose`, `verify`, …) in this mode.

## Smoke test

In a fresh session:

```text
/camp:start

Our city wants to speed up permitting for small infill housing, but approvals still take 9-18 months despite recent reforms.
```

Expected: the front door shows the CAMP banner and routes you to `diagnose`, which diagnoses before advocating, names evidence gaps, and offers a deep-research handoff when the gaps are deep.

## Safety

The installed skills are Markdown instructions and reference files only — no executable scripts. The repo also contains `scripts/verify-camp.sh`, a dev/CI verification tool that is never installed into an agent. If executable skills are added later, review them before installing into an agent with filesystem or network access.
```

- [ ] **Step 2: Replace `docs/using-camp-with-agents.md` with per-host notes, no personal paths**

Write `docs/using-camp-with-agents.md` covering the same two install paths per host, with no hardcoded OneDrive/user paths. Use this content:

```markdown
# Using CAMP With Agent Tools

CAMP is a nine-skill stack in the portable `SKILL.md` format, plus shared docs under `docs/` and `knowledge/`. Install the whole stack together.

## Claude Code / Cowork

CAMP is a Claude Code plugin. Load it with `claude --plugin-dir ./CAMP`, or place it under `~/.claude/skills/camp/` to auto-load. Skills are namespaced: `/camp:start`, `/camp:diagnose`, `/camp:verify`, and so on. Cowork installs skills through the Claude app's Skills UI; upload the repo and keep the folder structure.

## Codex and Antigravity

These hosts read skills as folders but do not support plugins. Copy the whole repo tree so `skills/`, `docs/`, and `knowledge/` stay together, and point the host's skills directory at `skills/`. Skill names are plain (`diagnose`, `verify`, …).

- Codex: personal skills under `~/.codex/skills`.
- Antigravity: project skills under `.agents/skills` (older projects: `.agent/skills`).

## Portable fallback

If a host does not support skills, paste a skill's `SKILL.md` and attach the reference files it names. You lose auto-triggering and progressive loading, but the workflow still runs.

## Safety

Installed skills contain only Markdown instructions and references. The repo's `scripts/verify-camp.sh` is dev/CI tooling, never installed into an agent.
```

- [ ] **Step 3: Verify no personal paths or stale slugs remain in the install docs**

Run: `grep -rEn 'OneDrive|C:\\\\Users|abundance-diagnosis|skills/camp' INSTALLATION.md docs/using-camp-with-agents.md || echo "CLEAN"`
Expected: `CLEAN`

- [ ] **Step 4: Commit**

```bash
git add INSTALLATION.md docs/using-camp-with-agents.md
git commit -m "Rewrite install docs for the full plugin stack"
```

---

## Task 8: Run the gate green + smoke test

**Files:** none unless a check fails.

- [ ] **Step 1: Run the verification gate — expect PASS now**

Run: `./scripts/verify-camp.sh; echo "exit=$?"`
Expected: `verify-camp: OK` and `exit=0`. (An `INFO: claude CLI not found` line is fine.) If any `FAIL:` line appears, fix the named file and re-run before continuing.

- [ ] **Step 2: Confirm the full skill set and the banner wiring**

Run: `ls skills && grep -c '## Startup Banner' docs/interaction-protocol.md && grep -c 'assets/camp-banner.svg' README.md`
Expected: nine folders (build, diagnose, foresight, learn, recode, start, test, translate, verify), then `1` and `1`.

- [ ] **Step 3: Manual smoke test (if a Claude Code CLI is available)**

Run: `claude --plugin-dir . </dev/null 2>&1 | head -20 || echo "manual: load CAMP and run /camp:start"`
Then, interactively in a real session: load the plugin, run `/camp:start`, confirm the CAMP banner and loop map print, and run `/camp:diagnose` on a sample issue end to end.

- [ ] **Step 4: Confirm clean tree**

Run: `git status --short`
Expected: no output.

---

## Self-Review

**Spec coverage:**
- Part 1 graceful self-sufficiency → Task 3 (hard-dep fix; folder-path refs). The `docs/`/`knowledge/` enrichment pointers already resolve in the whole-stack install (the priority model), so they are left as-is per YAGNI; standalone-single-skill polish is deferred (nice-to-have per spec). ✓ (scope note)
- Part 2 plugin (manifest, folder renames, frontmatter names) → Tasks 2, 4. `${CLAUDE_PLUGIN_ROOT}` anchoring is validated via `claude plugin validate` / `--plugin-dir` in Tasks 4 and 8; references stay repo-root-relative, which resolve in the whole-stack model. ✓
- Part 3 startup banner → Task 5. ✓
- Part 4 README SVG → Task 6. ✓
- Part 5 install docs rewrite → Task 7. ✓
- Part 6 verification → Task 1 (script) + Task 8 (run green). ✓

**Placeholder scan:** No TBD/TODO. Full content for the script, manifest, SVG, banner literal, and both rewritten docs is inline. The one conditional is the license value in Task 4 Step 1, which has an explicit check and a correct default (MIT). ✓

**Consistency:** Folder names, frontmatter names, and `/camp:<name>` invocations are identical across Tasks 2, 7, and 8 (build, diagnose, foresight, learn, recode, start, test, translate, verify). The verify script's slug list (Task 1) matches the rename set (Task 2) and the grep guards (Tasks 3, 7). The banner literal in Task 5 matches the spec. ✓

**Deviation noted:** Part 1's "reword enrichment pointers to degrade openly" is reduced to the hard-dep fix only, because the user prioritized whole-stack install (where those pointers resolve) and deprioritized standalone-skill. Flagged here rather than silently dropped.
