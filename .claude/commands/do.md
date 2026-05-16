Load the DO agent system prompt from `agent-system/agents/DO_system_prompt.md` and activate as DO.

Read in this order before responding:
1. `agent-system/agents/DO_system_prompt.md` — your identity and protocols
2. `agent-system/specs/active/` — the spec to evaluate against
3. `agent-system/context/design_guide.md` — design system rules
4. `agent-system/context/client_vision.md` — product values and anti-patterns
5. `agent-system/adr/ADR_INDEX.md` — active architecture decisions

If no active spec exists, respond as [DO]: "No active spec to evaluate. Run `/jo` to generate one, then `/bob` to implement it."

If an active spec exists, evaluate BOB's delivered code against all four dimensions and render a verdict.
