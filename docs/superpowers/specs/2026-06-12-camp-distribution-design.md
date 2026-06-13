# CAMP Distribution Format & Brand Banner — Design Spec

Date: 2026-06-12
Status: approved (design direction), pending implementation plan

## Problem

CAMP is now a nine-skill stack with shared docs (`docs/interaction-protocol.md`, `docs/routing-map.md`, `knowledge/lenses.md`) and cross-skill references. But:

1. The install docs (`INSTALLATION.md`, `docs/using-camp-with-agents.md`) predate the stack — they only install the single `abundance-diagnosis` folder as `diagnose`, and `using-camp-with-agents.md` hardcodes a personal OneDrive path.
2. Skills reference repo-root docs by path. When a single skill folder is copied into a host's flat skills directory, those paths don't exist around it — and even in a whole-stack copy, the agent's working directory is the user's project, not the install location, so the paths don't reliably resolve.
3. There is no brand identity in the repo or in the running skill.

The user chose **whole-stack-as-one-unit** as the primary install model (standalone single-skill is a nice-to-have), Claude Code and Cowork as first-class hosts, and wants an Abundance-Network-branded banner.

## Decision

Hybrid approach (C): graceful self-sufficiency as the correctness floor on all four hosts, a Claude Code plugin as the one-step whole-stack upgrade for the first-class hosts, rewritten install docs, plus a two-form banner.

## Brand Palette

Sampled from https://www.abundancenetwork.com/ via a live browser inspection:

- Primary purple: `#7a5cff`
- Deep indigo: `#070028`
- Cream (text): `#fff5eb`
- Gold accent: `#f8bc23`
- Light purple tints: `#9a84ff`, `#c2b5ff`

## Part 1 — Graceful Self-Sufficiency (all hosts, the floor)

Audit every reference in the nine skills and bucket each:

- **Within-folder** (`references/...`): travels inside the skill folder. Leave as-is.
- **Repo-root enrichment** (`docs/interaction-protocol.md`, `docs/routing-map.md`, `knowledge/lenses.md`): skills already carry inline summaries, so these are enrichment, not hard dependencies. Reword each pointer to degrade openly, e.g.: "Follow the CAMP interaction protocol. The full version is bundled at `docs/interaction-protocol.md` in the whole-stack install (`${CLAUDE_PLUGIN_ROOT}/docs/interaction-protocol.md` under the plugin); the essentials are inline above."
- **Cross-skill hard dependency**: `verify` reaches into `diagnose`'s `references/deep-research-handoff.md`. This is the one genuine break. Fix by giving `verify` its own copy at `skills/abundance-verify/references/deep-research-handoff.md` and pointing `verify` at its own copy.

Outcome: every skill works standalone and in a tree copy, on any host, with no broken hard references. Canonical docs stay DRY in-repo.

## Part 2 — Claude Code Plugin (Claude Code + Cowork, the upgrade)

Package the repo as a Claude Code plugin so the whole stack installs in one step.

- Add `.claude-plugin/plugin.json`: `name` = `camp`, plus `description`, `version`, `author`, `repository`, `license`.
- **Rename skill folders to canonical names** so plugin skill names are clean (plugin skill name derives from the folder name, namespaced by the plugin):
  - `skills/abundance-diagnosis` → `skills/diagnose`
  - `skills/abundance-foresight` → `skills/foresight`
  - `skills/abundance-recode` → `skills/recode`
  - `skills/abundance-verify` → `skills/verify`
  - `skills/abundance-translate` → `skills/translate`
  - `skills/abundance-test` → `skills/test`
  - `skills/abundance-learn` → `skills/learn`
  - `skills/abundance-build` → `skills/build`
  - `skills/camp` → `skills/start` (router; avoids the redundant `/camp:camp`)
  - Installed names become `/camp:diagnose`, `/camp:verify`, `/camp:start`, etc.
