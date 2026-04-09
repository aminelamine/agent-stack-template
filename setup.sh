#!/usr/bin/env bash
# setup.sh — Agent Stack Template
# Initialise un nouveau projet depuis le template local + pnpm install.
# Usage : bash /path/to/agent-stack-template/setup.sh

set -e

# ─── Colors ───────────────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
RESET='\033[0m'

# ─── Resolve template dir (chemin absolu du dossier contenant setup.sh) ───────
TEMPLATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo -e "${BOLD}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║   Agent Stack — Setup Wizard         ║${RESET}"
echo -e "${BOLD}║   JO · BOB · DO + ADR System         ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════╝${RESET}"
echo ""

# ─── Vérification pnpm ────────────────────────────────────────────────────────
if ! command -v pnpm &> /dev/null; then
  echo -e "${YELLOW}  pnpm non trouvé — installation en cours...${RESET}"
  npm install -g pnpm
fi
echo -e "  ${GREEN}✓${RESET} pnpm $(pnpm --version)"
echo ""

# ─── Step 1 — Infos projet ────────────────────────────────────────────────────
echo -e "${CYAN}── Projet ──────────────────────────────${RESET}"
read -rp "  Nom du projet (ex: my-portfolio) : " PROJECT_NAME
read -rp "  Description courte (1 phrase)    : " PROJECT_DESC
read -rp "  Stack design (ex: Figma + figma-console-mcp) [optionnel] : " DESIGN_STACK
echo ""

# ─── Step 2 — Dossier cible ───────────────────────────────────────────────────
echo -e "${CYAN}── Destination ─────────────────────────${RESET}"
read -rp "  Dossier cible [défaut: ./$PROJECT_NAME] : " TARGET_INPUT
TARGET_DIR="${TARGET_INPUT:-$PROJECT_NAME}"

if [[ -d "$TARGET_DIR" && "$(ls -A "$TARGET_DIR" 2>/dev/null)" ]]; then
  echo -e "  ${YELLOW}⚠ Le dossier '$TARGET_DIR' n'est pas vide.${RESET}"
  read -rp "  Continuer quand même ? [o/N] : " FORCE
  [[ "$FORCE" =~ ^[oO]$ ]] || { echo "  Annulé."; exit 0; }
fi

mkdir -p "$TARGET_DIR"
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
echo ""

# ─── Confirmation ─────────────────────────────────────────────────────────────
echo -e "${YELLOW}── Récapitulatif ───────────────────────${RESET}"
echo "  Projet      : $PROJECT_NAME"
echo "  Description : $PROJECT_DESC"
echo "  Stack design: ${DESIGN_STACK:-—}"
echo "  Destination : $TARGET_DIR"
echo ""
read -rp "  Confirmer ? [O/n] : " CONFIRM
[[ "$CONFIRM" =~ ^[nN]$ ]] && { echo "  Annulé."; exit 0; }
echo ""

# ─── Step 3 — Copie du template ───────────────────────────────────────────────
echo -e "${CYAN}── Copie du template ───────────────────${RESET}"
rsync -a \
  --exclude="setup.sh" \
  --exclude="node_modules" \
  --exclude=".git" \
  --exclude=".next" \
  "$TEMPLATE_DIR/" "$TARGET_DIR/"
echo -e "  ${GREEN}✓${RESET} Fichiers copiés depuis le template local"
echo ""

# ─── Step 4 — Remplacement des placeholders ───────────────────────────────────
echo -e "${CYAN}── Configuration ───────────────────────${RESET}"

_sed() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "$@"
  else
    sed -i "$@"
  fi
}

if [[ -f "$TARGET_DIR/package.json" ]]; then
  _sed "s|__PROJECT_NAME__|$PROJECT_NAME|g" "$TARGET_DIR/package.json"
  echo -e "  ${GREEN}✓${RESET} package.json"
fi

if [[ -f "$TARGET_DIR/app/layout.tsx" ]]; then
  _sed "s|__PROJECT_NAME__|$PROJECT_NAME|g" "$TARGET_DIR/app/layout.tsx"
  _sed "s|__PROJECT_DESC__|$PROJECT_DESC|g" "$TARGET_DIR/app/layout.tsx"
  echo -e "  ${GREEN}✓${RESET} app/layout.tsx"
fi

if [[ -f "$TARGET_DIR/app/page.tsx" ]]; then
  _sed "s|__PROJECT_NAME__|$PROJECT_NAME|g" "$TARGET_DIR/app/page.tsx"
  echo -e "  ${GREEN}✓${RESET} app/page.tsx"
fi

