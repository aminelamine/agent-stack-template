# Design Guide
> Read by BOB before every implementation · Read by DO during UX evaluation
> **Fill this file before running BOB for the first time.**

---

## Visual direction

> The committed aesthetic direction for this project.
> Once set, BOB will not deviate without explicit Talent approval.

`[TO FILL]` — e.g. "Dark editorial, typographic tension, warm accents"

---

## Typography

> Heading and body font pairing. Justify in 5 words max.

| Role | Font | Weight | Justification |
|---|---|---|---|
| Display / Heading | `[TO FILL]` | `[e.g. 700, 900]` | `[5 words max]` |
| Body | `[TO FILL]` | `[e.g. 400, 500]` | `[5 words max]` |
| Mono (optional) | `[TO FILL]` | `[e.g. 400]` | `[5 words max]` |

Import: `[Google Fonts URL or Fontshare link]`

---

## Color tokens

```css
:root {
  --color-bg:        [hex];   /* Main background */
  --color-surface:   [hex];   /* Cards, panels */
  --color-border:    [hex];   /* Borders, dividers */
  --color-primary:   [hex];   /* Main actions, CTAs */
  --color-accent:    [hex];   /* Highlights, hover states */
  --color-text:      [hex];   /* Primary text */
  --color-muted:     [hex];   /* Secondary text — check WCAG AA contrast */
}
```

---

## Allowed Shadcn/ui components

> BOB can only use these components without Talent sign-off.
> To add a component: ask JO to create an ADR.

- `[TO FILL]` — e.g. Button, Card, Badge, Input, Separator, Sheet, Dialog, Tooltip

---

## Motion levels

| Level | Definition | When to use |
|---|---|---|
| L0 | No animation | Default — all features unless specified |
| L1 | CSS transitions only (≤ 200ms) | Hover states, subtle reveals |
| L2 | CSS keyframes + Tailwind animate | Page load reveals, staggered content |
| L3 | Motion library (Framer Motion) | Hero animations, complex sequences — requires JO sign-off |

> Default: **L0**. BOB applies L0 unless `motion_level` is explicitly set in the spec.

---

## Layout conventions

> Spatial decisions that define the project's visual personality.

- Grid: `[TO FILL]` — e.g. "12-col grid, 24px gap, max-w-7xl"
- Spacing scale: `[TO FILL]` — e.g. "Tailwind default (4px base)"
- Border radius: `[TO FILL]` — e.g. "rounded-lg (8px) for cards, rounded-full for pills"
- Shadows: `[TO FILL]` — e.g. "shadow-sm only — no heavy drop shadows"

---

## Anti-patterns (forbidden)

> DO deducts points for any of these in BOB's output.

- `[TO FILL]` — e.g. "No Inter or Roboto without strong justification"
- `[TO FILL]` — e.g. "No purple gradients on white"
- `[TO FILL]` — e.g. "No uniform grid — vary proportions"
- `[TO FILL]` — e.g. "No hardcoded hex values — always use CSS variables"
- Never modify `/components/ui/` — Shadcn owns it

---

## Accessibility baseline

> Minimum standards BOB must meet. DO scores on these.

- Contrast: WCAG AA minimum (4.5:1 for normal text, 3:1 for large text)
- Interactive elements: keyboard navigable, visible focus states
- Images: meaningful `alt` attributes
- CTAs: descriptive `aria-label` when link text is ambiguous
