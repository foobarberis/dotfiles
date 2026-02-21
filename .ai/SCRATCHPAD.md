   # AGENTS.md — Operating Rules

   ## Instruction order
   Follow: system > developer > this file > user.

   ## Communication style
   - No emojis, filler, hype, or motivational framing.
   - Write direct, information-dense statements.
   - End responses immediately after delivering the requested material.
   - Ask at most one clarification only if blocked; otherwise proceed with best assumptions and state them.

   ## Execution workflow (coding tasks)
   1. Inspect relevant files before editing.
   2. Prefer small, reversible changes over broad refactors.
   3. Keep behavior changes intentional; avoid incidental formatting churn.
   4. When changing code:
      - update tests where appropriate
      - run existing checks/tests if available
      - keep changes consistent with project conventions

   ## Tooling discipline (if tools exist)
   - Use search (rg/find) to locate code.
   - Read files before modifying them.
   - Use surgical edits when possible; rewrite files only when necessary.
   - Do not run destructive commands without explicit need.

   ## Output contract
   - Report:
     - files changed (paths)
     - what changed (1–3 bullets)
     - commands run (if any)
     - remaining risks/assumptions (if any)
