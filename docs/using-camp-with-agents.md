# Using CAMP With Agent Tools

CAMP is written in the portable `SKILL.md` skill format. The same core folder can be used across agent tools that support Agent Skills, but each tool expects skills in a different place.

Current source skill:

```text
skills/abundance-diagnosis/
  SKILL.md
  agents/openai.yaml
  references/
```

Canonical CAMP name:

```text
diagnose
```

Until the folder is renamed, install it by copying `skills/abundance-diagnosis` into the target tool's skill folder as `diagnose`.

## Codex

On this machine, Codex skills live under:

```text
C:\Users\wests\.codex\skills
```

Recommended install:

```powershell
$src = "C:\Users\wests\OneDrive\Desktop\abundance-network-gstack\skills\abundance-diagnosis"
$dst = "C:\Users\wests\.codex\skills\diagnose"
Copy-Item -Recurse -Force $src $dst
```

Then start a new Codex thread and ask:

```text
Use diagnose on this policy issue: ...
```

Codex may also auto-trigger the skill when the task matches the `description` in `SKILL.md`.

## Claude Code

Claude Code supports personal and project skills.

Personal install:

```text
~/.claude/skills/diagnose/SKILL.md
```

Windows equivalent:

```text
C:\Users\wests\.claude\skills\diagnose\SKILL.md
```

Project install:

```text
.claude/skills/diagnose/SKILL.md
```

Recommended project install from this repo:

```powershell
$src = "C:\Users\wests\OneDrive\Desktop\abundance-network-gstack\skills\abundance-diagnosis"
$dst = "C:\path\to\your\project\.claude\skills\diagnose"
Copy-Item -Recurse -Force $src $dst
```

Invoke it with:

```text
Use diagnose on this policy issue: ...
```

or, if Claude exposes it as a slash command:

```text
/diagnose
```

## Claude Cowork

Claude Cowork can use Claude Skills, but the install path and sharing model may differ from Claude Code. Use the Claude app's Skills or Cowork customization UI when available.

Practical approach:

1. Package or upload the `skills/abundance-diagnosis` folder as a skill.
2. Name it `diagnose`.
3. Include the `references/` folder.
4. Start a Cowork task with:

```text
Use the diagnose skill to create a pass-one Abundance Systems Memo for this issue: ...
```

Cowork is especially useful for pass-two work when connectors or files are available: PDFs, policy docs, reports, notes, emails, and shared drives.

## Google Antigravity

Antigravity supports skills as folders containing `SKILL.md`.

Recommended project install:

```text
.agents/skills/diagnose/SKILL.md
```

Older projects may also support:

```text
.agent/skills/diagnose/SKILL.md
```

Install from this repo:

```powershell
$src = "C:\Users\wests\OneDrive\Desktop\abundance-network-gstack\skills\abundance-diagnosis"
$dst = "C:\path\to\your\project\.agents\skills\diagnose"
Copy-Item -Recurse -Force $src $dst
```

Then ask Antigravity:

```text
Use diagnose to analyze this policy issue before recommending action: ...
```

## Portable Fallback

If a tool does not support skills natively, paste the contents of:

```text
skills/abundance-diagnosis/SKILL.md
```

and attach or paste the relevant reference files:

```text
references/memo-template.md
references/diagnostic-lenses.md
references/deep-research-handoff.md
```

This loses auto-triggering and progressive loading, but the workflow still works.

## Safety Note

Treat third-party skills as executable instructions. CAMP currently contains only Markdown instructions and references, not scripts. If scripts are added later, review them before installing into an agent with filesystem or network access.

