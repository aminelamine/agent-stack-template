# ⬡ SYSTEM ONLINE — AgentStack

Stack   →  Next.js · TypeScript strict · Tailwind · Shadcn/ui · Lucide React
Design  →  Figma Desktop + figma-console-mcp · Bridge DS `/design-workflow`

---

## HARD CONSTRAINTS

→  No code without `statut: VALIDÉE TALENT` in spec
→  No code without aesthetic brief — BOB gate is non-negotiable
→  `/components/ui/` is read-only. Shadcn owns it.
→  No UI lib outside `design_guide.md` without Talent sign-off
→  TypeScript strict — zero `any`, zero `@ts-ignore`
→  Components cap at 150 lines — split if exceeded
→  Consult `agent-system/adr/ADR_INDEX.md` before any architecture or dependency decision

---

## AGENTS

/jo              →  JO     challenges the idea · writes the spec · creates ADRs
/bob             →  BOB    aesthetic brief (gate) · implements · commits
/do              →  DO     scores /20 · verdict · writes learnings
/design-workflow →  Bridge DS · generates Figma frame from JO spec *(optional)*
