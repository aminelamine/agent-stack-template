# agent-stack-template

> Système multi-agents RAY / BOB / ANALYZER pour Claude Code.
> Workflow PLAN → DESIGN → SHIP → ANALYZE, avec intégration Figma optionnelle.

---

## 🚀 Utiliser ce template pour un nouveau projet

### Étape 1 — Cloner / copier le template

**Option A — GitHub Template (recommandé)**
1. Sur GitHub, configure ce repo comme "Template repository" (Settings → ✓ Template repository)
2. Pour chaque nouveau projet → "Use this template" → créer un nouveau repo
3. `git clone [url-nouveau-repo]`

**Option B — Copie manuelle**
```bash
cp -r agent-stack-template/ mon-nouveau-projet/
cd mon-nouveau-projet/
git init && git add . && git commit -m "init: agent stack"
```

---

### Étape 2 — Initialiser le projet technique

```bash
# Exemple avec Next.js (adapte à ta stack)
npx create-next-app@latest . --typescript --tailwind --eslint --app

# Installer les dépendances Shadcn
npx shadcn@latest init

# (Optionnel) Installer figma-console-mcp pour l'intégration Figma
npm install --save-dev figma-console-mcp
```

---

### Étape 3 — Configurer les placeholders

**CLAUDE.md** — Remplace en haut du fichier :
- `[PROJECT_NAME]` → nom de ton projet
- `[1 phrase — ce que le produit fait et pour qui]`
- `[Stack technique]` → ta stack réelle

**agent-system/context/client_vision.md** — Remplis :
- Vision produit (1 phrase)
- Personas + JTBD
- Contraintes et métriques

**agent-system/context/roadmap.md** — Remplis :
- OKR Phase courante
- Liste des features Phase 1

**agent-system/context/design_guide.md** — Remplis :
- Philosophie + 3 mots
- Stack UI
- Tokens CSS
- Composants validés

**.mcp.json** — Si tu utilises Figma :
- Remplace `VOTRE_TOKEN_FIGMA_ICI` par ton token (Figma Settings → Personal Access Tokens)
- ⚠️ Ne commite jamais ce fichier avec un vrai token — ajoute `.mcp.json` à `.gitignore`

---

### Étape 4 — Démarrer ta première session

```
# Dans Claude Code, ouvre le dossier du projet
# Les agents sont prêts. Lance ta première idée :

/ray j'ai une idée : [description de ta feature]
```

---

## 📁 Structure du template

```
agent-stack-template/
│
├── CLAUDE.md                          ← Bootstrap automatique — lu par Claude Code
│
├── .claude/
│   └── commands/
│       ├── ray.md                     ← /ray  — Architecte & Strategist
│       ├── bob.md                     ← /bob  — Builder & UI/UX
│       ├── analyze.md                 ← /analyze — Product QA
│       └── design-workflow.md         ← /design-workflow — Bridge Figma
│
├── agent-system/
│   ├── context/
│   │   ├── client_vision.md           ← Vision, personas, JTBD [À REMPLIR]
│   │   ├── roadmap.md                 ← Features, KPIs, backlog [À REMPLIR]
│   │   └── design_guide.md            ← Tokens, composants, anti-patterns [À REMPLIR]
│   └── specs/
│       └── feature_template.md        ← Template spec Gherkin — copié par RAY
│
└── .mcp.json                          ← Config Figma MCP [TOKEN À CONFIGURER]
```

---

## 🔄 Workflow rappel

```
1. /ray    → "j'ai une idée : [description]"
             RAY challenge + génère agent-system/specs/feature_[ID].md

2. /design-workflow → "spec feature_[ID]"   ← optionnel, pour les features visuelles
             Génère un frame Figma depuis la spec

3. /bob    → "implémente feature_[ID]"
             BOB lit spec + design_guide + frame Figma si existant

4. /analyze → "évalue feature_[ID]"
              Score /20 + verdict + feedbacks
```

---

## 🔑 Ce qui est générique vs. projet-spécifique

| Fichier | Générique | Projet-spécifique |
|---|---|---|
| `CLAUDE.md` | Structure | Nom, stack |
| `.claude/commands/*.md` | ✅ Tout | Rien |
| `client_vision.md` | Structure | Tout le contenu |
| `roadmap.md` | Structure | Tout le contenu |
| `design_guide.md` | Structure + defaults Zinc | Tokens custom, décisions |
| `feature_template.md` | ✅ Tout | Rien |
| `.mcp.json` | Structure | Token Figma |

---

## ⚠️ Notes importantes

- **Token Figma** : Régénère un nouveau token pour chaque projet. Ne partage jamais un token entre projets.
- **design_guide.md** : Les defaults Shadcn/Zinc sont un point de départ. Adapte à ta charte.
- **TypeScript strict** : Les agents supposent TypeScript. Si tu utilises une autre stack, adapte `bob.md` section "Architecture".
- **`/design-workflow`** : Nécessite le skill Bridge DS installé dans `.claude/skills/design-workflow/`. Copie-le depuis le projet source si tu l'utilises.
