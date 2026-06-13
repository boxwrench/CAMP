# CAMP Guided-UI Interaction Layer — Design Spec

Date: 2026-06-12
Status: approved (design), pending implementation plan

## Problem

CAMP is a stack of nine Claude Code / Cowork skills. A skill has no UI of its own — it runs inside a host and the user experiences it as plain chat. The diagnose→build flow currently reads as free-form conversation: the user cannot easily see where they are in the loop, choices are typed rather than selected, and (the failure mode the user named) an agent can over-question, pestering for answers that are not authentic.

We want the in-host flow to *feel* like a guided UI — visible structure, selectable choices — while preserving user agency. This stays a skill (Path A). It does not become a standalone app that calls Claude directly (Path B, explicitly out of scope).

## Goals

- Make the loop legible: the user always knows where they are and what comes next.
- Replace "type your answer" with selectable menus where a host supports them.
- Preserve agency: the user holds the wheel; structure is offered, never forced.
- Stop asking at the right time: deferral is treated as a real answer, not a gap.
- First-class in Claude Code and Cowork; graceful degradation in Codex and Antigravity.

## Non-Goals (YAGNI)

- No standalone TUI/web app and no direct Claude API integration (that is Path B).
- No configuration or question-preference engine. The stop-asking rule is built in, not a setting.
- No ASCII art or boxed layouts. Plain text only, so it renders identically across hosts.
- No state/persistence files for progress. The memo and the conversation already carry state.

## Architecture

Approach A: a shared protocol plus a thin hook in each skill.

- **`docs/interaction-protocol.md`** — the canonical, full specification of the five components below. Single source of truth.
- **`## Interaction` section in each of the 9 `SKILL.md` files** — a ~6–10 line hook that states the behavior and points to the protocol doc. Mirrors how routing is handled today (short version in each skill, canonical map in `routing-map.md`).

This keeps the behavior consistent whether the user enters through `camp` or jumps straight to `verify`, and keeps the host-fallback logic in one place.

**Known tradeoff:** the `## Interaction` hooks reference a repo-relative path (`docs/interaction-protocol.md`), the same dependency already present for `routing-map.md` and `knowledge/lenses.md`. Acceptable for whole-stack install; revisit if standalone-skill distribution becomes real.

## Components

### 1. Loop map (progress banner)

Printed **on entry to a phase**, not on every message (avoids clutter). Shows the eight worker steps with the current position bracketed and a one-line reminder that it is a map, not rails.

```
CAMP   diagnose · foresight · recode · [verify] · translate · test · learn · build
       ▸ you are here: verify    ·    say "jump to <skill>" or "go back" anytime
```

Rules:
- Render once when a skill/phase begins and again when routing is offered.
- Bracket the current skill. The router (`camp`) shows the map without a bracket, since it is choosing where to start.
- The map is navigable: the user may jump to any skill or go back at any time.

### 2. Host-adaptive menus with an escape hatch

Detection rule (no hardcoded host names, self-adapting):

> If an `AskUserQuestion` tool variant is in your tool list, use native menus. Otherwise present a compact numbered list and accept either a number or free-text prose.

Rules:
- Every menu includes an explicit open option: "Something else — let me explain."
- Free-text is always honored, even when a menu is displayed. The menu is a convenience, never a cage.
- Menus appear only at genuine forks: mode selection (pass one / pass two), approach choices, and routing decisions. They are not used for ordinary intake fields, which stay conversational.

### 3. Stop-asking heuristic (agency guardrail)

The differentiator. Concrete rules with teeth:

- **Deferral is a real answer.** If the user says "you pick," "not sure," "skip," "just draft," "let it sit," "let's move on," or goes silent, treat it as an authentic decision to proceed. Proceed with best effort, record the assumption in the memo, and move on. Do not re-ask.
- **No reworded re-asks.** Never ask the same question twice in different words.
- **Question budget.** Ask at most ~2–3 questions in a row within a phase before producing something the user can react to — a partial draft, a summary, or a recommendation.
- **One good question beats three weak ones.** Ask the single highest-value question, infer the rest, and let the user correct.
- **A blank or "I don't know" is signal, not a gap.** Log it as an open question in the memo's uncertainty register rather than extracting a guess.

### 4. Recommend-don't-railroad routing

At a phase boundary:
- Present three things: where the user is (loop map), the recommended next skill, and the one-line reason.
- Then **stop and wait.** Never auto-advance to the next skill or phase.
- The user may accept, choose a different skill, revise the current artifact, or stop entirely.

This formalizes the "wait for consent" behavior on top of the existing routing tables in each skill and `routing-map.md`.

### 5. Consistent phase headers + visible structure

- On entering a skill, print a simple header: skill name + one-line purpose. The user always knows what is happening.
- When a memo table is the current focus (e.g., the weighted causal model during diagnosis), surface that table so the user watches the structure form.
- Uses the existing `memo-template.md` format. No new artifact format is introduced.

## The Thin `## Interaction` Hook

Each `SKILL.md` gets a section approximately like:

```markdown
## Interaction

Follow `docs/interaction-protocol.md`. In short:

- On entry, print the loop map with this skill bracketed.
- For genuine forks (mode, approach, routing), offer a menu with an open
  "something else" option when an AskUserQuestion variant is available;
  otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", silence) as a real answer:
  proceed, record the assumption, never re-ask. Cap at ~3 questions before
  drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason,
  then wait. Never auto-advance.
```

The router (`camp`) gets a variant that renders the map without a bracket and whose job is dispatch, not drafting.

## Implementation Phasing

For the implementation plan:

1. Write `docs/interaction-protocol.md` (the full spec above).
2. Apply the hook to `camp` and `diagnose` first — the most-hit entry points — as the proof.
3. Propagate the identical hook to the other seven skills: `foresight`, `recode`, `verify`, `translate`, `test`, `learn`, `build`.
4. Update `README.md` to mention the guided-UI layer.

## Success Criteria

- A user running `diagnose` sees the loop map, gets selectable choices at forks, and never gets asked the same thing twice.
- Saying "you pick" or "just draft it" moves the work forward instead of triggering more questions.
- The flow degrades to numbered-list prompts in a host without `AskUserQuestion`, with no broken references to missing tools.
- No skill auto-advances to the next phase without the user's explicit go-ahead.
