---
name: abundance-recode
description: |
  Use when an abundance idea, civic reform, policy, or Abundance Systems Memo
  needs to survive contact with real institutions: authority, procurement,
  staffing, budgets, legal process, IT, and day-to-day operations. Pressure-tests
  implementation mechanics and produces an owner/action matrix, an operational
  blocker list, a Monday-morning readiness check, and concrete evidence requests.
  Runs on an existing memo in memos/ or standalone on a proposed intervention.
  Named after Recoding America: the gap between policy passage and lived reality.
---

# Abundance Recode

## Core Rule

A policy no one can implement on Monday morning is not a policy. Diagnose the implementation machinery before assuming the intervention will happen.

In the **What / How / Why** spine (see `knowledge/lenses.md`), recode lives in the *How*: supply-side progressivism (which constraint gets removed, against whom) and effective government (which outcome gets measured, not just which input gets funded). This is the layer where abundance ideas most often die.

## Purpose

Test whether an intervention can survive actual institutions: who has authority, who owns delivery end to end, what procurement, staffing, budget, legal, and IT constraints bind it, and what breaks between passage and lived reality. This is the implementation-mechanics review in the CAMP stack.

## Preamble: Find The Memo

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` in the working repo and read the most recent memo.
2. If a memo exists, recode its **Intervention Portfolio** (structural bet, near-term lever, learning experiment) and its **System Map**.
3. If no memo exists, ask the user for the specific intervention to pressure-test. If the idea is still vague or undiagnosed, recommend running `diagnose` first, then return here.

Recode can run standalone, but it is sharpest when it has a diagnosis to work from.

## Workflow

Work one intervention at a time. For each, run the trace below.

1. **Locate the intervention**
   - State the exact thing that must get built, changed, delivered, or enforced.
   - If the memo lists several, recode the near-term lever first, then the structural bet.

2. **Authority trace**
   - For each step, name who has the legal or institutional authority to do it.
   - Flag steps where authority is missing, split across agencies, or contested.

3. **End-to-end ownership**
   - Name who owns implementation from start to lived outcome, not just who passes the policy.
   - Flag any handoff with no clear owner — these are where interventions die.

4. **Constraint scan**
   - Procurement: what must be bought, under what rules, on what timeline.
   - Staffing: who does the work, are they hired, do they have capacity and skill.
   - Budget: is there money, in the right account, available when needed.
   - Legal: what statute, rule, contract, or process gates each step.
   - IT and systems: what software, data, or integration the work depends on.

5. **Policy-to-reality gap**
   - Predict what breaks between passage and the person actually served.
   - Look for hollow compliance, delay, contractor capture, and process accretion.

6. **Monday-morning test**
   - State what the implementer needs to start work the next business day.
   - If they cannot start, name the smallest missing precondition.

7. **Feedback latency**
   - Identify what feedback reaches decision-makers fast enough to correct course.
   - Flag where bad implementation would stay invisible until it is too late.

## Required Output

Write an implementation-mechanics review. If a memo exists, append it as a section and update the memo's near-term lever; otherwise save it to `memos/` as a standalone review.

Include:

- **Owner/action matrix**: step, owner, authority, constraint, status.
- **Operational blocker list**: ranked, with the smallest unblocking move for each.
- **Monday-morning readiness**: can the implementer start, and if not, what is missing.
- **Revised near-term lever**: the intervention rewritten to be implementable, or the precondition that must come first.
- **Evidence requests**: the procurement, budget, staffing, or legal facts a pass-two evidence pull must confirm.

| Step | Owner | Authority | Binding constraint | Status |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Routing

CAMP is a stack of independent skills; recode hands off to the next based on what the review exposed. Route to one, not a menu. See `docs/routing-map.md`.

| If the review exposed… | Recommend |
| --- | --- |
| Implementation facts (procurement, budget, legal) that must be confirmed before acting | `verify`, or a deep-research handoff |
| A strategic risk: the intervention works mechanically but disturbs the wrong equilibrium | `foresight` |
| No way to see whether implementation is drifting or hollow | `test` |
| An intervention that is implementable and approved, ready to circulate | `build` |
| A diagnosis that was wrong about the real bottleneck | back to `diagnose` for a pass-two revision |

Route to one skill, not a menu. Name the specific question the next skill would answer so the handoff is concrete.

## Completion Standard

A useful run ends with:

- Every implementation step assigned an owner and an authority.
- The binding constraints named, ranked, and each given a smallest unblocking move.
- An honest Monday-morning readiness verdict.
- A near-term lever that an implementer could actually start, or the precondition that must come first.
