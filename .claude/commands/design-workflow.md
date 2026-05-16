# /design-workflow — Bridge DS, Figma Designer

> **Optionnel mais recommandé** pour toute feature avec une interface utilisateur significative.
> Requiert `figma-console-mcp` connecté. Voir setup dans le README.

Ce skill génère des frames Figma structurés depuis les specs JO, et maintient la cohérence entre spec, frame et code livré.

## Usage

```
/design-workflow spec feature_[ID]    → génère un frame Figma depuis la spec JO
/design-workflow review feature_[ID]  → évalue la conformance frame ↔ spec
/design-workflow done feature_[ID]    → archive le frame après livraison BOB
/design-workflow drop feature_[ID]    → abandonne un frame
```

## Quand l'utiliser

- Recommandé : toute feature avec des composants UI nouveaux ou un flow utilisateur significatif
- Optionnel : features purement logiques, refactorings, ou features couvertes par design_guide.md existant

## Setup requis

```bash
# 1. Installe le MCP
npm install --save-dev figma-console-mcp

# 2. Crée .mcp.json (ne jamais commiter — déjà dans .gitignore)
# Remplace TON_TOKEN_FIGMA dans .mcp.json par ton vrai token
# Figma → Settings → Personal Access Tokens

# 3. Installe le skill design-workflow
# Copie le dossier .claude/skills/design-workflow/ depuis le projet source
```

---

Read and follow the skill defined in `.claude/skills/design-workflow/SKILL.md`.
