---
name: test
description: |
  Use when an intervention or action plan needs real feedback loops that can
  detect drift, capture, hollow progress, or failure. Checks what observable
  system behavior should change, who sees early signal and how soon, what would
  prove the progress is hollow, and what would trigger revision or abandonment.
  Distinguishes outputs from outcomes from vibes. Produces a measurement plan,
  revised drift signals, and learning-experiment improvements. Runs on a memo in
  memos/ or standalone on an intervention.
---

# Abundance Test

## Core Rule

If no observable signal would tell you the intervention is failing, you are not running an experiment — you are hoping. Define what would change, who would see it, and when, before declaring progress.

## Spine

In the **What / How / Why** spine (see `knowledge/lenses.md`), test enforces effective government: outcomes, not inputs. The *How* claims a method; this skill checks whether the method actually produced the *What*, and whether the signal you are measuring is an output, an outcome, or a vibe.

## Purpose

Check whether the action plan has feedback loops that can detect drift, capture, hollow progress, implementation failure, or unintended consequences. This is the feedback-loop check in the CAMP stack.

## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.

## Preamble: Find The Memo

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` in the working repo and read the most recent memo.
2. If a memo exists, test reviews its **Intervention Portfolio**, **Feedback and drift watchlist**, and **learning experiment**.
3. If no memo exists, ask the user for the intervention to instrument. If it is undiagnosed, recommend `diagnose` first.

## Workflow

1. **Target behavior**
   - What observable system behavior should change if this works? State it concretely enough to measure.

2. **Signal owner and latency**
   - Who sees the early signal? How soon should it appear? A signal that only shows up in a multi-year outcome cannot steer a near-term lever.

3. **Output / outcome / vibe**
   - Classify each proposed metric. Outputs (activity) are easy and misleading; outcomes (real-world change) are what matter; vibes (sentiment) are not evidence. Flag any plan measuring mostly outputs or vibes.

4. **Hollow-progress test**
   - What would prove this is hollow progress — activity without the outcome? Name the specific false-positive to watch for.

5. **Revision and abandonment triggers**
   - What signal should trigger a change of course? What signal should trigger abandonment? An intervention with no abandonment condition cannot fail honestly.

6. **Drift and capture**
   - What early signal would show the intervention being captured, watered down, or routed around?

## Required Output

Write a feedback-loop check. If a memo exists, append it as a section and update the memo's drift watchlist and learning experiment; otherwise save it to `memos/` as a standalone review.

Include:

- **Measurement plan**: metric, output/outcome/vibe, owner, who sees it, latency.
- **Revised drift signals**: the specific observations that would reveal drift, capture, or hollow progress.
- **Revision/abandonment triggers**: the conditions that should change or end the intervention.
- **Learning-experiment improvements**: how to make the experiment actually informative.

| Metric | Type | Owner | Who sees it | Latency |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Routing

Route to the one skill that addresses what test exposed. See `docs/routing-map.md`.

| If test exposed… | Recommend |
| --- | --- |
| Signals that depend on implementation owners and systems being in place | `recode` |
| Long-run drift that needs strategic foresight, not just a metric | `foresight` |
| An instrumented intervention ready to launch and watch | `build` |
| A pattern worth capturing for reuse across domains | `learn` |

## Completion Standard

A useful run ends with:

- A concrete observable behavior the intervention should change.
- Each metric classified as output, outcome, or vibe, with the vibes demoted.
- A named hollow-progress false-positive to watch for.
- Explicit revision and abandonment triggers.
