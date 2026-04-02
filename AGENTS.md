# AGENTS.md — Scope & Contraintes Opérationnelles
> Ce fichier définit les **contraintes immédiates** du sprint en cours, les versions exactes des outils,
> et les limites d'autonomie par agent.
> Il complète CLAUDE.md (vision globale) — il ne le répète pas.
> **Maintenu par : JO à chaque début de sprint, validé par Le Talent.**
>
> ⚠️ Remplace les placeholders `[...]` avant de commencer la première session.

---

## 🔧 Tool Versions — Scope immédiat

| Outil | Version verrouillée | Notes |
|---|---|---|
| `[Framework]` | `[version]` | `[note spécifique]` |
| `[Language]` | `[version]` | `[note spécifique]` |
| `[UI Library]` | `[version]` | `[note spécifique]` |
| `[Styling]` | `[version]` | `[note spécifique]` |

> ⚠️ Les versions ici font foi. En cas de divergence avec la doc en ligne, les versions ci-dessus s'appliquent.

---

## 🤖 Limites d'Autonomie par Agent

### JO — Architecte & Strategist
| Action | Autonomie |
|---|---|
| Challenger une idée, poser des questions | ✅ Pleine autonomie |
| Générer une spec `feature_[ID].md` | ✅ Pleine autonomie |
| Modifier `client_vision.md` ou `roadmap.md` | ❌ Jamais — Talent uniquement |
| Créer un ADR pour une décision structurante | ✅ Pleine autonomie (après validation Talent) |
| Arbitrer un choix d'implémentation BOB | ✅ Recommandation, Talent tranche si désaccord |
| Marquer une spec comme `VALIDÉE TALENT` | ❌ Jamais — Talent uniquement |
| Marquer un ADR comme `ACCEPTED` | ❌ Jamais — Talent uniquement |

### BOB — Builder & UI/UX Engineer
| Action | Autonomie |
|---|---|
| Implémenter une spec `VALIDÉE TALENT` | ✅ Pleine autonomie |
| Installer un composant listé dans `design_guide.md` | ✅ Pleine autonomie |
| Installer un composant non listé | ❌ Demander validation Talent |
| Introduire une nouvelle dépendance | ❌ Demander validation JO + Talent |
| Modifier les fichiers UI ownership (ex: `/components/ui/`) | ❌ Jamais |
| Commiter du code | ✅ Avec conventions obligatoires (voir section Commits) |
| Déployer | ❌ Jamais sans validation Talent |

### DO — Product QA & CX
| Action | Autonomie |
|---|---|
| Évaluer le code de BOB (score /20) | ✅ Pleine autonomie |
| Rendre un verdict VALIDÉ / Réserves / REJETÉ | ✅ Pleine autonomie |
| Inventer des critères hors spec + ADRs ACCEPTED | ❌ Jamais |
| Modifier du code directement | ❌ Jamais — feedback uniquement |

---

## 📝 Conventions de Commits — Obligatoires pour BOB

### Format
```
type(scope): description courte en impératif présent

[corps optionnel — contexte, trade-offs, why not autre chose]

Réf: feature_[ID] | adr-[ID] | spec:[critère d'acceptation]
```

### Types valides
| Type | Quand l'utiliser |
|---|---|
| `feat` | Nouvelle fonctionnalité (correspond à une spec) |
| `fix` | Correction de bug |
| `refactor` | Réécriture sans changement de comportement |
| `style` | Changements CSS/styling purs, sans logique |
| `chore` | Config, dépendances, tooling |
| `docs` | Documentation uniquement |
| `test` | Ajout ou modification de tests |

### Exemples
```
feat(feature_001): add sticky navigation with mobile menu
fix(feature_003): correct contrast ratio on secondary links
refactor(layout): extract Header into standalone component
chore(deps): install [ui-library] button and badge components
```

### Règle de référence obligatoire
Chaque commit BOB **doit** inclure une référence à la spec ou au critère déclencheur :
```
feat(feature_002): add hero section with responsive type scale

Implémente critère d'acceptation CA-3.
Réf: feature_002_hero | spec:CA-3
```

> Si un commit ne peut pas référencer une spec, c'est un signal que le travail n'est pas dans le scope défini.

---

## 🔍 Règles de Lecture — Ce que chaque agent lit en priorité

```
JO     → client_vision.md + roadmap.md + adr/ADR_INDEX.md
BOB    → specs/feature_[ID].md + design_guide.md + adr/ADR_INDEX.md
DO     → specs/feature_[ID].md + adr/ADR_INDEX.md + code livré par BOB
```

---

## 📅 Sprint en cours

> **Maintenir cette section à jour à chaque début de sprint.**

| Champ | Valeur |
|---|---|
| Sprint | `[Nom ou numéro du sprint]` |
| Phase active | `[PLAN / DESIGN / SHIP / ANALYZE]` |
| Features en cours | `[feature_XXX → feature_YYY]` |
| Blockers connus | `[— ou description]` |
| Prochaine milestone | `[Description]` |

---

## 🚫 Règles transversales (rappel condensé)

- Ne jamais coder sans spec `statut: VALIDÉE TALENT`
- TypeScript strict : zéro `any`, zéro `@ts-ignore`
- Composants < 150 lignes — découper si dépassement
- Données jamais hardcodées dans les composants
- Consulter `agent-system/adr/ADR_INDEX.md` avant toute décision d'architecture
