# Feature Spec — [FEATURE_ID] : [Nom de la Feature]
> **Généré par** : RAY
> **Statut** : `[ ] DRAFT  [ ] VALIDÉE TALENT  [ ] EN DEV  [ ] EN REVIEW  [ ] LIVRÉE`
> **Dernière mise à jour** : `[YYYY-MM-DD]`
> **Lien Roadmap** : `roadmap.md#[ID]`

---

## 📋 Contexte & Problème

### Problème à résoudre
> En 2-3 phrases : quel est le problème utilisateur concret que cette feature adresse ?
> Ne pas décrire la solution ici — uniquement le problème.

`[À COMPLÉTER PAR RAY]`

### JTBD ciblé
> Extraire depuis `context/client_vision.md`

*"Quand [situation], l'utilisateur veut [motivation], pour [résultat attendu]."*
`[À COMPLÉTER]`

### Impact attendu
| KPI | Avant | Cible après feature | Méthode de mesure |
|---|---|---|---|
| `[KPI depuis roadmap.md]` | `[Baseline]` | `[Cible]` | `[Méthode]` |

---

## 🎯 Scope

### In Scope ✅
> Ce que cette feature fait.

- `[Comportement 1]`
- `[Comportement 2]`
- `[Comportement 3]`

### Out of Scope ❌
> Ce que cette feature NE fait pas — explicitement.

- `[Non-comportement 1 — ex. : "pas de gestion multi-tenant"]`
- `[Non-comportement 2]`

### Dépendances
| Feature | Relation | Statut |
|---|---|---|
| `[Feature ID]` | `[doit être livrée avant / peut être parallèle]` | `[statut]` |

---

## 👤 User Stories (Format Gherkin)

### Story 1 — [Titre]
```gherkin
GIVEN [état initial du système / contexte utilisateur]
WHEN [action de l'utilisateur]
THEN [résultat observable attendu]
  AND [résultat secondaire si applicable]
```

### Story 2 — [Titre]
```gherkin
GIVEN [état initial]
WHEN [action]
THEN [résultat]
```

### Story 3 — Edge Case : [Titre]
```gherkin
GIVEN [condition limite ou cas d'erreur]
WHEN [action]
THEN [comportement de gestion d'erreur attendu]
```

---

## ✅ Critères d'Acceptation Binaires

> Chaque critère est VRAI ou FAUX. Pas de "devrait", "généralement", "si possible".
> ANALYZER coche cette liste pour rendre son verdict.

### Fonctionnels
- [ ] `[Critère 1 — ex. : "L'utilisateur peut soumettre le formulaire avec les champs requis remplis"]`
- [ ] `[Critère 2 — ex. : "Un toast de succès s'affiche dans les 2 secondes après soumission"]`
- [ ] `[Critère 3]`
- [ ] `[Critère 4]`

### États UI (obligatoires)
- [ ] **Loading state** : `[Description de l'état de chargement attendu]`
- [ ] **Empty state** : `[Description de l'état vide + CTA si applicable]`
- [ ] **Error state** : `[Description du message d'erreur + action proposée]`
- [ ] **Success state** : `[Description du feedback positif]`

### Design System
- [ ] Les composants utilisés sont listés dans `design_guide.md`
- [ ] La hiérarchie des actions (primary/secondary/destructive) est respectée
- [ ] Le contraste WCAG AA est respecté sur tous les éléments
- [ ] L'interface est navigable au clavier

### Performance
- [ ] `[Critère de performance si applicable — ex. : "La liste se charge en < 500ms sur une connexion 4G"]`

---

## 🖥️ Interface & Comportements

### Composants Shadcn/ui requis
> BOB installe UNIQUEMENT ces composants pour cette feature.

```bash
npx shadcn@latest add [composant-1]
npx shadcn@latest add [composant-2]
```

### Wireframe / Description de l'interface
> Description textuelle de l'interface. Ajouter un lien Figma si disponible.

```
┌─────────────────────────────────┐
│ [Description du layout]        │
│                                 │
│  [Zone A]    [Zone B]           │
│                                 │
│  [CTA Primary]  [CTA Secondary] │
└─────────────────────────────────┘
```

**Figma :** `[lien ou "À créer"]`

### Interactions clés
| Action utilisateur | Comportement attendu |
|---|---|
| `[Clic sur [bouton]]` | `[Description précise du comportement]` |
| `[Soumission formulaire]` | `[Validation côté client → appel API → feedback]` |
| `[Navigation vers]` | `[Transition / route attendue]` |

---

## 🔌 Données & API

### Données nécessaires
| Donnée | Source | Type | Requis |
|---|---|---|---|
| `[Nom]` | `[API / BDD / État local]` | `[string / number / etc.]` | `[Oui / Non]` |

### Endpoints / Actions
```typescript
// Server Action ou API Route attendue
// À implémenter par BOB

async function [actionName](params: [Type]): Promise<[ReturnType]> {
  // [Description de la logique attendue]
}
```

### Gestion des erreurs
| Cas d'erreur | Message utilisateur | Action proposée |
|---|---|---|
| `[Timeout API]` | `[Message clair]` | `[Bouton "Réessayer"]` |
| `[Erreur validation]` | `[Message inline sur le champ]` | `[Correction inline]` |
| `[Erreur serveur 500]` | `[Message générique]` | `[Contact support si récurrent]` |

---

## 📐 Notes Techniques pour BOB

> Points d'attention spécifiques à cette feature.

- `[Note 1 — ex. : "Utiliser Server Components pour le fetch initial, Client Component uniquement pour l'interactivité"]`
- `[Note 2 — ex. : "Debouncer la recherche à 300ms"]`
- `[Note 3]`

---

## 🔍 Notes pour ANALYZER

> Ce que ANALYZER doit vérifier en priorité pour cette feature.

- `[Point d'attention UX 1 — ex. : "Vérifier que l'empty state est suffisamment informatif"]`
- `[Point d'attention 2 — ex. : "Simuler le flow complet avec un utilisateur qui n'a jamais utilisé le produit"]`

---

## 📝 Historique de la Spec

| Date | Version | Changement | Par |
|---|---|---|---|
| `[YYYY-MM-DD]` | `v0.1` | Création initiale | RAY |
| `[YYYY-MM-DD]` | `v0.2` | `[Description du changement]` | `[RAY / Le Talent]` |
