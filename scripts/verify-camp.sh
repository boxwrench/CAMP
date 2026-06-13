#!/usr/bin/env bash
# verify-camp.sh — dev/CI verification for the CAMP skill stack.
# NOT installed into any agent. Checks that references resolve, no stale folder
# slugs remain, each frontmatter name matches its folder, and 9 skills exist.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
fail=0
err() { echo "FAIL: $*" >&2; fail=1; }

# --- 1. Reference resolution --------------------------------------------------
# Scan SKILL.md files + top-level docs (excluding superpowers history) + knowledge
# + README/INSTALLATION. A reference is a backtick or link token starting with a
# known prefix. references/* resolve relative to the skill folder; everything else
# (and ${CLAUDE_PLUGIN_ROOT}/*) resolves relative to repo root.
tmpfail="$(mktemp)"
ref_re='(\$\{CLAUDE_PLUGIN_ROOT\}/)?(skills|docs|knowledge|references|assets)/[A-Za-z0-9._/-]+'
{
  find skills -name SKILL.md
  find docs -maxdepth 1 -name '*.md' | grep -v 'using-camp-with-agents.md'
  find knowledge -name '*.md'
  ls README.md 2>/dev/null
} | while read -r f; do
  [ -f "$f" ] || continue
  skilldir="$(dirname "$f")"
  grep -oE "$ref_re" "$f" 2>/dev/null | while read -r ref; do
    p="${ref#\$\{CLAUDE_PLUGIN_ROOT\}/}"
    p="${p%.}"
    case "$p" in
      references/*) target="$skilldir/$p" ;;
      *)            target="$ROOT/$p" ;;
    esac
    [ -e "$target" ] || echo "$f -> unresolved reference: $ref" >> "$tmpfail"
  done
done
if [ -s "$tmpfail" ]; then
  echo "FAIL: unresolved references:" >&2
  sed 's/^/  /' "$tmpfail" >&2
  fail=1
fi
rm -f "$tmpfail"

# --- 2. No stale folder slugs -------------------------------------------------
slugs='abundance-diagnosis|abundance-foresight|abundance-recode|abundance-verify|abundance-translate|abundance-test|abundance-learn|abundance-build|skills/camp'
stale="$(grep -rEn "$slugs" --include='*.md' --include='*.json' . \
  | grep -v '^\./docs/superpowers/' \
  | grep -v '^\./scripts/verify-camp.sh' \
  | grep -v '^\./INSTALLATION.md' \
  | grep -v '^\./docs/using-camp-with-agents.md' || true)"
if [ -n "$stale" ]; then
  echo "FAIL: stale folder slug(s):" >&2
  echo "$stale" | sed 's/^/  /' >&2
  fail=1
fi

# --- 3. Frontmatter name matches folder ---------------------------------------
for d in skills/*/; do
  name="$(basename "$d")"
  fm="$(awk -F': *' '/^name:/{print $2; exit}' "$d/SKILL.md" 2>/dev/null)"
  [ "$fm" = "$name" ] || err "frontmatter name '$fm' != folder '$name' in $d"
done

# --- 4. Skill count -----------------------------------------------------------
count="$(find skills -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')"
[ "$count" -eq 9 ] || err "expected 9 skills, found $count"

# --- 5. Plugin validation (best-effort) ---------------------------------------
if command -v claude >/dev/null 2>&1; then
  claude plugin validate >/dev/null 2>&1 || echo "WARN: 'claude plugin validate' reported issues" >&2
else
  echo "INFO: claude CLI not found; skipping plugin validate" >&2
fi

if [ "$fail" -ne 0 ]; then echo "verify-camp: FAILED" >&2; exit 1; fi
echo "verify-camp: OK"
