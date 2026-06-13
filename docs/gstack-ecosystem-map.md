# GStack Ecosystem Map For CAMP

This repo initially mapped the office-hours path:

```text
office-hours -> design doc -> plan reviews -> ship / QA / review
```

That is only part of GStack. The local installation includes a broader skill ecosystem. CAMP should not copy every skill one-for-one, but it should understand the full pattern.

For a per-skill disposition covering every installed GStack skill, see `complete-remapping-matrix.md`.

## Installed GStack Skill Inventory

Local skill folders observed on 2026-06-04:

- `gstack`
- `gstack-autoplan`
- `gstack-benchmark`
- `gstack-benchmark-models`
- `gstack-browse`
- `gstack-canary`
- `gstack-careful`
- `gstack-claude`
- `gstack-context-restore`
- `gstack-context-save`
- `gstack-cso`
- `gstack-design-consultation`
- `gstack-design-html`
- `gstack-design-review`
- `gstack-design-shotgun`
- `gstack-devex-review`
- `gstack-document-generate`
- `gstack-document-release`
- `gstack-freeze`
- `gstack-guard`
- `gstack-health`
- `gstack-investigate`
- `gstack-ios-clean`
- `gstack-ios-design-review`
- `gstack-ios-fix`
- `gstack-ios-qa`
- `gstack-ios-sync`
- `gstack-land-and-deploy`
- `gstack-landing-report`
- `gstack-learn`
- `gstack-make-pdf`
- `gstack-office-hours`
- `gstack-open-gstack-browser`
- `gstack-pair-agent`
- `gstack-plan-ceo-review`
- `gstack-plan-design-review`
- `gstack-plan-devex-review`
- `gstack-plan-eng-review`
- `gstack-plan-tune`
- `gstack-qa`
- `gstack-qa-only`
- `gstack-retro`
- `gstack-review`
- `gstack-scrape`
- `gstack-setup-browser-cookies`
- `gstack-setup-deploy`
- `gstack-setup-gbrain`
- `gstack-ship`
- `gstack-skillify`
- `gstack-spec`
- `gstack-sync-gbrain`
- `gstack-unfreeze`
- `gstack-upgrade`

## Category Map

### Front Door And Planning

GStack:

- `gstack-office-hours`
- `gstack-spec`
- `gstack-autoplan`
- `gstack-plan-ceo-review`
- `gstack-plan-eng-review`
- `gstack-plan-design-review`
- `gstack-plan-devex-review`
- `gstack-plan-tune`

Abundance equivalents:

- `diagnose`
- `abundance-spec` or `abundance-brief`
- `abundance-autoplan`
- `foresight`
- `recode`
- `translate`
- `coalition-experience-review`
- `diagnostic-tune`

Notes:

This is the most important area to customize. It is where the civic logic, evidence standards, and diagnostic flow live.

### Investigation And Review

GStack:

- `gstack-investigate`
- `gstack-review`
- `gstack-cso`
- `gstack-health`
- `gstack-qa`
- `gstack-qa-only`
- `gstack-devex-review`

Abundance equivalents:

- `systems-investigate`
- `verify`
- `institutional-risk-review`
- `memo-health`
- `test`
- `feedback-loop-report`
- `coalition-experience-review`

Notes:

These should be customized where the review target changes from code/product behavior to public-system behavior: causal claims, evidence, incentives, institutional risks, implementation drift, and hollow progress.

### Design And Communication

GStack:

- `gstack-design-consultation`
- `gstack-design-shotgun`
- `gstack-design-review`
- `gstack-design-html`
- `gstack-make-pdf`
- `gstack-document-generate`
- `gstack-document-release`

Abundance equivalents:

- `public-message-consultation`
- `message-variants`
- `translate`
- `memo-html`
- `memo-pdf`
- `brief-generate`
- `brief-release`

Notes:

Some of this may be generic tooling. The custom logic is the translation discipline: internal finding -> public claim -> evidence -> overclaim risk -> safer wording.

### Shipping, Deployment, And Circulation

GStack:

- `gstack-ship`
- `gstack-land-and-deploy`
- `gstack-setup-deploy`
- `gstack-landing-report`
- `gstack-canary`
- `gstack-benchmark`
- `gstack-benchmark-models`

