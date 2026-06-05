# Abundance Network GStack

Draft workspace for adapting the GStack office-hours skill into an Abundance Network diagnostic and action-planning skill.

The current direction is not a startup/product memo. The goal is an Abundance Systems Memo: a structured way for colleagues across housing, government execution, mobility, institutions, land use, procurement, and related domains to diagnose a concrete problem or policy idea before advocating for it.

This should become a separate Abundance Network skill, not a direct fork of office-hours. GStack is the template and framework: skill structure, guided questioning, artifact generation, saved outputs, and follow-on workflows.

Every inherited component should be renamed so the system speaks in the language of civic diagnosis, implementation, evidence, and feedback rather than startups and products.

The adaptation should be conservative. Most of GStack's operating loop still applies: diagnose, produce an artifact, review it, circulate or test it, gather feedback, and save learnings. The main change is the end goal: not a commercial product, but an evidence-aware civic action plan.

## Core Thesis

Advocacy before understanding is motivated reasoning. The skill should first uncover how the system actually works: incentives, institutions, upstream and downstream dependencies, veto points, procedural bottlenecks, implementation realities, and feedback loops.

Only after that diagnosis should it produce an actionable plan.

## Current V1 Scope

Use this skill when someone brings:

- A specific local, state, or federal problem they want to move.
- A policy idea they already believe may help.

Do not use this v1 for:

- General abundance topic exploration.
- Pattern-library entries from wins and failures in other domains.

Those are valuable, but probably belong in a separate stack.

## Working References

- Ezra Klein and Derek Thompson, *Abundance*
- Jennifer Pahlka, *Recoding America*
- Marc J. Dunkelman, *Why Nothing Works*
- M. Nolan Gray, *Arbitrary Lines* / housing and land-use work
- Yoni Appelbaum, *Stuck*
- Paul Sabin, *Public Citizens*

## Knowledge Library

The repo now includes a `knowledge/` folder for historical, theoretical, and domain-specific material.

Working rule: use all major abundance lenses lightly in every run, then go deep only where the diagnosis shows explanatory weight.

See also [component-naming-map.md](docs/component-naming-map.md).

## Current Skill Name

Working front-door skill name: `abundance-diagnosis`.

This is the Abundance Network equivalent of GStack office-hours: the guided session that turns an initial problem or policy idea into a structured memo.

See [logic-flow-map.md](docs/logic-flow-map.md).

The broader skill-family map is in [subskill-map.md](docs/subskill-map.md).

The expanded map of the local GStack ecosystem is in [gstack-ecosystem-map.md](docs/gstack-ecosystem-map.md).

The initial skill scaffold lives at [skills/abundance-diagnosis/SKILL.md](skills/abundance-diagnosis/SKILL.md).

The complete per-skill remapping matrix is in [complete-remapping-matrix.md](docs/complete-remapping-matrix.md).
