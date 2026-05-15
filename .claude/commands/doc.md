# /doc — Documentation Sync

**Agent activé :** DOC — Documentation Sync Engineer

---

## Ce que fait cette commande

DOC analyse les changements de la feature indiquée et synchronise la documentation du projet avec la réalité du code.

**Déclencheurs typiques :**
- Après un verdict DO ≥ 14/20
- En fin de sprint pour une passe globale
- Quand tu remarques une dérive entre le code et les docs

---

## Usage

```
/doc feature_[ID]
/doc sprint          ← passe globale sur tout le sprint
/doc                 ← analyse le dernier diff git
```

---

## Input attendu

DOC a besoin de :
1. Le diff git de la feature (ou le numéro de feature pour qu'il lise les learnings DO)
2. Accès à CLAUDE.md, AGENTS.md, ADR_INDEX.md, LEARNINGS_INDEX.md

Si tu tapes simplement `/doc`, DOC demande quel diff analyser.

---

## Ce que DOC produit

1. **Rapport de dérives** — fichier par fichier, delta observé, correction proposée
2. **Entrée CHANGELOG** — prête à copier-coller
3. **Signal ADR émergent** — si une décision récurrente mérite d'être formalisée

DOC ne modifie rien sans ta validation explicite.

---

## Règle de déclenchement

DOC ne se déclenche **jamais** sur une feature REJETÉE par DO.
Attendre le verdict ≥ 14/20 avant de syncer la documentation.
