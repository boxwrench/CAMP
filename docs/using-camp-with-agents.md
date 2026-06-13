# Using CAMP With Agent Tools

CAMP is a nine-skill stack in the portable `SKILL.md` format, plus shared docs under `docs/` and `knowledge/`. Install the whole stack together.

## Claude Code / Cowork

CAMP is a Claude Code plugin. Load it with `claude --plugin-dir ./CAMP`, or place it under `~/.claude/skills/camp/` to auto-load. Skills are namespaced: `/camp:start`, `/camp:diagnose`, `/camp:verify`, and so on. Cowork installs skills through the Claude app's Skills UI; upload the repo and keep the folder structure.

## Codex and Antigravity

These hosts read skills as folders but do not support plugins. Copy the whole repo tree so `skills/`, `docs/`, and `knowledge/` stay together, and point the host's skills directory at `skills/`. Skill names are plain (`diagnose`, `verify`, …).

- Codex: personal skills under `~/.codex/skills`.
- Antigravity: project skills under `.agents/skills` (older projects: `.agent/skills`).

## Portable fallback

If a host does not support skills, paste a skill's `SKILL.md` and attach the reference files it names. You lose auto-triggering and progressive loading, but the workflow still runs.

## Safety

Installed skills contain only Markdown instructions and references. The repo's `scripts/verify-camp.sh` is dev/CI tooling, never installed into an agent.
