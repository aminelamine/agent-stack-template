# CLAUDE.md — Contexte Global du Projet
> Ce fichier est chargé automatiquement par Claude Code à chaque session.
> Il bootstrappe le système multi-agents JO / BOB / DO.

---

## 🗺️ Ce projet

**Nom :** `[PROJECT_NAME]`
**Description courte :** `[1 phrase — ce que le produit fait et pour qui]`

Ce projet suit un workflow multi-agents structuré en 4 phases : **PLAN → DESIGN → SHIP → ANALYZE**.
Avant toute action, identifie dans quelle phase tu te trouves et quel agent tu incarnes.

**Stack technique :** `[ex. Next.js · TypeScript strict · Tailwind CSS · Shadcn/ui · Lucide React]`
**Stack design :** `[ex. Figma Desktop + figma-console-mcp (write access) + Bridge DS /design-workflow]`

> ⚠️ Remplace les placeholders `[...]` ci-dessus avant de commencer la première session.

---

## 📄 Fichiers de contexte partagés

Lis ces fichiers en priorité au début de chaque session :

| Fichier | Contenu | Lu par |
|---|---|---|
| `agent-system/context/client_vision.md` | Vision client, JTBD, contraintes | JO, DO |
| `agent-system/context/roadmap.md` | Features, KPIs, backlog, out-of-scope | JO, BOB |
| `agent-system/context/design_guide.md` | Tokens UI, composants autorisés, anti-patterns | BOB, DO |

---

## 🤖 Les agents disponibles

Utilise les slash commands pour activer chaque agent :

| Command | Agent | Phase | Action |
|---|---|---|---|
| `/jo` | JO — Architecte & Strategist | PLAN | Challenge une idée, génère une spec |
| `/design-workflow` | Bridge DS — Designer Figma | DESIGN | Génère un frame Figma depuis une spec JO |
| `/bob` | BOB — Builder & UI/UX | SHIP | Implémente une spec en code |
| `/do` | DO — Product QA & CX | ANALYZE | Évalue le code livré, rend un verdict /20 |

---

## 🔄 Workflow complet

```
1. /jo               → "j'ai une idée : [description]"
                      → JO challenge + génère specs/feature_[ID].md

2. /design-workflow  → "spec feature_[ID]"
                      → Bridge DS lit la spec + génère le frame Figma
                      → (optionnel — recommandé pour features visuellement complexes)

3. /bob              → "implémente feature_[ID]"
                      → BOB lit la spec + design_guide + frame Figma si existant

4. /do               → "évalue feature_[ID]"
                      → DO score /20 + verdict + feedbacks
```

---

## 🚫 Règles invariantes

- Ne jamais coder sans spec validée (`statut: VALIDÉE TALENT` dans la spec)
- Ne jamais modifier les fichiers dans `/components/ui/` (Shadcn — ownership total)
- Ne jamais introduire une librairie UI non listée dans `design_guide.md` sans validation
- TypeScript strict : zéro `any`, zéro `@ts-ignore`
- Chaque composant fait < 150 lignes — découper si dépassement
