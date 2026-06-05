# Complete GStack To Abundance Remapping Matrix

This is the working disposition for every locally installed GStack skill observed on 2026-06-04.

The goal is conservative adaptation. Preserve GStack's operating loop unless the civic context changes the artifact, success condition, evidence standard, or feedback loop.

## Disposition Labels

- **Custom v1**: needs Abundance-specific logic soon.
- **Custom later**: useful, but after the front-door workflow is proven.
- **Reuse infra**: keep the GStack concept/tooling mostly intact; rename only if packaged for Abundance.
- **Defer**: no decision needed yet.
- **Out of scope**: not relevant unless the project expands.

## Matrix

| GStack Skill | Abundance Name | Disposition | Remapping Notes |
| --- | --- | --- | --- |
| `gstack` | `abundance-stack-core` | Reuse infra | Core framework/preamble concepts stay. Rename only if distributing a full Abundance skill bundle. |
| `gstack-autoplan` | `abundance-autoplan` | Custom later | Could run diagnosis, foresight, implementation, evidence, and feedback checks sequentially. Too much before v1 proves itself. |
| `gstack-benchmark` | `policy-feedback-benchmark` | Defer | Software performance benchmarking becomes feedback-speed or outcome-signal benchmarking. Needs real cases first. |
| `gstack-benchmark-models` | `diagnosis-benchmark` | Defer | Could compare model quality on policy diagnosis tasks. Not needed for v1. |
| `gstack-browse` | `source-browse` | Reuse infra | Browser/search tooling should be reused for live diagnostic material and evidence capture. |
| `gstack-canary` | `post-circulation-canary` | Custom later | After circulating a memo, monitor for responses, drift, misinterpretation, or implementation signal. |
| `gstack-careful` | `careful` / `overclaim-careful` | Reuse infra | File safety is generic. Add Abundance-specific overclaim guard later. |
| `gstack-claude` | `outside-review-agent` | Reuse infra | Useful for adversarial or outside-perspective review. Prompt changes matter more than tooling changes. |
| `gstack-context-restore` | `memo-context-restore` | Reuse infra | Restore prior memos, causal models, open questions, and source trails. |
| `gstack-context-save` | `memo-context-save` | Reuse infra | Save working state, assumptions, and unresolved evidence gaps. |
| `gstack-cso` | `institutional-risk-review` | Custom later | Security review maps loosely to institutional risk: legal exposure, capture, public trust, process abuse. |
| `gstack-design-consultation` | `public-message-consultation` | Custom later | Design consultation becomes message/frame consultation for public-facing advocacy assets. |
| `gstack-design-html` | `memo-html` | Reuse infra | HTML generation can render memos or public briefs. Styling/content rules change. |
| `gstack-design-review` | `public-translation-review` | Custom v1 | Review public translation table for audience clarity, evidence discipline, and overclaim risk. |
| `gstack-design-shotgun` | `message-variants` | Custom later | Generate multiple public message variants by audience or frame. Useful after diagnosis is stable. |
| `gstack-devex-review` | `coalition-experience-review` | Custom later | Developer experience becomes coalition/user experience: can allies understand and act on the memo? |
| `gstack-document-generate` | `brief-generate` | Reuse infra | Document generation can produce memos, one-pagers, field assignments, and briefings. |
| `gstack-document-release` | `brief-release` | Custom later | Post-circulation docs update: revise public brief after feedback or evidence changes. |
| `gstack-freeze` | `freeze` | Reuse infra | Generic workspace guardrail. No civic-specific change needed. |
| `gstack-guard` | `guard` / `overclaim-guard` | Reuse infra | Keep generic safety. Add guardrails against unsupported public claims later. |
| `gstack-health` | `memo-health` | Custom later | Score memo completeness: diagnosis, evidence, uncertainty, actionability, feedback loops. |
| `gstack-investigate` | `systems-investigate` | Custom later | Debugging maps well to root-cause investigation for institutions and implementation failures. |
| `gstack-ios-clean` | none | Out of scope | Only relevant if this becomes a mobile app project. |
| `gstack-ios-design-review` | none | Out of scope | Only relevant if this becomes a mobile app project. |
| `gstack-ios-fix` | none | Out of scope | Only relevant if this becomes a mobile app project. |
| `gstack-ios-qa` | none | Out of scope | Only relevant if this becomes a mobile app project. |
| `gstack-ios-sync` | none | Out of scope | Only relevant if this becomes a mobile app project. |
| `gstack-land-and-deploy` | `circulate-and-follow-up` | Custom later | Landing/deploy maps to circulation plus follow-up, not production deploy. |
| `gstack-landing-report` | `circulation-report` | Custom later | Track what memos are circulated, to whom, status, feedback, and next action. |
| `gstack-learn` | `pattern-library-entry` | Custom v1 | Central to cross-domain learning. Capture reusable mechanisms, cases, anti-patterns, and transfer notes. |
| `gstack-make-pdf` | `memo-pdf` | Reuse infra | PDF rendering can be reused for final memos and public briefs. |
| `gstack-office-hours` | `abundance-diagnosis` | Custom v1 | Front-door guided session. Already scaffolded. |
| `gstack-open-gstack-browser` | `open-source-browser` | Reuse infra | Useful for live evidence gathering and source review. |
| `gstack-pair-agent` | `coalition-pair-agent` | Reuse infra | Useful if pairing another reviewer or domain expert agent. Not needed for v1. |
| `gstack-plan-ceo-review` | `strategic-foresight-review` | Custom v1 | Stress-test ambition, system reaction, second-order effects, and time horizons. |
| `gstack-plan-design-review` | `public-translation-review` | Custom v1 | Review public claims, audience fit, and evidence-to-message traceability. |
| `gstack-plan-devex-review` | `coalition-experience-review` | Custom later | Check whether the memo is usable by organizers, officials, staffers, and coalition partners. |
| `gstack-plan-eng-review` | `implementation-mechanics-review` | Custom v1 | Review authority, operations, procurement, staffing, budgets, constraints, and feedback paths. |
| `gstack-plan-tune` | `diagnostic-tune` | Custom later | Tune question sensitivity and default flows after real usage. |
| `gstack-qa` | `feedback-loop-check` | Custom v1 | QA maps to testing whether action has observable feedback and can detect drift. |
| `gstack-qa-only` | `feedback-loop-report` | Custom later | Report-only version of feedback-loop check. Useful after v1. |
| `gstack-retro` | `coalition-retro` | Custom later | Periodic review of memos, actions, feedback, and cross-domain learning. |
| `gstack-review` | `evidence-review` | Custom v1 | Review claims, causal weights, source support, confidence, and overclaim risk. |
| `gstack-scrape` | `source-scrape` | Reuse infra | Use for agency docs, meeting minutes, legislation, procurement, and case material. |
| `gstack-setup-browser-cookies` | `setup-source-access` | Reuse infra | Useful for accessing public portals or documents requiring browser state. |
| `gstack-setup-deploy` | `setup-circulation` | Defer | Only needed if circulation becomes systematic with external publishing channels. |
| `gstack-setup-gbrain` | `setup-abundance-brain` | Defer | Useful later for shared memory and cross-machine artifacts. Not v1. |
| `gstack-ship` | `publish-circulate-test` | Custom later | Convert approved memo into circulation plan, test, follow-up, and learning loop. |
| `gstack-skillify` | `codify-source-flow` | Reuse infra | Codify recurring source-gathering flows for specific agencies or portals. |
| `gstack-spec` | `abundance-brief` | Custom later | Could turn vague civic intent into a backlog-ready memo request or evidence plan. |
| `gstack-sync-gbrain` | `sync-abundance-brain` | Defer | Shared memory sync later. |
| `gstack-unfreeze` | `unfreeze` | Reuse infra | Generic workspace guardrail. |
| `gstack-upgrade` | `upgrade` | Reuse infra | Generic maintenance. |

## V1 Custom Skill Set

Build or specify these first:

1. `abundance-diagnosis`
2. `strategic-foresight-review`
3. `implementation-mechanics-review`
4. `public-translation-review`
5. `evidence-review`
6. `feedback-loop-check`
7. `pattern-library-entry`

## V1 Test Path

The first end-to-end policy test should exercise this path:

```text
abundance-diagnosis
  -> strategic-foresight-review
  -> implementation-mechanics-review
  -> evidence-review
  -> public-translation-review
  -> feedback-loop-check
  -> pattern-library-entry
```

Use `publish-circulate-test` only after the memo is good enough to show someone.

At the evidence-ladder stage, the process may branch to a deep-research handoff:

```text
evidence gap identified
  -> generate deep-research prompt
  -> user runs external deep research
  -> user brings result back
  -> pass-two evidence-backed revision
```

## Minimal Implementation Rule

Do not scaffold all remapped skills before testing.

For the first policy issue, use the scaffolded `abundance-diagnosis` skill and simulate the follow-on reviews from the mapping docs. Then codify only the subskills whose absence creates real friction.
