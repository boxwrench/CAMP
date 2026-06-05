# Installation

CAMP is distributed as a portable Agent Skill folder. The current working skill is:

```text
skills/abundance-diagnosis/
```

The canonical user-facing name is:

```text
diagnose
```

Until the folder is renamed in the repo, install it by copying `skills/abundance-diagnosis` into your agent's skills directory as `diagnose`.

## Clone The Repo

```bash
git clone https://github.com/boxwrench/CAMP.git
cd CAMP
```

On Windows PowerShell:

```powershell
git clone https://github.com/boxwrench/CAMP.git
Set-Location CAMP
```

## Install For Codex

Codex personal skills live in:

```text
~/.codex/skills
```

Windows PowerShell:

```powershell
$src = ".\skills\abundance-diagnosis"
$dst = "$env:USERPROFILE\.codex\skills\diagnose"
New-Item -ItemType Directory -Force -Path (Split-Path $dst) | Out-Null
Copy-Item -Recurse -Force $src $dst
```

macOS/Linux:

```bash
mkdir -p ~/.codex/skills
cp -R skills/abundance-diagnosis ~/.codex/skills/diagnose
```

Start a new Codex thread and ask:

```text
Use diagnose on this policy issue: ...
```

## Install For Claude Code

Claude Code supports personal and project skills.

Personal install:

```text
~/.claude/skills/diagnose
```

Project install:

```text
.claude/skills/diagnose
```

Windows PowerShell, personal install:

```powershell
$src = ".\skills\abundance-diagnosis"
$dst = "$env:USERPROFILE\.claude\skills\diagnose"
New-Item -ItemType Directory -Force -Path (Split-Path $dst) | Out-Null
Copy-Item -Recurse -Force $src $dst
```

macOS/Linux, personal install:

```bash
mkdir -p ~/.claude/skills
cp -R skills/abundance-diagnosis ~/.claude/skills/diagnose
```

Project install:

```bash
mkdir -p .claude/skills
cp -R skills/abundance-diagnosis .claude/skills/diagnose
```

Invoke with:

```text
Use diagnose on this policy issue: ...
```

or, if your Claude Code setup exposes skills as slash commands:

```text
/diagnose
```

## Install For Google Antigravity

Antigravity project skills live in:

```text
.agents/skills/diagnose
```

Windows PowerShell:

```powershell
$src = ".\skills\abundance-diagnosis"
$dst = ".\.agents\skills\diagnose"
New-Item -ItemType Directory -Force -Path (Split-Path $dst) | Out-Null
Copy-Item -Recurse -Force $src $dst
```

macOS/Linux:

```bash
mkdir -p .agents/skills
cp -R skills/abundance-diagnosis .agents/skills/diagnose
```

Older Antigravity projects may also support:

```text
.agent/skills/diagnose
```

## Use With Claude Cowork

Claude Cowork can use Claude Skills, but installation usually happens through the Claude app's Skills or Cowork customization UI.

Recommended approach:

1. Package or upload the `skills/abundance-diagnosis` folder.
2. Name the skill `diagnose`.
3. Include the full `references/` folder.
4. Start a Cowork task with:

```text
Use the diagnose skill to create a pass-one Abundance Systems Memo for this issue: ...
```

## Portable Manual Use

If your agent does not support skills yet, paste the contents of:

```text
skills/abundance-diagnosis/SKILL.md
```

Then attach or paste the relevant reference files:

```text
skills/abundance-diagnosis/references/memo-template.md
skills/abundance-diagnosis/references/diagnostic-lenses.md
skills/abundance-diagnosis/references/deep-research-handoff.md
```

This works as a prompt-based fallback, but you lose auto-triggering and progressive loading.

## Smoke Test

After installing, start a fresh agent session and run:

```text
Use diagnose to create a pass-one Abundance Systems Memo for this issue:

Our city wants to speed up permitting for small infill housing projects, but approvals still take 9-18 months despite recent process reforms.
```

Expected behavior:

- The agent should diagnose before advocating.
- It should ask clarifying questions or produce a provisional pass-one memo.
- It should identify evidence gaps rather than pretending certainty.
- It should propose a deep-research handoff if the missing evidence is too deep for ordinary search.

## Updating

Pull the latest repo changes:

```bash
git pull
```

Then reinstall by copying `skills/abundance-diagnosis` over your existing `diagnose` skill folder.

## Safety

CAMP currently contains Markdown instructions and reference files only. It does not include executable scripts.

If scripts are added later, review them before installing CAMP into any agent with filesystem, browser, connector, or network access.

