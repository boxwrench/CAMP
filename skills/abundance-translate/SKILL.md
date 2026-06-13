---
name: abundance-translate
description: |
  Use when internal diagnosis needs to become public claims without overclaiming.
  Reviews the public translation table for audience fit, clarity, persuasion, and
  evidence discipline: which audience, what the evidence actually supports, what is
  tempting but unsupported, and wording that preserves uncertainty without sounding
  weak. Produces a revised translation table, audience-specific message variants,
  overclaim notes, and an optional public one-pager. Runs on a memo in memos/ or
  standalone on a set of findings.
---

# Abundance Translate

## Core Rule

Translate findings into public claims without laundering uncertainty into slogans. Every public claim must trace back to an internal finding and the evidence behind it.

## Spine

In the **What / How / Why** spine (see `knowledge/lenses.md`), translate is the bridge from internal *What* and *How* to a public *Why*. The motivation — mutuality, "a single garment of destiny" — is the frame that makes people care, but it must rest on a concrete, evidenced *What*. Leading with *Why* over an empty *What* is the failure this skill prevents.

## Purpose

Turn internal findings into audience-fit public claims that persuade without overclaiming. This is the public-translation review in the CAMP stack.

## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.

## Preamble: Find The Memo

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` in the working repo and read the most recent memo.
2. If a memo exists, translate reviews its **Public Translation Table**, **Evidence Ladder**, and **Uncertainty Register**.
3. If no memo exists, ask the user for the findings and audience. If the findings are unverified, recommend `verify` first.

## Workflow

1. **Name the audience**
   - Officials, organizers, press, the public, funders, or staff? Each needs a different claim and format.
   - If there are several, handle them separately — one message rarely fits all.

2. **Supported vs. tempting**
   - For each finding, state the claim the evidence actually supports.
   - Name the tempting, more persuasive claim the evidence does not support. Flag it explicitly.

3. **Uncertainty without weakness**
   - Rewrite hedged findings into wording that is honest about confidence and still lands. "The evidence points to X" is stronger and truer than either "X is proven" or a wall of caveats.

4. **Make the system legible**
   - Find the story or frame that makes the system behavior understandable to a non-expert. Abstract mechanisms (veto points, capture, hollow compliance) need a concrete, human handle.

5. **Mutuality frame**
   - Connect the *What* to a shared-stakes *Why* without overclaiming the *What*. The motivation can be aspirational; the factual claim cannot.

## Required Output

Write a public-translation review. If a memo exists, append it as a section and update the memo's Public Translation Table; otherwise save it to `memos/` as a standalone review.

Include:

- **Revised translation table**: internal finding, public claim, evidence, audience, overclaim risk, safer wording.
- **Audience-specific variants**: the core message rewritten for each target audience.
- **Overclaim notes**: the tempting claims that were cut or softened, and why.
- **Public one-pager**: when warranted, a shareable summary that holds to the evidence.

| Internal finding | Public claim | Evidence | Audience | Overclaim risk | Safer wording |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Routing

Route to the one skill that addresses what translate exposed. See `docs/routing-map.md`.

| If translate exposed… | Recommend |
| --- | --- |
| Claims that need stronger evidence before they go public | `verify` |
| A message that is ready and needs a circulation plan and first test | `build` |
| A frame that depends on long-run effects you have not stress-tested | `foresight` |
| Public claims about delivery that the implementation cannot back up | `recode` |

## Completion Standard

A useful run ends with:

- Each public claim traced to an internal finding and its evidence.
- The tempting, unsupported claims named and cut or softened.
- Audience-specific wording that preserves uncertainty without sounding weak.
- A legible story for the system behavior at the center of the memo.
