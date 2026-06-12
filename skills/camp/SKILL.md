---
name: camp
description: |
  Front door and router for the CAMP stack. Use when someone has a civic problem,
  policy idea, abundance instinct, or in-progress Abundance Systems Memo but is not
  sure which CAMP skill to run, or just wants to start. Reads any existing memo to
  see where they are in the loop, then recommends and launches the right skill:
  diagnose, recode, verify, foresight, translate, test, learn, or build. The point
  is that the user never has to know the skill names — describe the situation and
  CAMP routes it.
---

# CAMP Router

## Purpose

CAMP is a stack of independent, complementary skills. This router is the single front door. The user describes a civic problem, a policy idea, or where they are with an existing memo, and CAMP points them to the right skill and launches it.

The user should never need to memorize skill names. That is this skill's whole job.

## Core Rule

Route, do not redo. Read what already exists, identify the single best next move, and hand off. Do not run a full diagnosis from inside the router — dispatch the skill that does.

## Workflow

1. **Read the loop state**
   - Look for `memos/` in the working repo and read the most recent Abundance Systems Memo.
   - If a memo exists, note its mode (pass one / pass two), its status, and its weakest section.
   - If no memo exists, this is almost certainly a `diagnose` start.

2. **Classify the situation**
   - Use the triage table below. Match the user's stated need and the memo's weak point to one skill.
   - If two skills could fit, prefer the earlier one in the loop (diagnosis before review, review before circulation). An undiagnosed idea always goes to `diagnose` first.

3. **Route**
   - If the match is clear, say which skill and why in one sentence, then invoke it.
   - If it is genuinely ambiguous, ask **one** clarifying question, then route. Do not interrogate.

## Triage Table

| The user's situation | Route to |
| --- | --- |
| A raw public problem or policy idea, not yet diagnosed | `diagnose` |
| Has a memo but it is hand-wavy on authority, procurement, staffing, budgets, or who-does-what Monday morning | `recode` |
| Has a memo with confident causal weights or public claims that are not backed by sources | `verify` |
| Has a memo but is unsure about second-order effects, time horizons, or how the system reacts | `foresight` |
| Has solid findings but needs to turn them into public claims without overclaiming | `translate` |
| Has an intervention but no way to tell if it is drifting or producing hollow progress | `test` |
| Finished something worth capturing as a reusable cross-domain lesson | `learn` |
| Has an approved memo and wants to circulate it and define a first real-world test | `build` |
| Wants a stronger evidence base than quick search can give | `verify`, then its deep-research handoff |

See `docs/routing-map.md` for the canonical map.

## Skill Reference

All eight worker skills are live: `diagnose`, `foresight`, `recode`, `verify`, `translate`, `test`, `learn`, `build`. Route to exactly one. If a route would need a skill that is ever removed or unavailable in the install, name the next move and the question it would answer rather than failing silently.

## Completion Standard

A useful run ends with one of:

- A skill invoked, with a one-line reason.
- One clarifying question asked, then a skill invoked.

Never end by listing every skill and asking the user to choose. Routing is the job.
