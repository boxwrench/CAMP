# Routing Map

CAMP is a stack of independent skills that complement each other. Each skill can be the entry point for the task at hand, and each one recommends the next based on what it found. This file is the canonical cross-recommendation map. Individual skills embed a short version of it; keep them in sync with this file.

## Shared Artifact

The shared state across skills is the **Abundance Systems Memo**, saved to `memos/` in the working repo. Every skill's first move is the same: find the latest memo and read it; if none exists, run standalone on user-provided material or recommend `diagnose` first.

This is what makes the skills independent but still guided — you can grab any skill, and it reconstructs context from the memo instead of requiring a fixed sequence.

## Skills

| Skill | Role | Reads | Produces |
| --- | --- | --- | --- |
| `camp` | Router / front door — triages any situation to the right skill | User's situation, latest memo, loop state | A routed skill invocation |
| `diagnose` | Front-door systems diagnosis | Problem or policy idea, knowledge library, prior memos | Abundance Systems Memo |
| `foresight` | Strategic foresight review | Memo, weighted causal model, intervention portfolio | Second-order effects register, stronger structural bet |
| `recode` | Implementation mechanics review | Memo, system map, near-term lever | Owner/action matrix, operational blocker list |
| `verify` | Evidence review | Memo, evidence ladder, causal model, public claims | Claim-support table, revised confidence, source gaps |
| `translate` | Public translation review | Memo, public translation table, uncertainty register | Audience-specific message variants, overclaim notes |
| `test` | Feedback-loop check | Intervention portfolio, drift watchlist | Measurement plan, revised drift signals |
| `learn` | Pattern-library entry | Completed memo, evidence and feedback results | Cross-domain mechanism entry, transfer notes |
| `build` | Circulation and first real-world test | Approved memo, public translation, audience map | Circulation plan, test plan, follow-up schedule |

## Route On The Weakest Section

Any skill that ends with a drafted or revised memo routes to the **one** skill that addresses the memo's weakest section. Route to one, not a menu.

| If the weak point is… | Recommend |
| --- | --- |
| Thin on second-order effects, time horizons, or system reaction | `foresight` |
| Hand-wavy on authority, procurement, staffing, budgets, or who-does-what Monday morning | `recode` |
| Causal weights asserted without sources, or confidence that outruns evidence | `verify` |
| Public claims that risk overclaiming or need audience-specific framing | `translate` |
| No observable signal that would reveal drift, capture, or hollow progress | `test` |
| A reusable mechanism or case worth capturing across domains | `learn` |
| Approved and ready to reach people for a first real-world test | `build` |

## Proactive Routing During A Session

If a session repeatedly circles one domain before its primary artifact is done, the running skill may suggest the matching skill **once**, then return to its own work. Do not repeat the suggestion or stack multiple suggestions. The goal is a guided handoff, not a nag.

## Build Status

All live: `camp` (router), `diagnose`, `foresight`, `recode`, `verify`, `translate`, `test`, `learn`, `build`.

The follow-on skills are scaffolded with full workflows and routing; they have not yet been exercised on real policy issues. Treat them as built but unproven until tested in the field.