- Update each renamed skill's frontmatter `name:` field to its canonical name (`abundance-diagnosis` → `diagnose`, `camp` router → `start`, etc.) so plain (non-plugin) installs also get clean names.
- Update every internal reference that points at the old folder paths (notably `skills/abundance-*/...` and `verify`'s deep-research pointer, plus `routing-map.md`, `README.md`, and the install docs).
- `skills/`, `docs/`, and `knowledge/` all live at the plugin root (already true). The docs ride along as bundled data the skills point to.
- Anchor shared-doc references to `${CLAUDE_PLUGIN_ROOT}/docs/...` so they resolve regardless of the agent's working directory.
- **De-risk step:** validate the exact `${CLAUDE_PLUGIN_ROOT}` reference form that a `SKILL.md` can use to load a bundled doc, with a local `claude --plugin-dir ./CAMP` test, before committing to the path form. The Part 1 graceful wording guarantees correctness even if this resolves imperfectly.
- Distribution options, by effort: local `claude --plugin-dir ./CAMP` (or a `.zip`) → skills-directory auto-load (`~/.claude/skills/camp/` with the manifest) → marketplace submission (later, out of scope).

## Part 3 — Startup Banner (in-skill, monochrome ASCII)

A skill emits only text/markdown; it cannot set terminal colors or push raw ANSI. So the in-skill banner is monochrome ASCII.

- Add a "Startup Banner" section to `docs/interaction-protocol.md` containing this exact literal (ANSI Shadow font, width 35), followed by the acronym subtitle. No "diagnose before advocating" tagline.

```
 ██████╗ █████╗ ███╗   ███╗██████╗
██╔════╝██╔══██╗████╗ ████║██╔══██╗
██║     ███████║██╔████╔██║██████╔╝
██║     ██╔══██║██║╚██╔╝██║██╔═══╝
╚██████╗██║  ██║██║ ╚═╝ ██║██║
 ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝
   Capacity · Abundance · Mechanisms · Policy
```

- The `start` router (and only the router) prints this banner verbatim on entry, before the loop map. Worker skills do not print it — they keep the one-line header plus loop map, to avoid clutter.
- The banner is a fixed literal reproduced verbatim, not generated at runtime. No runtime dependency on `figlet`, `tui-banner`, or any binary; this preserves the "markdown only, no executable scripts" safety stance.

## Part 4 — README Hero Banner (white-on-purple SVG)

The brand color lives where it can actually render: the README on GitHub.

- Create `assets/camp-banner.svg`: a CAMP wordmark in cream (`#fff5eb`) on a purple (`#7a5cff`) field, with a gold (`#f8bc23`) accent rule and the subtitle "Capacity · Abundance · Mechanisms · Policy". Optionally a subtle purple-to-indigo (`#7a5cff` → `#070028`) gradient for depth.
- Embed it at the top of `README.md` as a Markdown image: `![CAMP](assets/camp-banner.svg)`.
- SVG so it scales crisply and renders in full color on the repo page.

## Part 5 — Rewrite Install Docs

Rewrite `INSTALLATION.md` and `docs/using-camp-with-agents.md` to:

- Cover the full nine-skill stack, not just `diagnose`.
- Document two install paths:
  - **Plugin** (Claude Code / Cowork): one-step whole-stack install; namespaced skill names (`/camp:diagnose`, `/camp:start`, ...).
  - **Manual tree copy** (all hosts): copy the whole repo so `skills/`, `docs/`, and `knowledge/` keep their relationship; plain skill names.
- Remove the hardcoded personal OneDrive paths from `using-camp-with-agents.md`.
- Update the smoke test to invoke a current skill name.

## Part 6 — Verification

Because the renames touch many files, verification is a first-class deliverable, not a manual afterthought.

Add a committed **dev-only** verification script, `scripts/verify-camp.sh` (Bash). It is repo tooling for authors and CI; it is never installed into an agent and is not part of any skill, so the "skills ship no executable scripts" stance holds. It checks:

1. **Reference resolution.** For every `SKILL.md` and every file under `docs/` and `knowledge/`, extract referenced repo paths (backtick paths and Markdown links that start with `skills/`, `docs/`, `knowledge/`, `references/`, `assets/`, or `${CLAUDE_PLUGIN_ROOT}/`) and assert each resolves on disk. Resolution rules:
   - `docs/...`, `knowledge/...`, `skills/...`, `assets/...` → relative to repo root.
   - `references/...` → relative to the containing skill's folder.
   - `${CLAUDE_PLUGIN_ROOT}/...` → map the prefix to repo root, then resolve.
2. **No stale slugs.** Grep the whole repo (excluding `docs/superpowers/` history and `.git/`) for the old folder slugs — `abundance-diagnosis`, `abundance-foresight`, `abundance-recode`, `abundance-verify`, `abundance-translate`, `abundance-test`, `abundance-learn`, `abundance-build`, and the path `skills/camp` — and assert zero matches.
3. **Frontmatter/folder match.** For each `skills/<dir>/SKILL.md`, assert the YAML `name:` equals `<dir>`.
4. **Skill count.** Assert exactly nine skill folders, each with a `SKILL.md`.
5. **Plugin validation (best-effort).** If the `claude` CLI is on PATH, run `claude plugin validate` and a `claude --plugin-dir . --help`-style load check; report but do not hard-fail if the CLI is absent.

The script exits non-zero on any failure and prints the offending file/line, so it is usable as a pre-commit or CI gate.

The implementation plan ends by running `scripts/verify-camp.sh` and requiring clean output, then a manual smoke test: load the plugin, confirm `/camp:start` prints the banner and loop map, and run one skill end to end.

- No runtime terminal color — explained as a hard limitation; brand color lives in the README and any future standalone UI (Path B).
- No marketplace submission now (documented as a later option).
- No runtime banner generator (`tui-banner` or `figlet`); the banner ships as static text.
- No build/codegen step beyond authoring; the installable surface stays markdown + one JSON manifest + one SVG. The repo also carries `scripts/verify-camp.sh`, but it is dev/CI-only and is never installed into an agent.

## Success Criteria

- A whole-stack plugin install exposes `/camp:diagnose` ... `/camp:build` and `/camp:start`, and the shared-doc references resolve.
- `/camp:start` prints the ANSI Shadow CAMP banner and the loop map on entry.
- Copying any single skill folder into a flat skills directory leaves no broken hard references.
- The README shows the white-on-purple CAMP banner on GitHub.
- No install doc references a personal machine path or a skill that no longer exists.
- `scripts/verify-camp.sh` exits clean: all references resolve, no stale folder slugs remain, every frontmatter `name:` matches its folder, and nine skills are present.

## Risks

- The exact `${CLAUDE_PLUGIN_ROOT}` form usable inside `SKILL.md` is unverified; mitigated by the Part 1 graceful wording and the `--plugin-dir` validation step.
- Folder renames have a blast radius: references to `skills/abundance-*` appear across `routing-map.md`, `README.md`, and the install docs. The plan must update every one; a final grep for `abundance-` guards against stragglers.
