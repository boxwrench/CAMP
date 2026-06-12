---
name: abundance-learn
description: |
  Use when a completed memo, win, failure, mechanism, or case holds a reusable
  lesson worth capturing so other domains can learn from it. Extracts the recurring
  mechanism, the domain-specific lesson that travels, what looks similar but is
  actually different, the evidence behind the pattern, and the caution against
  overgeneralizing. Produces a pattern-library entry with mechanism tags, transfer
  notes, and anti-pattern notes. Writes to the knowledge library.
---

# Abundance Learn

## Core Rule

A lesson is only reusable if you name the mechanism, the evidence, and the limit. Capture what transfers across domains without pretending every case is the same case.

## Spine

In the **What / How / Why** spine (see `knowledge/lenses.md`), learn harvests reusable *How* mechanisms — the supply-side constraints, capture patterns, and effective-government practices that recur across housing, energy, education, and jobs. The point is to make the next diagnosis faster by remembering how this machinery behaved last time.

## Purpose

Capture durable lessons from a memo, win, failure, mechanism, or case so the knowledge library compounds. This is the pattern-library entry in the CAMP stack — more substantive than a session note, because the goal is cross-domain transfer.

## Preamble: Find The Source

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` and read the completed memo, plus any `verify` evidence review and `test` feedback results attached to it.
2. If no memo exists, ask the user for the case or experience to capture.
3. Read `knowledge/README.md` and `knowledge/lenses.md` to place the entry correctly and avoid duplicating an existing lens.

## Workflow

1. **Name the mechanism**
   - What system mechanic appears here that will recur elsewhere — veto points, procurement failure, capture, fragmentation, hollow compliance, scarcity rents?

2. **The lesson that travels**
   - What domain-specific finding generalizes to other domains? State it as a transferable claim, not a story.

3. **The false friend**
   - What looks similar to a known pattern but is actually different here? Naming this prevents lazy analogy in future diagnoses.

4. **Evidence**
   - What evidence supports this pattern? A pattern with no evidence is folklore — mark its confidence.

5. **Limit and anti-pattern**
   - What is the caution against overgeneralizing? Where would applying this pattern be a mistake?

6. **Place and link**
   - Classify the entry: `lenses`, `cases`, `mechanisms`, or `prompts` (see `knowledge/README.md`).
   - Link it to the source memo and any related existing entries.

## Required Output

Write a pattern-library entry into the `knowledge/` library, classified by type, with:

- **Mechanism tags**: the recurring system mechanics this case illustrates.
- **Transfer notes**: where else this lesson likely applies, and the conditions for transfer.
- **Anti-pattern notes**: where the lesson breaks down, and the false friends to avoid.
- **Evidence and confidence**: what supports the pattern and how strongly.
- **Links**: to the source memo and related entries.

## Routing

Route based on what the entry revealed. See `docs/routing-map.md`.

| If learn revealed… | Recommend |
| --- | --- |
| A mechanism that reframes the original problem | back to `diagnose` for a revised memo |
| A pattern worth circulating to others working the same machinery | `build` |
| A strategic implication for the long run | `foresight` |

Learn is usually the end of a loop, not the middle. It often runs after `build` and a real-world result, when there is something true to record.

## Completion Standard

A useful run ends with:

- A named, tagged mechanism, not just a retelling of the case.
- A lesson stated as a transferable claim with its conditions for transfer.
- An explicit anti-pattern: where this lesson would mislead.
- Evidence and a confidence level, plus links to the source.
