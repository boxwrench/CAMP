---
name: abundance-diagnosis
description: |
  Use when the user brings a concrete public problem, institutional failure,
  abundance-policy idea, civic reform proposal, implementation bottleneck, or
  coalition action question and wants to diagnose it before advocating. Produces
  an Abundance Systems Memo with root-cause diagnosis, system map, incentive
  analysis, weighted causal model, evidence ladder, intervention portfolio,
  feedback loops, and public translation table. Use before strategic foresight,
  implementation, public messaging, evidence, or feedback-loop review.
---

# Abundance Diagnosis

## Core Rule

Do not advocate before understanding.

Treat pro-abundance instincts as hypotheses, not conclusions. Diagnose the system first, then recommend action.

## Purpose

Guide an Abundance Network colleague from a raw public problem or policy idea to an Abundance Systems Memo. Preserve the GStack operating loop: guided diagnosis, durable artifact, specialized review, real-world test, feedback, and accumulated learning. Change the destination from commercial product to civic action plan.

## Required Output

Produce an `Abundance Systems Memo`, either as a provisional pass-one hypothesis memo or an evidence-backed pass-two revision.

If the user asks to save progress, write the memo or draft into the current project/repo. If no destination exists, create `memos/` in the working repo.

## Two-Pass Mode

Use one of two modes:

- **Pass one: hypothesis memo**: no live research required; label all causal weights provisional; define what evidence must be gathered.
- **Pass two: evidence-backed revision**: use live diagnostic material to revise causal weights, failure modes, intervention choices, and public claims.

If the user has not specified the mode, default to pass one unless they ask for evidence-backed research.

## Workflow

Ask one question at a time. Continue until there is enough context to draft the memo.

1. **Intake**
   - Determine whether the input is a public problem or a policy idea.
   - Capture jurisdiction, institutional setting, affected people, current status, and the user's role.

2. **Instinct Audit**
   - Ask what the user already believes.
   - Ask why they believe it.
   - Ask what would make them change their mind.

3. **Full-Stack Diagnosis**
   - Test institutional mechanics: agencies, process, procurement, budgets, staffing, law, veto points, authority.
   - Test political economy: incentives, interest groups, concentrated benefits, diffuse costs, incumbents, fiscal pressures.
   - Test culture and ideology: proceduralism, risk aversion, scarcity assumptions, distrust of building, blame avoidance.

4. **System Map**
   - Identify actors, authority, upstream dependencies, downstream consequences, veto points, and feedback paths.

5. **Policy-As-Organism Test**
   - Predict how the policy or intervention will mutate when it enters the real institutional environment.
   - Look for capture, delay, litigation, hollow compliance, implementation drift, and symbolic wins.

6. **Weighted Causal Model**
   - For each cause, assign causal weight, tractability, time horizon, confidence, and feedback signal.
   - Distinguish high-weight hard causes from lower-weight tractable causes.

7. **Evidence Ladder**
   - Separate canonical-source reasoning from case-specific evidence.
   - Mark missing sources and uncertainty explicitly.
   - If action must proceed under uncertainty, define what to watch.

8. **Intervention Portfolio**
   - Choose one structural bet.
   - Choose one near-term lever.
   - Choose one learning experiment.
   - Define a feedback and drift watchlist.

9. **Public Translation Table**
   - Translate internal findings into public claims.
   - For every public claim, include evidence, audience, risk of overclaiming, and safer wording if confidence is low.

10. **Save And Route**
    - Save the memo when requested or when the session reaches a complete draft.
    - Recommend follow-on reviews: strategic foresight, implementation mechanics, public translation, evidence review, or feedback-loop check.

## References

Load these only when needed:

- `references/memo-template.md`: use when drafting or saving the memo.
- `references/diagnostic-lenses.md`: use when applying canonical abundance lenses.
- `references/gstack-parallels.md`: use when mapping the skill to GStack behavior or designing follow-on subskills.

## Follow-On Reviews

Recommend follow-on reviews based on the memo's weak point:

- `strategic-foresight-review`: second-order effects, long time horizons, system reaction.
- `implementation-mechanics-review`: authority, staffing, procurement, operations, legal process, budgets.
- `public-translation-review`: audience-specific claims, persuasion, overclaim risk.
- `evidence-review`: source support, confidence scores, missing evidence.
- `feedback-loop-check`: drift, hollow progress, learning experiments, observable signals.

## Completion Standard

A useful run ends with:

- A clear diagnosis before advocacy.
- A weighted causal model with confidence and uncertainty.
- An actionable intervention portfolio.
- Feedback signals that can reveal drift or hollow progress.
- A public translation table tied to evidence.
