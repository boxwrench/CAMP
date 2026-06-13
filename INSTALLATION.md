# Installation

CAMP is a stack of nine Agent Skills plus shared docs. Install the whole stack as one unit.

## Clone

```bash
git clone https://github.com/boxwrench/CAMP.git
cd CAMP
```

## Claude Code / Cowork (recommended: plugin)

CAMP ships as a Claude Code plugin (`.claude-plugin/plugin.json`). Load the whole stack in one step:

```bash
claude --plugin-dir ./CAMP
```

Inside the session, run `/reload-plugins` if needed. The skills appear namespaced:

```text
/camp:start      front door — routes you to the right skill
/camp:diagnose   /camp:foresight  /camp:recode   /camp:verify
/camp:translate  /camp:test       /camp:learn    /camp:build
```

To auto-load every session, place the plugin under `~/.claude/skills/camp/` (it carries its own manifest and loads as `camp@skills-dir`).

Start with:

```text
/camp:start
```

## Codex, Antigravity, and other hosts (manual tree copy)

These hosts read each skill as a folder but do not understand plugins. Copy the whole repo tree so `skills/`, `docs/`, and `knowledge/` keep their relationship, and point the host's skills directory at `skills/`. The skills carry inline summaries, so they work even where the shared docs are not auto-loaded. Skill names are plain (`diagnose`, `verify`, …) in this mode.

## Smoke test

In a fresh session:

```text
/camp:start

Our city wants to speed up permitting for small infill housing, but approvals still take 9-18 months despite recent reforms.
```

Expected: the front door shows the CAMP banner and routes you to `diagnose`, which diagnoses before advocating, names evidence gaps, and offers a deep-research handoff when the gaps are deep.

## Safety

The installed skills are Markdown instructions and reference files only — no executable scripts. The repo also contains `scripts/verify-camp.sh`, a dev/CI verification tool that is never installed into an agent. If executable skills are added later, review them before installing into an agent with filesystem or network access.
