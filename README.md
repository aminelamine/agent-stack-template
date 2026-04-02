# agent-stack-template

> Système multi-agents **JO / BOB / DO** pour Claude Code.
> Workflow **PLAN → DESIGN → SHIP → ANALYZE**, avec système ADR intégré et intégration Figma optionnelle.

---

## ⚡ Quick Start — Une commande

```bash
# 1. Clone le template dans ton dossier projet
gh repo clone aminelamine/agent-stack-template mon-projet -- --depth=1
cd mon-projet

# 2. Lance le wizard de setup
bash setup.sh
```

Le wizard configure automatiquement CLAUDE.md et AGENTS.md avec les infos de ton projet,
initialise Next.js 15 + Shadcn/ui si souhaité, et crée le repo git initial.

> **Sans GitHub CLI ?** → Voir [Installation manuelle](#installation-manuelle) plus bas.

---

## 🧠 Ce que ce template contient

Ce n'est pas un simple boilerplate. C'est un système d'orchestration d'agents avec une mémoire structurée :

| Composant | Rôle |
|---|---|
| **CLAUDE.md** | Bootstrap automatique — chargé par Claude Code à chaque session |
| **AGENTS.md** | Contraintes opérationnelles du sprint : versions d'outils, limites d'autonomie par agent, conventions de commit |
| **agent-system/context/** | Mémoire partagée — vision client, roadmap, design guide |
| **agent-system/adr/** | Architecture Decision Records — mémoire longue des décisions structurantes |
| **agent-system/specs/** | Specs vivantes générées par JO, consommées par BOB |
| **.claude/commands/** | Slash commands pour activer chaque agent |

---

## 🤖 Les agents

| Slash command | Agent | Phase | Mission |
|---|---|---|---|
| `/jo` | **JO** — Architecte & Strategist | PLAN | Challenge les idées, génère les specs, crée les ADRs |
| `/design-workflow` | **Bridge DS** — Designer Figma | DESIGN | Génère des frames Figma depuis une spec JO *(optionnel)* |
| `/bob` | **BOB** — Builder & UI/UX | SHIP | Implémente les specs en code, commite avec conventions |
| `/do` | **DO** — Product QA & CX | ANALYZE | Score /20, verdict VALIDÉ/REJETÉ, vérifie la conformance ADR |

---

## 🔄 Workflow

```
/jo  "j'ai une idée : [description]"
      ↓
     JO challenge → génère specs/feature_[ID].md
      ↓
/design-workflow  "spec feature_[ID]"    ← optionnel
      ↓
     Bridge DS → frame Figma
      ↓
/bob  "implémente feature_[ID]"
      ↓
     BOB lit spec + design_guide + ADRs → code + commits conventionnels
      ↓
/do  "évalue feature_[ID]"
      ↓
     DO → score /20 · conformance spec + ADRs · verdict
```

---

## 📐 Système ADR — Mémoire longue des décisions

Le répertoire `agent-system/adr/` contient les **Architecture Decision Records** du projet.
C'est le mécanisme qui empêche BOB de contredire en session 5 une décision prise en session 1.

```
agent-system/adr/
├── ADR_INDEX.md        ← Registre — lu par tous les agents en début de session
├── ADR_TEMPLATE.md     ← Template à copier pour chaque nouvelle décision
└── adr-001-*.md        ← Décisions actives (créées par JO, validées par Le Talent)
```

**Quand créer un ADR :**
- Introduction d'une nouvelle dépendance majeure
- Choix de paradigme ou pattern architectural
- Décision de scope avec impact multi-features
- Tout choix structurant dont le *pourquoi* ne doit pas se perdre

---

## 📁 Structure complète

```
agent-stack-template/
│
├── CLAUDE.md                          ← Bootstrap — chargé automatiquement
├── AGENTS.md                          ← Contraintes sprint : versions, autonomie, commits
├── setup.sh                           ← Wizard d'installation one-command
│
├── .claude/
│   └── commands/
│       ├── jo.md                      ← /jo  — Architecte & Strategist
│       ├── bob.md                     ← /bob  — Builder & UI/UX
│       ├── do.md                      ← /do   — Product QA & CX
│       └── design-workflow.md         ← /design-workflow — Bridge Figma
│
├── agent-system/
│   ├── context/
│   │   ├── client_vision.md           ← Vision, personas, JTBD [À REMPLIR]
│   │   ├── roadmap.md                 ← Features, KPIs, backlog [À REMPLIR]
│   │   └── design_guide.md            ← Tokens, composants, anti-patterns [À REMPLIR]
│   ├── adr/
│   │   ├── ADR_INDEX.md               ← Registre des décisions actives
│   │   └── ADR_TEMPLATE.md            ← Template pour créer un ADR
│   └── specs/
│       └── feature_template.md        ← Template spec Gherkin + gate INVEST
│
└── .mcp.json                          ← Config Figma MCP [TOKEN À CONFIGURER]
```

---

## 🔑 Générique vs. projet-spécifique

| Fichier | Générique | Projet-spécifique |
|---|---|---|
| `CLAUDE.md` | Structure | Nom, stack, description |
| `AGENTS.md` | Structure + règles agents | Versions d'outils, sprint en cours |
| `.claude/commands/*.md` | ✅ Tout | Rien |
| `client_vision.md` | Structure | Tout le contenu |
| `roadmap.md` | Structure | Tout le contenu |
| `design_guide.md` | Structure | Tokens, stack UI, décisions |
| `adr/ADR_INDEX.md` | Structure | Décisions du projet |
| `adr/ADR_TEMPLATE.md` | ✅ Tout | Rien |
| `feature_template.md` | ✅ Tout | Rien |
| `.mcp.json` | Structure | Token Figma |

---

## 🛠️ Installation manuelle

Si tu ne peux pas utiliser GitHub CLI :

**Option A — GitHub Template**
1. Sur GitHub : Settings → ✓ Template repository
2. "Use this template" → créer un nouveau repo
3. `git clone [url-nouveau-repo] && cd [repo] && bash setup.sh`

**Option B — degit (sans historique git)**
```bash
npx degit aminelamine/agent-stack-template mon-projet
cd mon-projet
bash setup.sh
```

**Option C — Copie manuelle**
```bash
cp -r agent-stack-template/ mon-projet/
cd mon-projet/
rm -rf .git
bash setup.sh
```

---

## ⚙️ Configuration post-setup

### Fichiers à remplir manuellement (non gérés par le wizard)

**`agent-system/context/client_vision.md`**
→ Vision produit, personas, JTBD, contraintes, métriques de succès

**`agent-system/context/roadmap.md`**
→ Features Phase 1, KPIs, out-of-scope

**`agent-system/context/design_guide.md`**
→ Philosophie UI, stack, tokens CSS, composants validés, anti-patterns

### Figma MCP (optionnel)

```bash
# Installe le MCP
npm install --save-dev figma-console-mcp

# Dans .mcp.json : remplace VOTRE_TOKEN_FIGMA_ICI
# Figma Settings → Personal Access Tokens → Créer un token
```

> ⚠️ Ajoute `.mcp.json` à ton `.gitignore` — ne commite jamais un vrai token.

---

## ⚠️ Notes importantes

- **TypeScript strict** : les agents supposent TypeScript strict. Si ta stack diffère, adapte `bob.md` section "Qualité de Code" et crée un ADR pour documenter le choix.
- **AGENTS.md** : met à jour la section "Sprint en cours" à chaque début de sprint — c'est la source de vérité pour les agents sur le scope actuel.
- **ADRs** : crée ton premier ADR dès que tu fais un choix de stack ou d'architecture. JO te guide avec `/jo`.
- **`/design-workflow`** : nécessite le skill Bridge DS dans `.claude/skills/design-workflow/`. Copie-le depuis le projet source si utilisé.
