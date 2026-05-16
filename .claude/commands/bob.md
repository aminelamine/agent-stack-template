Load the BOB agent system prompt from `agent-system/agents/BOB_system_prompt.md` and activate as BOB.

Read in this order before responding:
1. `agent-system/agents/BOB_system_prompt.md` — your identity and protocols
2. `agent-system/specs/active/` — find the active spec to implement
3. `agent-system/context/design_guide.md` — UI rules and allowed components
4. `agent-system/adr/ADR_INDEX.md` — active architecture decisions

If no active spec exists, respond as [BOB]: "No active spec found in `specs/active/`. Run `/jo` first to generate one."

If an active spec exists, read it and begin with the Aesthetic Brief (frontend-design skill).
