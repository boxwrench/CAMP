---
name: abundance-verify
description: |
  Use when an Abundance Systems Memo, a causal model, or a set of public claims
  needs to be checked against actual evidence: source support, confidence
  calibration, uncertainty, and overclaim risk. Separates what is known from live
  diagnostic material, what rests on a durable lens or analogy, and what is bare
  assertion. Produces a claim-support table, revised confidence scores, a
  source-gap list, and overclaim warnings, and offers a deep-research handoff when
  gaps exceed quick search. Runs on an existing memo in memos/ or on a claim list.
---

# Abundance Verify

## Core Rule

A confident number is not evidence. Separate what is known from what is asserted, and never let a weighted causal model launder a hunch into a fact.

In the **What / How / Why** spine (see `knowledge/lenses.md`), verify guards against the signature failure: leading with a moral *Why* while the *What* is a slogan and the *How* is unproven. A public claim must rest on evidence about a concrete outcome, not on the strength of the motivation behind it.

## Purpose

Audit whether a memo's causal weights, public claims, and recommended actions are actually supported. This is the evidence review in the CAMP stack. It is the guard against the central failure mode of sophisticated analysis: a memo that looks rigorous while every number inside it is a vibe.

## Interaction

Run this skill per `docs/interaction-protocol.md`. In short:

- On entry, print a one-line header (skill name + purpose) and the loop map with this skill bracketed.
- At genuine forks (mode, approach, routing), offer a menu with an open "Something else — let me explain" option when an `AskUserQuestion` variant is available; otherwise a numbered list. Always honor free-text.
- Treat deferral ("you pick", "just draft", "let it sit", silence) as a real answer: proceed, record the assumption, never re-ask. Ask at most two or three questions in a row before drafting something to react to.
- At a phase boundary, recommend the next skill with a one-line reason, then wait. Never auto-advance.

## Preamble: Find The Memo

CAMP skills share one artifact, the Abundance Systems Memo in `memos/`.

1. Look for `memos/` in the working repo and read the most recent memo.
2. If a memo exists, verify its **Weighted Causal Model**, **Evidence Ladder And Uncertainty Register**, and **Public Translation Table**.
3. If no memo exists, ask the user for the claims or causal model to check. If there is no diagnosis yet, recommend running `diagnose` first.

Check the memo's mode. A **pass-one hypothesis memo** is provisional by design — verify that it is *labeled* provisional and that its weights are not being treated as established. A **pass-two evidence-backed** memo should be held to source support.

## Workflow

Take claims one at a time.

1. **Locate the claims**
   - Pull every causal weight, confidence score, and public claim into a single list.
   - Include the recommended interventions — each one is an implicit claim that it will work.

2. **Source classification**
   - For each claim, mark its basis: live diagnostic evidence (document, data, record), durable lens or analogy (a canonical source applied by reasoning), or bare assertion.
   - Bare assertions dressed as weighted numbers are the priority finding.

3. **Confidence audit**
   - For each causal weight, ask whether the stated confidence matches the actual basis.
   - Flag every weight whose confidence outruns its evidence.

4. **Missing-source scan**
   - Name the sources that would confirm or refute each high-weight claim.
   - Mark which are gettable by ordinary search and which need a deeper pull.

5. **Overclaim check**
   - For each public claim, ask what the evidence actually supports versus what the claim says.
   - Flag any public claim that is tempting, persuasive, and unsupported. Propose safer wording that preserves uncertainty without sounding weak.

6. **Decision sensitivity**
   - Ask what evidence, if found, would change the recommended intervention.
   - A claim that cannot change the decision is lower priority; a claim that can, and is unverified, is the top risk.

7. **Deep-research handoff**
   - If the highest-value gaps need legal, budgetary, procurement, administrative, or historical detail buried in PDFs, minutes, audits, or litigation, generate a standalone deep-research prompt the user can run externally and bring back as pass-two material.
   - See `skills/abundance-diagnosis/references/deep-research-handoff.md` for the prompt pattern. Do not offer it for every memo — only when deeper evidence would materially change the diagnosis.

## Required Output

Write an evidence review. If a memo exists, append it as a section and update the memo's confidence scores and uncertainty register; otherwise save it to `memos/` as a standalone review.

Include:

- **Claim-support table**: claim, basis, current confidence, calibrated confidence, source gap.
- **Revised confidence scores**: the weighted causal model with confidence corrected to match evidence.
- **Source-gap list**: ranked by decision impact, marked as quick-search or deep-research.
- **Overclaim warnings**: public claims that outrun the evidence, with safer wording.
- **Deep-research prompt**: when warranted.

| Claim | Basis | Stated confidence | Calibrated confidence | Source gap |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

## Routing

CAMP is a stack of independent skills; verify hands off based on what the audit found. Route to one, not a menu. See `docs/routing-map.md`.

| If the audit found… | Recommend |
| --- | --- |
| Public claims that survived but need audience-specific framing | `translate` |
| Causal weights that held up and an intervention ready to move | `build` |
| Evidence that the real bottleneck is implementation, not what the memo claimed | `recode` |
| Gaps large enough that the whole diagnosis needs re-grounding | back to `diagnose` for a pass-two revision |
| Strategic assumptions, not facts, as the weak point | `foresight` |

Route to one skill, not a menu. Name the specific question the next skill would answer so the handoff is concrete.

## Completion Standard

A useful run ends with:

- Every claim classified by basis: live evidence, lens, or assertion.
- Confidence scores calibrated to actual evidence, not to how sure the author feels.
- A ranked source-gap list tied to decision impact.
- Overclaim warnings with safer wording for any public claim that outran its evidence.
- A deep-research handoff prompt when the gaps justify it.