if [[ -f "$TARGET_DIR/CLAUDE.md" ]]; then
  _sed "s|\[PROJECT_NAME\]|$PROJECT_NAME|g" "$TARGET_DIR/CLAUDE.md"
  _sed "s|\[1 phrase — ce que le produit fait et pour qui\]|$PROJECT_DESC|g" "$TARGET_DIR/CLAUDE.md"
  _sed "s|\[ex. Figma Desktop + figma-console-mcp (write access) + Bridge DS /design-workflow\]|${DESIGN_STACK:-— (configurer si besoin)}|g" "$TARGET_DIR/CLAUDE.md"
  echo -e "  ${GREEN}✓${RESET} CLAUDE.md"
fi

if [[ -f "$TARGET_DIR/AGENTS.md" ]]; then
  _sed "s|\[Nom ou numéro du sprint\]|Sprint 1 — Setup|g" "$TARGET_DIR/AGENTS.md"
  _sed "s|\[PLAN / DESIGN / SHIP / ANALYZE\]|PLAN|g" "$TARGET_DIR/AGENTS.md"
  _sed "s|\[feature_XXX → feature_YYY\]|—|g" "$TARGET_DIR/AGENTS.md"
  _sed "s|\[— ou description\]|—|g" "$TARGET_DIR/AGENTS.md"
  _sed "s|\[Description\]|Première spec validée|g" "$TARGET_DIR/AGENTS.md"
  echo -e "  ${GREEN}✓${RESET} AGENTS.md"
fi
echo ""

# ─── Step 5 — Installation des dépendances ────────────────────────────────────
echo -e "${CYAN}── Installation des dépendances ────────${RESET}"
cd "$TARGET_DIR"
pnpm install
echo -e "  ${GREEN}✓${RESET} Dépendances installées (pnpm)"
echo ""

# ─── Step 6 — Git init ────────────────────────────────────────────────────────
if [[ ! -d ".git" ]]; then
  echo -e "${CYAN}── Git ─────────────────────────────────${RESET}"
  git init
  cat > .gitignore << 'EOF'
node_modules/
.next/
.env*.local
*.log
EOF
  git add .
  git commit -m "init: agent stack — $PROJECT_NAME"
  echo -e "  ${GREEN}✓${RESET} Repo git initialisé"
  echo ""
fi

# ─── Step 7 — Health check ────────────────────────────────────────────────────
echo -e "${CYAN}── Vérification santé ──────────────────${RESET}"
ERRORS=0

if pnpm exec tsc --noEmit 2>/dev/null; then
  echo -e "  ${GREEN}✓${RESET} TypeScript — aucune erreur"
else
  echo -e "  ${RED}✗${RESET} TypeScript — erreurs détectées (diagnostic: pnpm exec tsc --noEmit)"
  ERRORS=$((ERRORS + 1))
fi

if pnpm run lint --silent 2>/dev/null; then
  echo -e "  ${GREEN}✓${RESET} ESLint — aucune erreur"
else
  echo -e "  ${RED}✗${RESET} ESLint — erreurs détectées (diagnostic: pnpm run lint)"
  ERRORS=$((ERRORS + 1))
fi

echo ""

# ─── Done ─────────────────────────────────────────────────────────────────────
if [[ $ERRORS -eq 0 ]]; then
  echo -e "${BOLD}${GREEN}╔══════════════════════════════════════╗${RESET}"
  echo -e "${BOLD}${GREEN}║   ✓ Stack prête — zéro erreur        ║${RESET}"
  echo -e "${BOLD}${GREEN}╚══════════════════════════════════════╝${RESET}"
else
  echo -e "${BOLD}${YELLOW}╔══════════════════════════════════════════════╗${RESET}"
  echo -e "${BOLD}${YELLOW}║   ⚠ Setup terminé — $ERRORS erreur(s) à corriger   ║${RESET}"
  echo -e "${BOLD}${YELLOW}╚══════════════════════════════════════════════╝${RESET}"
fi

echo ""
echo -e "  ${BOLD}Prochaines étapes :${RESET}"
echo ""
echo -e "  1. Remplis ${BOLD}agent-system/context/client_vision.md${RESET}"
echo -e "     → Vision produit, personas, JTBD, contraintes"
echo ""
echo -e "  2. Remplis ${BOLD}agent-system/context/roadmap.md${RESET}"
echo -e "     → Features Phase 1 et KPIs"
echo ""
echo -e "  3. Remplis ${BOLD}agent-system/context/design_guide.md${RESET}"
echo -e "     → Tokens, composants validés, anti-patterns"
echo ""
echo -e "  4. Lance le dev server :"
echo -e "     ${BOLD}cd $TARGET_DIR && pnpm dev${RESET}"
echo ""
echo -e "  5. Ouvre dans Claude Code et lance :"
echo -e "     ${BOLD}/jo j'ai une idée : [ta première feature]${RESET}"
echo ""
