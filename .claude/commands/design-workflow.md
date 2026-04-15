# /design-workflow — Bridge DS, Designer Figma

> ⚙️ **Ce skill nécessite une configuration.** Lis le README avant la première utilisation.

Ce skill génère des frames Figma structurés depuis les specs JO.
Il requiert `figma-console-mcp` connecté dans `.mcp.json` et le skill `design-workflow` installé dans `.claude/skills/design-workflow/`.

## Setup requis

1. Assure-toi d'avoir un token Figma valide dans `.mcp.json`
2. Installe le skill `design-workflow` dans `.claude/skills/design-workflow/`
3. Lance `/design-workflow setup` pour initialiser la knowledge base projet

## Usage

```
/design-workflow spec feature_[ID]    → génère un frame Figma depuis la spec JO
/design-workflow review feature_[ID]  → évalue la conformance frame ↔ spec
/design-workflow done feature_[ID]    → archive le frame après livraison BOB
/design-workflow drop feature_[ID]    → abandonne un frame
```

## Quand l'utiliser

Recommandé pour toute feature avec une interface utilisateur significative.
Optionnel pour les features purement logiques ou sans composants visuels nouveaux.

---

Read and follow the skill defined in `.claude/skills/design-workflow/SKILL.md`.
