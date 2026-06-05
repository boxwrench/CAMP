# CAMP

**Capacity, Abundance, Mechanisms, Policy.**

CAMP is an Abundance skill stack for diagnosing civic systems before action.

It helps advocates, organizers, staffers, policy researchers, and civic builders turn a public problem or policy instinct into a structured systems memo: what is broken, why it stays broken, who has power, what incentives matter, what evidence is missing, and what action is worth trying next.

The core rule is simple:

> Diagnose before advocating.

## Why CAMP Exists

Abundance politics often starts with a true instinct: build more housing, make government work, unblock infrastructure, restore state capacity, and make it easier for people to move toward opportunity.

But a good instinct is not yet a working intervention.

Public systems react. Agencies have incentives. Process has history. Veto points accumulate. Procurement rules shape what can be built. A reform that looks right on paper can mutate into delay, capture, hollow compliance, or symbolic progress.

CAMP is a workflow for slowing down just enough to understand the machinery before pushing on it.

## What It Produces

The primary artifact is an **Abundance Systems Memo**.

A memo includes:

- Problem frame
- Instinct audit
- Full-stack root cause diagnosis
- System map
- Incentive analysis
- Policy-as-organism test
- Weighted causal model
- Evidence ladder and uncertainty register
- Intervention portfolio
- Feedback and drift watchlist
- Public translation table

The memo is designed to support action, not analysis for its own sake.

## Core Workflow

CAMP's first skill is `diagnose`.

The canonical skill sequence is:

```text
diagnose
  -> foresight
  -> recode
  -> verify
  -> translate
  -> test
  -> learn
  -> build
```

### `diagnose`

Turn a concrete public problem or policy idea into an Abundance Systems Memo.

### `foresight`

Stress-test second-order effects, time horizons, institutional reaction, and strategic risk.

### `recode`

Review implementation mechanics: authority, procurement, staffing, budgets, operations, legal process, IT, and feedback loops.

### `verify`

Audit evidence quality, causal weights, uncertainty, public claims, and overclaim risk.

### `translate`

Turn internal findings into public claims without laundering uncertainty into slogans.

### `test`

Define observable feedback signals that reveal drift, capture, hollow progress, or real movement.

### `learn`

Capture reusable mechanisms, cases, anti-patterns, and cross-domain lessons.

### `build`

Prepare the memo or public translation for circulation, action, follow-up, and revision.

## Two-Pass Diagnosis

CAMP supports two levels of certainty.

**Pass one: hypothesis memo**

No live research is required. The memo is explicitly provisional. Causal weights are tentative, evidence gaps are named, and the goal is to form a useful starting model.

**Pass two: evidence-backed revision**

Live diagnostic material is gathered or ingested: agency documents, meeting minutes, statutes, budgets, procurement records, litigation, audits, local reporting, interviews, implementation data, and case studies.

When ordinary search is not enough, CAMP can generate a deep-research prompt for the user to run externally and bring back.

## Intellectual Lineage

CAMP draws from abundance and state-capacity thinking, including:

- Ezra Klein and Derek Thompson, *Abundance*
- Jennifer Pahlka, *Recoding America*
- Marc J. Dunkelman, *Why Nothing Works*
- Housing and land-use reform work
- Yoni Appelbaum, *Stuck*
- Paul Sabin, *Public Citizens*

These works provide durable lenses. They do not replace case-specific evidence.

## Repository Status

This repository is early.

What exists now:

- A scaffolded `diagnose` skill at [`skills/abundance-diagnosis/SKILL.md`](skills/abundance-diagnosis/SKILL.md)
- Memo template and diagnostic references
- Deep-research handoff prompt
- Knowledge-library structure
- GStack-to-CAMP remapping docs

What comes next:

- Rename or alias `skills/abundance-diagnosis` to `diagnose`
- Test the workflow on real policy issues
- Codify the follow-on skills: `foresight`, `recode`, `verify`, `translate`, `test`, `learn`, and `build`
- Add example Abundance Systems Memos
- Build the pattern library from real cases

## Project Map

- [`skills/abundance-diagnosis/SKILL.md`](skills/abundance-diagnosis/SKILL.md): first working skill scaffold
- [`skills/abundance-diagnosis/references/memo-template.md`](skills/abundance-diagnosis/references/memo-template.md): Abundance Systems Memo template
- [`skills/abundance-diagnosis/references/diagnostic-lenses.md`](skills/abundance-diagnosis/references/diagnostic-lenses.md): core diagnostic lenses
- [`skills/abundance-diagnosis/references/deep-research-handoff.md`](skills/abundance-diagnosis/references/deep-research-handoff.md): prompt pattern for external deep research
- [`docs/naming-system.md`](docs/naming-system.md): skill naming system
- [`docs/complete-remapping-matrix.md`](docs/complete-remapping-matrix.md): GStack-to-CAMP remapping
- [`knowledge/`](knowledge/): early knowledge-library structure

## Attribution

CAMP is inspired by [GStack](https://github.com/garrytan/gstack), Garry Tan's MIT-licensed agent skill workflow system.

CAMP is not official GStack and is not affiliated with or endorsed by Garry Tan or Y Combinator.

See [`NOTICE.md`](NOTICE.md) and [`LICENSE`](LICENSE).
