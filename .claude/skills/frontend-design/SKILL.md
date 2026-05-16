---
name: frontend-design
description: >
  Generates an aesthetic brief before any UI implementation.
  Commits to a precise visual direction based on the spec context.
  BOB activates this automatically at the start of every UI feature — before the first line of CSS.
  Triggers: "bob", "implement", "feature_[ID]", any Next.js UI implementation.
---

# Frontend Design — Aesthetic Brief

> This skill activates automatically when BOB starts implementing a UI feature.
> Its role: establish a **clear, committed aesthetic direction** BEFORE writing the first line of code.
> Estimated time: 2–3 minutes. Saves 30–60 minutes of rework.

---

## Philosophy

A good frontend doesn't start with code — it starts with **intent**.
The intent must be specific, memorable, and coherent with the product context.

**Cardinal rule: "Match implementation complexity to aesthetic vision."**
A maximalist design deserves elaborate code.
A minimalist design demands typographic precision, nothing more.
Elegance comes from faithful execution of the vision — not from accumulating effects.

---

## Activation protocol (BOB executes before any UI implementation)

### Step 1 — Read the context

Read in this order:

1. `agent-system/specs/active/feature_[ID].md` → extract: feature type, tone, audience, UI complexity, visual criteria
2. `agent-system/context/design_guide.md` → is an aesthetic direction already defined for this project?
3. `agent-system/resources/visual_reference.md` → identify palette + font pairing candidates

> If `design_guide.md` already has a defined, validated direction → go directly to Step 3 (summarize alignment, don't reinvent).

---

### Step 2 — Aesthetic positioning (if not yet defined)

Define the **5 dimensions** by confronting each choice against the real spec context:

**1. Global direction**
What's the intent in 1 sentence? It must be specific and memorable.
- ✅ "Typography-driven, warm, editorial — like a design magazine"
- ✅ "Dark CLI terminal, honest and technical — zero ornament"
- ✅ "Bold startup energy, strong graphic tensions, optimistic"
- ❌ "Minimalist and modern" → too generic, start over

**2. Typography**
Choose 1 pairing from `visual_reference.md`. Justify in 5 words max.
- Align the pairing register with the global direction
- Prefer **high-tension** pairings: serif/sans, display/mono, variable font on extreme weights
- Forbidden without strong contextual justification: Inter alone, Roboto, Arial, system fonts

**3. Palette**
Choose 1 system from `visual_reference.md`. Configure CSS variable tokens.
- The palette must **tell the same story** as the typography
- Avoid the purple-gradient-on-white temptation: it's the "AI default"
- Prefer: strong dominant + sharp accent + coherent background

**4. Visual tension**
What opposition creates interest and avoids templates?
- Bold heading / ultra-light body
- Dark background / luminous accent
- Expressive serif / neutral sans
- High density in 1 zone / generous white space elsewhere

**5. Spatial composition**
How space is organized — what differentiates from "classic layout":
- Assumed asymmetry (off-center grids)
- Block overlap (overlapping cards)
- Typography alone as design (no background tricks)
- Bento grid (varied proportions, not all identical)
- Full-bleed sections with sharp cuts
- Scroll-triggered reveals (staggered animation-delay)

---

### Step 3 — Aesthetic Brief (standardized output)

BOB produces this block and **presents it to the Talent before coding**.
This is a **visual contract**, not a summary. BOB stops here and waits for explicit response.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[AESTHETIC BRIEF — Feature [ID]: [Name]]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎯 Direction    : [1 sentence — the specific intent]

🔤 Typography   : [Heading font] / [Body font]
                  → [reason in 5 words]
                  → @import: [Google Fonts URL or Fontshare source]

🎨 Palette      : [Reference from visual_reference.md]
                  Primary: [hex] · Accent: [hex] · BG: [hex]

⚡ Tension      : [chosen opposition — e.g. "expressive serif / neutral sans"]

📐 Composition  : [spatial approach — e.g. "asymmetric bento + stagger reveal"]

⚠️  Avoid here  : [2–3 context-specific generic patterns to avoid]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Validate in 1 line or indicate your adjustments.
```

> **[BOB] ⏸ Waiting for brief validation — I won't start implementation before your confirmation.**
>
> The Talent responds "ok" or adjusts 1–2 points. This gate is a point of no return:
> once validated, the direction is committed and all code choices will flow from it.
> Correcting a direction after code costs 10× more than here.

---

### Step 4 — Anchor in code (after validation)

Once the brief is validated by the Talent:

1. **CSS Variables** — Configure `:root` in `globals.css` with the brief's tokens
2. **Fonts** — Load via `next/font` (preferred) or `@import` in `layout.tsx` (fallback)
3. **Document** — If choices aren't yet in `design_guide.md`, add them now

```css
/* Expected :root structure */
:root {
  --color-primary: [hex];
  --color-accent:  [hex];
  --color-bg:      [hex];
  --font-heading:  '[Heading font]', serif;
  --font-body:     '[Body font]', sans-serif;
}
```

---

## Invariant rules

- **Never skip the brief** to "save time" — it's what saves UI rework
- **Never recycle** a brief from a previous feature without confronting it to the new context
- **Never choose** a pairing or palette without justifying it by the spec context
- **If design_guide.md already has a direction** → summarize alignment in 1 line, confirm and proceed
- **The brief must be specific**: "typography-driven editorial" > "minimalist and modern"
- **Always present the brief to the Talent** before implementing — even if the choice seems obvious
