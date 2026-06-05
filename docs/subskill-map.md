# Abundance Subskill Map

This maps the broader GStack skill ecosystem to the proposed CAMP skill family.

The front-door skill is mostly resolved:

- GStack `office-hours` -> Abundance `abundance-diagnosis`
- GStack `design doc` -> Abundance `Abundance Systems Memo`

The follow-on subskills below are first-pass definitions. They need deeper logic design before implementation.

For the full local GStack skill inventory and category map, see `gstack-ecosystem-map.md`.

For the complete per-skill remapping matrix, see `complete-remapping-matrix.md`.

Adaptation principle: preserve GStack's logic wherever possible. The main change is not the workflow shape; it is the end goal. The Abundance stack should produce civic action plans and implementation feedback instead of commercial products and software deployment outcomes.

## Skill Family Overview

```text
abundance-diagnosis
  -> Abundance Systems Memo
  -> strategic-foresight-review
  -> implementation-mechanics-review
  -> public-translation-review
  -> evidence-review
  -> feedback-loop-check
  -> publish-circulate-test
  -> pattern-library-entry
```

## Front Door

### `abundance-diagnosis`

GStack equivalent: `office-hours`

Purpose:

Turn a concrete public problem or policy idea into an Abundance Systems Memo.

Reads:

- User-provided problem or policy idea
- Knowledge library
- Prior memos
- Live diagnostic material, if running pass two

Outputs:

- Abundance Systems Memo
- Weighted causal model
- Evidence ladder
- Intervention portfolio
- Public translation table
- Follow-on workflow recommendations

Status:

- Mostly resolved.

## Follow-On Review Skills

### `strategic-foresight-review`

GStack rough equivalent: `plan-ceo-review`

Purpose:

Stress-test the memo at the highest strategic level. Ask whether the diagnosis is ambitious enough, whether it understands second-order effects, and whether the intervention portfolio is pointed at the right system behavior.

Reads:

- Abundance Systems Memo
- Weighted causal model
- Strategic foresight section
- Intervention portfolio

Key questions:

- What happens if this works?
- What happens if it half-works?
- What actor adapts against it?
- What equilibrium does this disturb?
- What is the 6-month, 2-year, and 10-year reaction?
- Are we solving a symptom because the root cause is politically uncomfortable?

Outputs:

- Revised strategic foresight section
- Second-order effects register
- Stronger structural bet
- Risks that should alter the action plan

Status:

- Sketched, not resolved.

### `implementation-mechanics-review`

GStack rough equivalent: `plan-eng-review`

Purpose:

Test whether the memo can survive contact with actual institutions, process, procurement, staffing, budgets, authority, legal constraints, and operations.

Reads:

- Abundance Systems Memo
- System map
- Evidence ladder
- Near-term lever
- Learning experiment

Key questions:

- Who has authority to do each step?
- Who owns implementation end to end?
- What procurement, staffing, budget, legal, or IT constraints matter?
- What breaks between policy passage and lived reality?
- What does the implementer need on Monday morning?
- What feedback reaches decision-makers quickly enough to matter?

Outputs:

- Implementation mechanics review
- Owner/action matrix
- Operational blocker list
- Revised near-term lever
- Concrete evidence requests for pass two

Status:

- Sketched, not resolved.

### `public-translation-review`

GStack rough equivalent: `plan-design-review`

Purpose:

Turn internal findings into public claims without overclaiming. Review the public translation table for audience fit, clarity, persuasion, and evidence discipline.

Reads:

- Internal diagnosis
- Public translation table
- Evidence ladder
- Uncertainty register

Key questions:

- Which audience is this for: officials, organizers, press, public, funders, staff?
- What claim is supported by the evidence?
- What claim is tempting but unsupported?
- What wording preserves uncertainty without sounding weak?
- What story makes the system behavior legible?

Outputs:

- Revised public translation table
- Audience-specific message variants
- Overclaim risk notes
- Recommended public one-pager, if appropriate

Status:

- Sketched, not resolved.

### `evidence-review`

GStack rough equivalent: `review`

Purpose:

Audit whether the memo's causal weights, public claims, and recommended actions are actually supported by evidence.

Reads:

- Abundance Systems Memo
- Evidence ladder
- Source list
- Public translation table
- Weighted causal model

Key questions:

- Which claims are supported by live diagnostic material?
- Which claims only come from a durable lens or analogy?
- Which causal weights are overconfident?
- Which sources are missing?
- What would change the recommendation?

Outputs:

- Evidence review report
- Claim support table
- Revised confidence scores
- Source gaps
- Overclaim warnings

Status:

- Sketched, not resolved.

### `feedback-loop-check`

GStack rough equivalent: `qa`

Purpose:

Check whether the action plan has real feedback loops that can detect drift, hollow progress, capture, implementation failure, or unintended consequences.

Reads:

- Intervention portfolio
- Feedback and drift watchlist
- Learning experiment
- Public translation table

Key questions:

- What observable system behavior should change?
- Who will see early signal?
- How soon should signal appear?
- What would prove this is hollow progress?
- What would trigger revision or abandonment?
- Are we measuring outputs, outcomes, or vibes?

Outputs:

- Feedback-loop check report
- Revised drift signals
- Learning experiment improvements
- Measurement plan

Status:

- Sketched, not resolved.

### `publish-circulate-test`

GStack rough equivalent: `ship`

Purpose:

Prepare the memo or public translation for circulation, identify who should see it, and define the first real-world test.

Reads:

- Approved Abundance Systems Memo
- Public translation table
- Audience map
- Action portfolio

Key questions:

- Who is the first audience?
- What do we want them to do?
- What format should they receive?
- What is the smallest real-world test?
- What follow-up creates feedback instead of performative circulation?

Outputs:

- Circulation plan
- First-contact list or audience map
- Shareable memo variant
- Test plan
- Follow-up schedule

Status:

- Sketched, not resolved.

### `pattern-library-entry`

GStack rough equivalent: learnings / context-save, but more substantive.

Purpose:

Capture reusable lessons from a memo, win, failure, mechanism, or case so other domains can learn from it.

Reads:

- Completed memo
- Evidence review
- Feedback-loop results
- Live case material

Key questions:

- What mechanism appears here that will recur elsewhere?
- What domain-specific lesson should travel across domains?
- What looks similar but is actually different?
- What evidence supports this pattern?
- What is the caution against overgeneralizing?

Outputs:

- Pattern-library entry
- Mechanism tags
- Transfer notes
- Anti-pattern notes
- Links to source memo and evidence

Status:

- Valuable, but likely separate from v1 front-door diagnosis.

## What Is Resolved

- `abundance-diagnosis` is the office-hours equivalent.
- The artifact is the Abundance Systems Memo.
- The logic starts with diagnosis, not advocacy.
- The memo uses a two-pass workflow.
- The causal model is weighted and uncertainty-aware.
- Public messaging is traceable to internal findings.

## What Still Needs Design

- Exact question flow for each follow-on subskill.
- Which subskills should exist in v1.
- Whether follow-on subskills are separate skills or modes inside one skill.
- Where artifacts are stored.
- How knowledge library entries are indexed and retrieved.
- How live diagnostic sources are cited.
- Whether public circulation should integrate with email/docs/slides later.
