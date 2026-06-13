# CAMP Guided-UI Interaction Layer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the in-host CAMP flow feel like a guided UI that preserves user agency, by adding a shared interaction protocol and a thin `## Interaction` hook to each of the nine skills.

**Architecture:** One canonical `docs/interaction-protocol.md` holds the full spec (loop map, host-adaptive menus, stop-asking guardrail, recommend-don't-railroad routing, phase headers). Each `SKILL.md` carries a short `## Interaction` section that points to it. Worker skills share one hook; the `camp` router gets a variant. Same pattern as the existing `routing-map.md`.

**Tech Stack:** Markdown skill files (`SKILL.md`), no build or test runner. Verification is by `grep` and reading. Reference: the design spec at `docs/superpowers/specs/2026-06-12-camp-guided-ui-design.md`.

**Note on "tests":** There is no code here. Each task's verify step is a structural check (`grep`, frontmatter intact, references resolve). Keep the verify-before-commit discipline.

---

## File Structure

- Create: `docs/interaction-protocol.md` — canonical interaction spec (single source of truth).
- Modify: `skills/abundance-diagnosis/SKILL.md` — add worker `## Interaction` hook.
- Modify: `skills/camp/SKILL.md` — add router `## Interaction` hook.
- Modify: the other seven worker skills — add the identical worker hook:
  - `skills/abundance-foresight/SKILL.md`
  - `skills/abundance-recode/SKILL.md`
  - `skills/abundance-verify/SKILL.md`
  - `skills/abundance-translate/SKILL.md`
  - `skills/abundance-test/SKILL.md`
  - `skills/abundance-learn/SKILL.md`
  - `skills/abundance-build/SKILL.md`
- Modify: `README.md` — mention the guided-UI layer and link the protocol.

---

## Task 1: Write the interaction protocol doc

**Files:**
- Create: `docs/interaction-protocol.md`

- [ ] **Step 1: Create `docs/interaction-protocol.md` with this exact content**

```markdown
# Interaction Protocol

How every CAMP skill should run in a host chat so the flow feels like a guided UI while leaving the user in control. Each `SKILL.md` carries a short `## Interaction` hook that points here; this file is the full version.

First-class hosts: Claude Code, Claude Cowork. Supported with graceful fallback: Codex, Antigravity.

## Principle

Offer structure the user can lean on or ignore. Menus are scaffolding, not gates. The loop is a map, not rails. Recommendations wait for consent. Never pester for answers the user has not authentically given.

## 1. Loop Map

At the start of a skill, and again when you offer routing, print the loop map so the user always knows where they are:

\`\`\`
CAMP   diagnose · foresight · recode · verify · translate · test · learn · build
       ▸ you are here: <skill>    ·    say "jump to <skill>" or "go back" anytime
\`\`\`

- Bracket the current skill in the top line, e.g. `... recode · [verify] · translate ...`.
- The router `camp` prints the map with no bracket, since it is choosing where to start.
- Print it on entry and at routing — not on every message.
- The map is navigable: honor "jump to <skill>" and "go back" at any time.

## 2. Menus With An Escape Hatch

Detect the host by tools, not by name:

> If an `AskUserQuestion` tool variant is in your tool list, use native menus. Otherwise present a compact numbered list and accept either a number or free-text prose.

- Use menus only at genuine forks: mode selection (pass one / pass two), approach choices, and routing. Keep ordinary intake conversational.
- Every menu includes an open option: "Something else — let me explain."
- Free-text is always honored, even when a menu is shown. The menu is a convenience, never a cage.

Numbered-list fallback example:

\`\`\`
How do you want to run this?
  1. Pass one — hypothesis memo, no live research
  2. Pass two — evidence-backed revision
  3. Something else — let me explain
Reply with a number, or just tell me.
\`\`\`

## 3. Stop Asking (Agency Guardrail)

- Deferral is a real answer. "you pick", "not sure", "skip", "just draft", "let it sit", "let's move on", or silence → proceed with best effort, record the assumption in the memo, and move on. Do not re-ask.
- Never ask the same question twice in different words.
- Ask at most two or three questions in a row before producing something to react to: a partial draft, a summary, or a recommendation.
- One good question beats three weak ones. Ask the highest-value question, infer the rest, let the user correct.
- A blank or "I don't know" is signal, not a gap. Log it in the memo's uncertainty register instead of extracting a guess.

## 4. Recommend, Don't Railroad

At a phase boundary:

- Print the loop map, name the recommended next skill, and give the one-line reason.
- Then stop and wait. Never auto-advance to the next skill or phase.
- The user may accept, choose a different skill, revise the current artifact, or stop.

## 5. Phase Header And Visible Structure

- On entering a skill, print a one-line header: the skill name and its purpose.
- When a memo table is the current focus (for example the weighted causal model), surface that table so the user watches the structure form.
- Use the existing memo template. Do not invent a new artifact format.
```

- [ ] **Step 2: Verify the file has all five component headings**

Run: `grep -nE '^## (Principle|1\. Loop Map|2\. Menus|3\. Stop Asking|4\. Recommend|5\. Phase Header)' docs/interaction-protocol.md`
Expected: six matching lines (Principle plus the five numbered sections).

- [ ] **Step 3: Commit**

```bash
git add docs/interaction-protocol.md
git commit -m "Add canonical CAMP interaction protocol"
```

---

## Task 2: Add the worker hook to `diagnose` (proof of pattern)

**Files:**
- Modify: `skills/abundance-diagnosis/SKILL.md`

- [ ] **Step 1: Insert a new `## Interaction` section immediately after the `## Purpose` section (before the next `##` heading, which is `## Required Output`)**

Insert exactly this block:

```markdown
## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.
```

- [ ] **Step 2: Verify the section landed and frontmatter is intact**

Run: `grep -n '^## Interaction' skills/abundance-diagnosis/SKILL.md && head -1 skills/abundance-diagnosis/SKILL.md`
Expected: one `## Interaction` match, and the first line is `---` (frontmatter intact).

- [ ] **Step 3: Verify it references the protocol**

Run: `grep -c 'docs/interaction-protocol.md' skills/abundance-diagnosis/SKILL.md`
Expected: `1`

- [ ] **Step 4: Commit**

```bash
git add skills/abundance-diagnosis/SKILL.md
git commit -m "Add interaction hook to diagnose"
```

---

## Task 3: Add the router hook to `camp`

**Files:**
- Modify: `skills/camp/SKILL.md`

- [ ] **Step 1: Insert a new `## Interaction` section immediately after the `## Core Rule` section (before the next `##` heading, which is `## Workflow`)**

Insert exactly this block (note: this is the router variant — no bracket, dispatch not draft):

```markdown
## Interaction

Run this router per `docs/interaction-protocol.md`. In short:

- On entry, print the loop map with no skill bracketed (you are choosing where to start).
- Offer the route as a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral as a real answer: if the user is unsure, read the latest memo and recommend a starting skill rather than interrogating. Ask at most one clarifying question before routing.
- Recommend one skill with a one-line reason and dispatch it; do not run the diagnosis yourself.
```

- [ ] **Step 2: Verify the section landed**

Run: `grep -n '^## Interaction' skills/camp/SKILL.md && grep -c 'no skill bracketed' skills/camp/SKILL.md`
Expected: one `## Interaction` match and `1` (confirms the router variant, not the worker hook).

- [ ] **Step 3: Commit**

```bash
git add skills/camp/SKILL.md
git commit -m "Add router interaction hook to camp"
```

---

## Task 4: Propagate the worker hook to the remaining seven skills

The hook is identical to the one added to `diagnose` in Task 2. Apply it to each of the seven files below.

**Files:**
- Modify: `skills/abundance-foresight/SKILL.md`
- Modify: `skills/abundance-recode/SKILL.md`
- Modify: `skills/abundance-verify/SKILL.md`
- Modify: `skills/abundance-translate/SKILL.md`
- Modify: `skills/abundance-test/SKILL.md`
- Modify: `skills/abundance-learn/SKILL.md`
- Modify: `skills/abundance-build/SKILL.md`

- [ ] **Step 1: In each of the seven files, insert this exact `## Interaction` section immediately after the `## Purpose` section (before the next `##` heading — which is `## Preamble: Find The Memo` in every file except `abundance-learn`, where it is `## Preamble: Find The Source`)**

```markdown
## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.
```

- [ ] **Step 2: Verify all nine skills now carry an `## Interaction` section**

Run: `grep -rl '^## Interaction' skills/*/SKILL.md | wc -l`
Expected: `9`

- [ ] **Step 3: Verify every skill references the protocol exactly once**

Run: `for f in skills/*/SKILL.md; do printf "%s " "$(grep -c 'docs/interaction-protocol.md' "$f")"; done; echo`
Expected: nine `1`s.

- [ ] **Step 4: Verify each modified file's frontmatter is still intact**

Run: `for f in skills/abundance-foresight skills/abundance-recode skills/abundance-verify skills/abundance-translate skills/abundance-test skills/abundance-learn skills/abundance-build; do head -1 "$f/SKILL.md"; done`
Expected: seven lines, each `---`.

- [ ] **Step 5: Commit**

```bash
git add skills/abundance-foresight/SKILL.md skills/abundance-recode/SKILL.md skills/abundance-verify/SKILL.md skills/abundance-translate/SKILL.md skills/abundance-test/SKILL.md skills/abundance-learn/SKILL.md skills/abundance-build/SKILL.md
git commit -m "Propagate interaction hook to remaining CAMP skills"
```

---

## Task 5: Mention the guided-UI layer in the README

**Files:**
- Modify: `README.md`

- [ ] **Step 1: In the "Core Workflow" section, immediately after the paragraph that begins "All eight worker skills plus the `camp` router are built." add this sentence**

Append to that paragraph (or as a new line right after it):

```markdown
Every skill runs through a shared guided-UI layer — a loop map, host-adaptive menus, and an agency guardrail that treats "you pick" or "just draft" as a real answer rather than asking more. See [`docs/interaction-protocol.md`](docs/interaction-protocol.md).
```

- [ ] **Step 2: In the "What exists now" list of the "Repository Status" section, add this bullet after the routing bullet (`- Conditional routing between skills ...`)**

```markdown
- A guided-UI interaction layer across all skills ([`docs/interaction-protocol.md`](docs/interaction-protocol.md))
```

- [ ] **Step 3: In the "Project Map" section, add this entry after the `docs/routing-map.md` line**

```markdown
- [`docs/interaction-protocol.md`](docs/interaction-protocol.md): how skills present a guided UI in-chat
```

- [ ] **Step 4: Verify all three README references resolve to the file**

Run: `grep -c 'docs/interaction-protocol.md' README.md && test -f docs/interaction-protocol.md && echo OK`
Expected: a count of `3` and `OK`.

- [ ] **Step 5: Commit**

```bash
git add README.md
git commit -m "Document guided-UI layer in README"
```

---

## Task 6: Final consistency sweep

**Files:** none modified unless a check fails.

- [ ] **Step 1: Confirm no worker skill accidentally got the router variant, and camp did not get the worker variant**

Run: `grep -l 'no skill bracketed' skills/*/SKILL.md`
Expected: only `skills/camp/SKILL.md`.

- [ ] **Step 2: Confirm the loop-map order is identical wherever it appears**

Run: `grep -n 'diagnose · foresight · recode · verify · translate · test · learn · build' docs/interaction-protocol.md`
Expected: one match (the canonical loop map). The skill hooks reference "the loop map" rather than re-listing it, so this string lives only in the protocol doc.

- [ ] **Step 3: Confirm the working tree is clean and all work is committed**

Run: `git status --short`
Expected: no output (clean tree).

---

## Self-Review

**Spec coverage:**
- Loop map → protocol §1 (Task 1), referenced by every hook (Tasks 2–4). ✓
- Host-adaptive menus + escape hatch → protocol §2 (Task 1), hooks (Tasks 2–4). ✓
- Stop-asking guardrail → protocol §3 (Task 1), hooks (Tasks 2–4). ✓
- Recommend-don't-railroad → protocol §4 (Task 1), worker hook (Tasks 2, 4); router dispatch in camp hook (Task 3). ✓
- Phase header + visible structure → protocol §5 (Task 1), worker hook header line (Tasks 2, 4). ✓
- Architecture (shared doc + thin hook in each of 9 skills) → Tasks 1–4. ✓
- Phasing (camp + diagnose first, then the other 7) → Tasks 2, 3, then 4. ✓
- README mention → Task 5. ✓

**Placeholder scan:** No TBD/TODO; every insert block is complete literal content. ✓

**Type/string consistency:** The worker hook block in Task 2 and Task 4 is byte-identical. The router hook in Task 3 is the only one containing "no skill bracketed", which Task 6 Step 1 checks. The loop-map string is defined once (protocol §1) and checked in Task 6 Step 2. ✓