Abundance equivalents:

- `build`
- `circulate-and-follow-up`
- `setup-circulation`
- `circulation-report`
- `post-circulation-canary`
- `policy-feedback-benchmark`
- `diagnosis-benchmark`

Notes:

This layer is not deployment to production. It is circulation into the world: who receives the memo, what action is requested, what follow-up happens, and what signal comes back.

### Knowledge, Memory, And Context

GStack:

- `gstack-learn`
- `gstack-context-save`
- `gstack-context-restore`
- `gstack-retro`
- `gstack-setup-gbrain`
- `gstack-sync-gbrain`

Abundance equivalents:

- `learn`
- `memo-context-save`
- `memo-context-restore`
- `coalition-retro`
- `setup-abundance-brain`
- `sync-abundance-brain`

Notes:

This is central to the Abundance Network version. The system should accumulate mechanisms, cases, source notes, and cross-domain lessons without confusing durable lenses with live diagnosis.

### Browser, Scraping, And External Evidence

GStack:

- `gstack-browse`
- `gstack-open-gstack-browser`
- `gstack-scrape`
- `gstack-skillify`
- `gstack-setup-browser-cookies`

Abundance equivalents:

- `source-browse`
- `open-source-browser`
- `source-scrape`
- `codify-source-flow`
- `setup-source-access`

Notes:

These may mostly be reused as infrastructure. The custom layer is evidence provenance: what was searched, what was read, what claim it supports, and what uncertainty remains.

### Safety, Guardrails, And Workflow Control

GStack:

- `gstack-careful`
- `gstack-freeze`
- `gstack-unfreeze`
- `gstack-guard`
- `gstack-upgrade`

Abundance equivalents:

- likely reuse generic gstack behavior
- maybe add `overclaim-guard`

Notes:

The Abundance-specific safety risk is less about deleting files and more about publishing unsupported claims, misrepresenting evidence, or producing advocacy before diagnosis.

### Agent Coordination

GStack:

- `gstack-claude`
- `gstack-pair-agent`

Abundance equivalents:

- `outside-review-agent`
- `coalition-pair-agent`

Notes:

Could be useful later for red-team review: one agent defends the policy, another attacks implementation assumptions, another audits evidence.

### iOS-Specific Tooling

GStack:

- `gstack-ios-clean`
- `gstack-ios-design-review`
- `gstack-ios-fix`
- `gstack-ios-qa`
- `gstack-ios-sync`

Abundance equivalents:

- none by default

Notes:

Probably not relevant unless the Abundance project later includes a mobile app.

## Which Skills Need Real Abundance Logic?

High priority:

- `diagnose`
- `foresight`
- `recode`
- `translate`
- `verify`
- `test`
- `learn`

Medium priority:

- `systems-investigate`
- `build`
- `coalition-retro`
- `message-variants`
- `memo-pdf`
- `source-scrape`

Likely reuse as infrastructure:

- browser tools
- guard/freeze/careful tooling
- context save/restore primitives
- PDF/document generation primitives
- agent-pairing primitives

Probably out of scope for now:

- iOS tooling
- deployment setup
- software performance benchmarking
- model benchmarking

## Design Implication

The Abundance Network stack should be a civic-analysis skill family, not a complete clone of GStack.

GStack provides the operating pattern:

```text
front-door diagnostic
  -> durable artifact
  -> specialized reviews
  -> real-world release/test
  -> feedback and learning
  -> accumulated memory
```

The Abundance version should preserve that operating pattern while replacing the product/software substrate with public systems, institutions, evidence, implementation, coalition action, and feedback loops.

## Adaptation Principle

Make fewer changes than the naming map might imply.

The concept is largely the same:

```text
unclear idea
  -> guided diagnosis
  -> durable artifact
  -> specialized reviews
  -> real-world test
  -> feedback
  -> accumulated learning
```

The key difference is the end goal.

GStack usually aims toward a commercial product, software artifact, or deployable change. The Abundance Network stack aims toward an evidence-aware civic action plan: something people can understand, promote, implement, test, and revise.

Default rule: preserve GStack's logic unless the civic context specifically changes the success condition, evidence standard, artifact, or feedback loop.
