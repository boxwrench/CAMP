# Interaction Protocol

How every CAMP skill should run in a host chat so the flow feels like a guided UI while leaving the user in control. Each `SKILL.md` carries a short `## Interaction` hook that points here; this file is the full version.

First-class hosts: Claude Code, Claude Cowork. Supported with graceful fallback: Codex, Antigravity.

## Principle

Offer structure the user can lean on or ignore. Menus are scaffolding, not gates. The loop is a map, not rails. Recommendations wait for consent. Never pester for answers the user has not authentically given.

## Startup Banner

The `start` router — and only the router — prints this exact banner verbatim on entry, before the loop map. Worker skills do not print it; they keep the one-line header plus loop map. The banner is a fixed literal, never generated at runtime (no dependency on figlet or any binary).

```
 ██████╗ █████╗ ███╗   ███╗██████╗
██╔════╝██╔══██╗████╗ ████║██╔══██╗
██║     ███████║██╔████╔██║██████╔╝
██║     ██╔══██║██║╚██╔╝██║██╔═══╝
╚██████╗██║  ██║██║ ╚═╝ ██║██║
 ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝
   Capacity · Abundance · Mechanisms · Policy
```

A skill emits only text; it cannot set terminal colors. The banner is monochrome. Brand color lives in the README hero banner.

## 1. Loop Map

At the start of a skill, and again when you offer routing, print the loop map so the user always knows where they are:

```
CAMP   diagnose · foresight · recode · verify · translate · test · learn · build
       ▸ you are here: <skill>    ·    say "jump to <skill>" or "go back" anytime
```

- Bracket the current skill in the top line, e.g. `... recode · [verify] · translate ...`.
- The router `camp` prints the map with no bracket, since it is choosing where to start.
- Print it on entry and at routing — not on every message.
- The map is navigable: honor "jump to <skill>" and "go back" at any time.

## 2. Menus With An Escape Hatch

Detect the host by tools, not by name:

> If an `AskUserQuestion` tool variant is in your tool list, use native menus. Otherwise present a compact numbered list and accept either a number or free-text prose.

- Use menus only at genuine forks: mode selection (pass one / pass two), approach choices, and routing. Keep ordinary intake conversational.
- Every menu includes an open option: "Something else — let me explain."
- Free-text is always honored, even when a menu is shown. The menu is a convenience, never a cage.

Numbered-list fallback example:

```
How do you want to run this?
  1. Pass one — hypothesis memo, no live research
  2. Pass two — evidence-backed revision
  3. Something else — let me explain
Reply with a number, or just tell me.
```

## 3. Stop Asking (Agency Guardrail)

- Deferral is a real answer. "you pick", "not sure", "skip", "just draft", "let it sit", "let's move on", or silence → proceed with best effort, record the assumption in the memo, and move on. Do not re-ask.
- Never ask the same question twice in different words.
- Ask at most two or three questions in a row before producing something to react to: a partial draft, a summary, or a recommendation.
- One good question beats three weak ones. Ask the highest-value question, infer the rest, let the user correct.
- A blank or "I don't know" is signal, not a gap. Log it in the memo's uncertainty register instead of extracting a guess.

## 4. Recommend, Don't Railroad

At a phase boundary:

- Print the loop map, name the recommended next skill, and give the one-line reason.
- Then stop and wait. Never auto-advance to the next skill or phase.
- The user may accept, choose a different skill, revise the current artifact, or stop.

## 5. Phase Header And Visible Structure

- On entering a skill, print a one-line header: the skill name and its purpose.
- When a memo table is the current focus (for example the weighted causal model), surface that table so the user watches the structure form.
- Use the existing memo template. Do not invent a new artifact format.
