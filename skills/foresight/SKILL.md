---
name: foresight
description: |
  Use when an Abundance Systems Memo or proposed intervention needs to be
  stress-tested at the strategic level: second-order effects, time horizons, and
  how the system reacts over years. Asks whether the diagnosis is ambitious
  enough, what actor adapts against the intervention, what equilibrium it
  disturbs, and what happens at six months, two years, and ten years. Produces a
  second-order effects register, a stronger structural bet, and risks that should
  alter the action plan. Runs on a memo in memos/ or standalone on an intervention.
---

# Abundance Foresight

## Core Rule

A reform that works on paper still has to survive the system's reaction. Predict how actors adapt, what equilibrium shifts, and what the intervention looks like in ten years before committing to it.

## Spine

In the **What / How / Why** spine (see `knowledge/lenses.md`), foresight checks two things: whether the *What* is aimed at the right system behavior (ambitious enough, not a symptom chosen because the root cause is politically uncomfortable), and whether the *How*'s second-order effects serve or betray the *Why* of mutuality over the long run.

## Purpose

Stress-test the memo at the highest strategic level. This is the strategic-foresight review in the CAMP stack — the equivalent of asking a founder whether they are thinking big enough and whether they understand how the world reacts.

## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.

## Preamble: Find The Memo

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` in the working repo and read the most recent memo.
2. If a memo exists, foresight reviews its **Weighted Causal Model**, **Intervention Portfolio**, and **Strategic Foresight** section.
3. If no memo exists, ask the user for the intervention to stress-test. If it is undiagnosed, recommend `diagnose` first.

## Workflow

1. **Locate the bet**
   - State the structural bet and the near-term lever being tested.

2. **Success and half-success**
   - What happens if this fully works? What new equilibrium results?
   - What happens if it half-works? Half-built reforms often create durable harm — name it.

3. **Adaptive opposition**
   - Which actor adapts against this, and how? Who routes around it, captures it, or litigates it?
   - What does the intervention look like after the affected interests have had two years to respond?

4. **Equilibrium disturbed**
   - What stable arrangement does this disrupt? Who currently benefits from the status quo, and what do they do when it moves?

5. **Time horizons**
   - Six-month reaction: immediate political and institutional response.
   - Two-year reaction: adaptation, implementation reality, early drift.
   - Ten-year reaction: the new equilibrium, or the reversion.

6. **Symptom check**
   - Is the memo solving a symptom because the root cause is politically uncomfortable? Name the harder bet it is avoiding.

## Required Output

Write a strategic foresight review. If a memo exists, append it as a section and update the memo's Strategic Foresight and structural bet; otherwise save it to `memos/` as a standalone review.

Include:

- **Second-order effects register**: effect, time horizon, likelihood, who it helps or harms.
- **Adaptive-opposition map**: actor, likely counter-move, what it does to the intervention.
- **Stronger structural bet**: the bet rewritten to be more ambitious or more robust to reaction, or a defense of the current one.
- **Plan-altering risks**: the foresight findings that should change the action plan now.

| Effect | Horizon | Likelihood | Helps / harms |
| --- | --- | --- | --- |
|  |  |  |  |

## Routing

Route to the one skill that addresses what foresight exposed. See `docs/routing-map.md`.

| If foresight exposed… | Recommend |
| --- | --- |
| A bet that depends on implementation facts that must be confirmed | `verify` |
| A second-order effect that lives in execution: procurement, staffing, authority | `recode` |
| Long-run drift that needs observable signals to catch | `test` |
| A reframed, more ambitious bet that needs re-diagnosis | back to `diagnose` |
| A strategy that holds up and is ready to communicate | `translate` |

## Completion Standard

A useful run ends with:

- Named consequences at six months, two years, and ten years.
- The adaptive opposition identified, with its likely counter-moves.
- A structural bet that is either strengthened or honestly defended.
- The risks that should change the action plan now, not later.
