# ADR Index — Architecture Decision Records
> Registre de toutes les décisions d'architecture, design et business du projet.
> **Maintenu par : JO** — une entrée par décision structurante.
> **Lu par : tous les agents en début de session** avant toute décision d'implémentation.

---

## Pourquoi des ADRs dans un système multi-agents ?

Dans un système où BOB implémente sans nécessairement connaître le contexte des sessions précédentes,
le risque est de reproduire une approche déjà écartée ou de contredire une décision validée.
Les ADRs sont la mémoire longue du projet — ils comblent le gap entre les specs (ce qu'on build)
et le contexte (pourquoi on l'a construit ainsi).

**Règle** : Avant toute décision d'architecture ou de dépendance, consulter cet index.
Si une décision similaire existe déjà en statut ACCEPTED, elle s'applique — pas de contournement sans nouvel ADR.

---

## Index des décisions

| ID | Titre | Domaine | Statut | Date |
|---|---|---|---|---|
| — | *Aucun ADR pour l'instant — ajouter le premier avec `ADR_TEMPLATE.md`* | — | — | — |

---

## Statuts possibles

| Statut | Signification |
|---|---|
| `🟡 PROPOSED` | En discussion — pas encore actif |
| `✅ ACCEPTED` | Décision validée par Le Talent — s'applique à tous les agents |
| `⚠️ DEPRECATED` | Remplacée par une décision plus récente |
| `🔄 SUPERSEDED` | Voir ADR de remplacement lié |

---

## Comment créer un nouvel ADR

1. Copier `ADR_TEMPLATE.md`
2. Nommer `adr-[NNN]-[titre-kebab-case].md` (NNN = prochain numéro séquentiel)
3. Remplir toutes les sections
4. Soumettre à Le Talent pour validation avant de marquer `✅ ACCEPTED`
5. Ajouter une ligne dans ce fichier

> JO est responsable de créer les ADRs. BOB peut en proposer un si un choix d'implémentation
> a des implications structurantes — mais c'est JO qui le formate et Le Talent qui valide.

---

## Triggers ADR — Quand JO doit créer un ADR

- Introduction d'une nouvelle dépendance npm (hors librairie UI validée)
- Choix de paradigme ou pattern architectural (ex: stratégie de data fetching, auth)
- Décision de scope (in/out) avec impact sur plusieurs features
- Choix de stack ou framework avec alternatives réelles écartées

> Ne pas créer d'ADR pour des choix d'implémentation mineurs (nommage, découpage de sous-composants).
> L'ADR doit contraindre les sessions futures pour justifier son existence.
