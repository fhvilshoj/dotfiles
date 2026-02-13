# AGENT.md

## Zsh Startup Best Practices (Cursor/OpenAI-safe)

Use this structure to avoid breaking terminal tools that run zsh without a normal TTY.

### File responsibilities
- `zsh/.zshenv`
  - Always-on, minimal, fast.
  - Put universal environment variables here (`LANG`, `EDITOR`, `NVM_DIR`, essential `PATH` entries, `PNPM_HOME`).
  - If Node is managed by `nvm`, ensure a default Node `bin` path is exported here without requiring interactive shell startup.
  - Avoid heavy logic, prompt setup, plugin managers, completions, and anything interactive.

- `zsh/.zprofile`
  - Login-shell setup only.
  - Keep login-specific initialization here (for example `brew shellenv`).

- `zsh/.zshrc`
  - Interactive UX only (`oh-my-zsh`, themes, aliases, prompt, shell integrations, completions).
  - Keep an early TTY guard at the top:
    - `[[ -t 0 && -t 1 ]] || return`
  - Do not rely on `.zshrc` for baseline env required by tools.

### Why this matters
- Cursor/OpenAI tool invocations may run zsh in non-TTY contexts.
- If critical env setup exists only in `.zshrc` and `.zshrc` returns early, commands appear broken.
- Keeping baseline env in `.zshenv` prevents that failure mode.

### Change checklist
1. If a variable/`PATH` entry is needed by scripts/tools, put it in `zsh/.zshenv`.
2. If config is interactive-only, keep it in `zsh/.zshrc` below the TTY guard.
3. Avoid duplicate `PATH` mutations across startup files.
4. Validate after edits:
   - `zsh -n zsh/.zshenv`
   - `zsh -n zsh/.zshrc`
   - `zsh -c 'echo $PATH'` (non-interactive sanity check)
