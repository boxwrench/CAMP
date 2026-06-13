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

In the **What / How / Why** spine (see `knowledge/lenses.md`), this rule is the discipline of nailing the *What* (a concrete, observable goal) and stress-testing the *How* (the institutional machinery, where ideas die) before mobilizing the *Why*. Movements fail by reasoning backwards.

## Purpose

Guide an Abundance Network colleague from a raw public problem or policy idea to an Abundance Systems Memo. Preserve the GStack operating loop: guided diagnosis, durable artifact, specialized review, real-world test, feedback, and accumulated learning. Change the destination from commercial product to civic action plan.

## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.

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
   - Place the instinct on the **What / How / Why** spine (see `knowledge/lenses.md`). Is it a concrete goal (*What*), a method (*How*), or a motivation (*Why*)? Make sure the *What* is a specific, observable outcome before debating the *Why*. The classic failure is leading with moral *Why* while the *What* is a slogan and the *How* is missing — name it when you see it.

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
   - If the missing evidence requires deeper research than normal browsing, offer a deep-research handoff prompt the user can run externally and bring back.

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
    - Identify the memo's single weakest section, then recommend the one follow-on skill that addresses it (see Routing). Do not list all of them; route to the strongest next move.

## References

Load these only when needed:

- `references/memo-template.md`: use when drafting or saving the memo.
- `references/diagnostic-lenses.md`: use when applying canonical abundance lenses.
- `references/deep-research-handoff.md`: use when the memo needs a stronger external research pass.
- `references/gstack-parallels.md`: use when mapping the skill to GStack behavior or designing follow-on subskills.

## Routing

CAMP is a stack of independent skills that complement each other. `diagnose` is the front door, but any skill can be the entry point and each one hands off to the next. The memo saved in `memos/` is the shared artifact; downstream skills read it. See `docs/routing-map.md` for the full map.

### Route on the weakest section

When the memo is drafted, find its single weakest section and recommend the matching skill. Route to one, not a menu.

| If the memo's weak point is… | Recommend |
| --- | --- |
| Thin on second-order effects, time horizons, or system reaction | `foresight` |
| Hand-wavy on authority, procurement, staffing, budgets, or who-does-what Monday morning | `recode` |
| Causal weights asserted without sources, or confidence that outruns evidence | `verify` |
| Public claims that risk overclaiming or need audience-specific framing | `translate` |
| No observable signal that would reveal drift, capture, or hollow progress | `test` |
| A reusable mechanism or case worth capturing across domains | `learn` |
| Approved and ready to reach people for a first real-world test | `build` |

If the user wants a stronger evidence base before any of these, route to `verify` or offer the deep-research handoff.

### Proactive routing during the session

If the conversation repeatedly circles one domain before the memo is done — for example, the user keeps surfacing procurement and staffing detail — you may suggest the matching skill **once**: "This is becoming a `recode` question — want to finish the memo first, or jump there now?" Then return to diagnosis. Do not repeat the suggestion, and do not stack multiple suggestions in one session. The goal is a guided handoff, not a nag.

## Completion Standard

A useful run ends with:

- A clear diagnosis before advocacy.
- A weighted causal model with confidence and uncertainty.
- An actionable intervention portfolio.
- Feedback signals that can reveal drift or hollow progress.
- A public translation table tied to evidence.
- A deep-research handoff prompt when the evidence gaps exceed what a quick search can responsibly cover.
