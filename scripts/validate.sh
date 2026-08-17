#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

test -f "$ROOT/SKILL.md"
test -f "$ROOT/README.md"
test -f "$ROOT/LICENSE"
test -f "$ROOT/AGENTS.md"
test -f "$ROOT/agents/openai.yaml"
test -f "$ROOT/references/concretize-script.md"
test -f "$ROOT/references/decompose.md"
test -f "$ROOT/references/action-map-report.md"

grep -Fq 'default_prompt: "用 $goal-action-coach' "$ROOT/agents/openai.yaml"

python3 - "$ROOT/SKILL.md" <<'PY'
import pathlib
import re
import sys

path = pathlib.Path(sys.argv[1])
text = path.read_text()
if not text.startswith("---\n"):
    raise SystemExit("SKILL.md missing YAML frontmatter")
match = re.match(r"^---\n(.*?)\n---", text, re.S)
if not match:
    raise SystemExit("SKILL.md frontmatter is malformed")
frontmatter = {}
for line in match.group(1).splitlines():
    if ":" not in line:
        raise SystemExit(f"Invalid frontmatter line: {line}")
    key, value = line.split(":", 1)
    frontmatter[key.strip()] = value.strip()
if frontmatter.get("name") != "goal-action-coach":
    raise SystemExit("Unexpected skill name")
description = frontmatter.get("description", "")
if not description:
    raise SystemExit("Missing description")
if len(description) > 2048:
    raise SystemExit("Description too long")
if "<" in description or ">" in description:
    raise SystemExit("Description cannot contain angle brackets")
print("goal-action-coach repo validation passed")
PY
