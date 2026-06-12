---
name: abundance-build
description: |
  Use when an approved Abundance Systems Memo or public translation is ready to
  reach people: define who should see it first, what you want them to do, what
  format they need, and the smallest real-world test. Produces a circulation plan,
  a first-contact audience map, a shareable memo variant, a test plan, and a
  follow-up schedule built to create feedback rather than performative circulation.
  Runs on a memo in memos/ or standalone on an approved message.
---

# Abundance Build

## Core Rule

Circulation is not the goal; feedback is. Define the first audience, the smallest real test, and the follow-up that turns contact into learning — not applause.

## Spine

In the **What / How / Why** spine (see `knowledge/lenses.md`), build mobilizes the *Why* into action — but through the "power behind the curtain" lens (see `knowledge/lenses.md`): the first audience that matters is whoever actually holds the relevant lever, not whoever is easiest to reach. The job is to move a concrete *What* toward a real-world test by the people who can act on it.

## Purpose

Prepare the memo or public translation for circulation, identify who should see it, and define the first real-world test. This is the ship-equivalent in the CAMP stack: the point is to make the system produce the desired public outcome.

## Preamble: Find The Memo

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` in the working repo and read the most recent **approved** memo.
2. If the memo is not yet approved, evidenced, or translated, say so and recommend `verify` or `translate` first — circulating an unverified memo is the failure this skill guards against.
3. If no memo exists, ask the user for the approved message to circulate.

## Workflow

1. **First audience**
   - Who is the first audience, and do they hold a lever? Officials, organizers, a specific staffer, a funder, a reporter, an affected community?
   - Prefer the person who can act over the person who is easy to reach.

2. **The ask**
   - What, exactly, do you want them to do? A circulation with no specific ask produces no feedback.

3. **Format**
   - What format does this audience actually consume — a one-pager, a briefing, a public post, a meeting, a draft bill? Match the format to how this audience makes decisions.

4. **Smallest real test**
   - What is the smallest real-world test that would tell you whether this works? A pilot, a single hearing, one official's response, a narrow policy ask.

5. **Feedback-creating follow-up**
   - What follow-up turns contact into feedback instead of performative circulation? Schedule it. Define what response would confirm, complicate, or kill the bet.

## Required Output

Write a circulation plan. If a memo exists, append it as a section; otherwise save it to `memos/` as a standalone plan.

Include:

- **First-contact audience map**: audience, lever they hold, the specific ask, the format.
- **Shareable memo variant**: the version of the memo or message this audience should receive.
- **Test plan**: the smallest real-world test and what its result would mean.
- **Follow-up schedule**: when to follow up, with whom, and what feedback to capture.

| Audience | Lever | The ask | Format |
| --- | --- | --- | --- |
|  |  |  |  |

## Routing

Route based on what circulation produced or requires. See `docs/routing-map.md`.

| If build produced or requires… | Recommend |
| --- | --- |
| A live intervention that needs instrumented feedback loops | `test` |
| A real-world result worth capturing for reuse | `learn` |
| A claim that needs firmer evidence before a wider audience | `verify` |
| A response that invalidates the original diagnosis | back to `diagnose` |

## Completion Standard

A useful run ends with:

- A first audience chosen for the lever they hold, not their reachability.
- A specific ask, in the format that audience actually uses.
- The smallest real-world test defined, with what its result would mean.
- A scheduled follow-up built to capture feedback, not applause.
