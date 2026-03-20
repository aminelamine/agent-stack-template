# design_guide.md
> **Usage** : Ce fichier définit la philosophie UI/UX et les règles du design system.
> BOB le lit avant tout travail d'interface. ANALYZER le lit pour évaluer la conformance.
> Ce n'est pas une documentation de composants — c'est son **interprétation opinionée** pour ce projet.
> **À remplir avant la première feature UI.**

---

## 🎨 Philosophie de Design

### Principe directeur
> En 1-2 phrases : quelle est l'intention de design de ce produit ? Qu'est-ce que l'UI doit communiquer ?

`[À COMPLÉTER — ex. "Sobre et éditorial : le design s'efface pour que le contenu parle."]`

### Les 3 mots qui définissent l'UI
`[Mot 1]` · `[Mot 2]` · `[Mot 3]`

### Ce que ça signifie concrètement pour BOB
- `[ex. "Pas d'animations pour impressionner — uniquement pour guider l'attention"]`
- `[ex. "La typographie fait le travail hiérarchique, pas les couleurs"]`
- `[ex. "Chaque élément justifie sa présence"]`

---

## 🏗️ Stack UI

| Outil | Rôle | Version |
|---|---|---|
| `[ex. Next.js]` | `[Framework React]` | `[15.x]` |
| `[ex. Tailwind CSS]` | `[Utility-first styling]` | `[4.x]` |
| `[ex. Shadcn/ui]` | `[Composants accessibles]` | `[latest]` |
| `[ex. Lucide React]` | `[Iconographie]` | `[latest]` |
| `[ex. Geist]` | `[Typographie]` | `[latest]` |

> ⚠️ BOB ne doit **pas** introduire de librairie UI non listée ici sans validation du Talent.

---

## 🎛️ Design Tokens

### Thème de base
> Quel thème Shadcn/ui ? Zinc (sobre) / Default / New York / Slate ?

`[À COMPLÉTER — ex. "Thème Zinc : gris neutres froids, sans teinte colorée"]`

### Variables CSS — `globals.css`

```css
@layer base {
  :root {
    /* Remplace avec les valeurs de ton thème */
    --background: 0 0% 100%;
    --foreground: 240 10% 3.9%;
    --primary: 240 5.9% 10%;
    --primary-foreground: 0 0% 98%;
    --secondary: 240 4.8% 95.9%;
    --secondary-foreground: 240 5.9% 10%;
    --muted: 240 4.8% 95.9%;
    --muted-foreground: 240 3.8% 46.1%;
    --border: 240 5.9% 90%;
    --radius: 0.375rem;
    /* [Ajoute tes tokens custom ici] */
  }
}
```

### Sémantique des tokens

| Token | Usage |
|---|---|
| `background` / `foreground` | Fond de page et texte principal |
| `muted` / `muted-foreground` | Zones secondaires, métadonnées |
| `border` | Séparateurs — utilisé avec parcimonie |
| `primary` | Actions principales |
| `secondary` | Surfaces secondaires, badges |
| `destructive` | Uniquement pour les actions irréversibles |

---

## 🔤 Typographie

```tsx
// À configurer dans layout.tsx
// [Indique ta font et comment l'importer]
```

### Échelle typographique

| Usage | Classes Tailwind | Exemple |
|---|---|---|
| Display / Hero | `text-4xl md:text-6xl font-bold tracking-tight` | Tagline principale |
| Heading 1 | `text-3xl font-bold tracking-tight` | Titre de section |
| Heading 2 | `text-xl font-semibold` | Titre de carte |
| Body | `text-base font-normal leading-relaxed` | Texte courant |
| Body small | `text-sm font-normal leading-relaxed` | Descriptions |
| Caption | `text-xs text-muted-foreground` | Dates, tags |

---

## 📐 Spacing & Layout

- **Grille de base :** 8px (multiples de `2` en Tailwind)
- **Max-width contenu :** `[ex. max-w-3xl]`
- **Max-width layout :** `[ex. max-w-5xl]` avec padding `px-6 md:px-8`
- **Sections :** padding vertical `[ex. py-16 md:py-24]`
- **Breakpoints actifs :** `md (768px)` et `lg (1024px)` — mobile-first

---

## 🧱 Composants — Liste validée

BOB utilise **uniquement** les composants de cette liste. Toute addition doit être validée par le Talent.

```bash
# [Ajoute ici les composants Shadcn validés pour ce projet]
# ex :
npx shadcn@latest add button
npx shadcn@latest add card
npx shadcn@latest add skeleton
npx shadcn@latest add sonner
```

### Règles d'utilisation
1. **Jamais modifier** les fichiers de base du design system — étendre uniquement via `className`
2. **Variantes custom** → utiliser `cva` si disponible
3. **`asChild`** → pour composer des composants sans wrapper superflu

---

## 🖥️ Patterns de Layout

### Structure de page type

```
┌──────────────────────────────────────────┐
│ <Header />  sticky                        │
├──────────────────────────────────────────┤
│                                           │
│  <main>                                   │
│    [max-width] mx-auto px-6               │
│    [sections avec espacement vertical]    │
│                                           │
├──────────────────────────────────────────┤
│ <Footer />                                │
└──────────────────────────────────────────┘
```

### États obligatoires

Pour tout composant impliquant du chargement ou des données :
- `[ ]` **Loading** — skeleton avec les mêmes dimensions que le contenu final
- `[ ]` **Empty** — message contextuel + CTA si applicable
- `[ ]` **Error** — message actionnable (pas "Une erreur s'est produite")
- `[ ]` **Success** — feedback utilisateur (toast ou inline)

### Hiérarchie des actions

| Niveau | Composant | Contrainte |
|---|---|---|
| Primaire | `Button` (default) | 1 seul par section visible |
| Secondaire | `Button variant="outline"` | 2 max par vue |
| Tertiaire | `Button variant="ghost"` | Navigation, liens contextuels |
| Lien externe | `Button variant="link"` ou `<a>` | Toujours avec indicateur externe |

---

## ♿ Accessibilité (non négociable)

- Contraste WCAG AA minimum (4.5:1 texte, 3:1 UI)
- `outline` de focus jamais supprimé sans alternative visible
- Tous les éléments interactifs accessibles au clavier
- Images décoratives : `alt=""` — images de contenu : `alt` descriptif

---

## 🚫 Anti-patterns (BOB ne fait jamais ça)

- ❌ Inline styles `style={{...}}` — classes utilitaires uniquement
- ❌ Animations > 200ms sur des éléments fonctionnels
- ❌ Plus d'un bouton "primary" visible simultanément dans une section
- ❌ Texte sur fond coloré non validé en contrast ratio
- ❌ `useEffect` pour de la logique qui peut vivre côté serveur
- ❌ Données hardcodées dans les composants
- `[Ajoute tes anti-patterns spécifiques au projet]`

---

## 📝 Décisions de design

| Date | Décision | Raison |
|---|---|---|
| `[YYYY-MM-DD]` | Création du guide | Initialisation du projet |
