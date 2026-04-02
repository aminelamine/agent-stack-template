#!/usr/bin/env bash
# setup.sh — Agent Stack Template
# Initialise un projet complet depuis le template en une seule commande.
# Usage : bash setup.sh

set -e

# ─── Colors ───────────────────────────────────────────────────────────────────
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║   Agent Stack — Setup Wizard         ║${RESET}"
echo -e "${BOLD}║   JO · BOB · DO + ADR System         ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════╝${RESET}"
echo ""

# ─── Step 1 — Project info ────────────────────────────────────────────────────
echo -e "${CYAN}── Projet ──────────────────────────────${RESET}"
read -rp "  Nom du projet (ex: my-portfolio) : " PROJECT_NAME
read -rp "  Description courte (1 phrase)    : " PROJECT_DESC
read -rp "  Stack technique (ex: Next.js · TypeScript · Tailwind · Shadcn/ui) : " TECH_STACK
read -rp "  Stack design (ex: Figma Desktop + figma-console-mcp) [optionnel] : " DESIGN_STACK
echo ""

# ─── Step 2 — Tech stack init ─────────────────────────────────────────────────
echo -e "${CYAN}── Stack technique ─────────────────────${RESET}"
read -rp "  Initialiser Next.js 15 + Shadcn/ui maintenant ? [o/N] : " INIT_NEXTJS
echo ""

# ─── Confirmation ─────────────────────────────────────────────────────────────
echo -e "${YELLOW}── Récapitulatif ───────────────────────${RESET}"
echo "  Projet      : $PROJECT_NAME"
echo "  Description : $PROJECT_DESC"
echo "  Tech Stack  : $TECH_STACK"
echo "  Design Stack: ${DESIGN_STACK:-—}"
echo "  Next.js init: ${INIT_NEXTJS:-N}"
echo ""
read -rp "  Confirmer ? [O/n] : " CONFIRM
if [[ "$CONFIRM" =~ ^[nN]$ ]]; then
  echo "  Annulé."
  exit 0
fi

echo ""
echo -e "${CYAN}── Configuration des fichiers ──────────${RESET}"

# ─── Replace placeholders in CLAUDE.md ───────────────────────────────────────
if [[ -f "CLAUDE.md" ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|\[PROJECT_NAME\]|$PROJECT_NAME|g" CLAUDE.md
    sed -i '' "s|\[1 phrase — ce que le produit fait et pour qui\]|$PROJECT_DESC|g" CLAUDE.md
    sed -i '' "s|\[ex. Next.js · TypeScript strict · Tailwind CSS · Shadcn/ui · Lucide React\]|$TECH_STACK|g" CLAUDE.md
    sed -i '' "s|\[ex. Figma Desktop + figma-console-mcp (write access) + Bridge DS /design-workflow\]|${DESIGN_STACK:-— (configurer si besoin)}|g" CLAUDE.md
  else
    sed -i "s|\[PROJECT_NAME\]|$PROJECT_NAME|g" CLAUDE.md
    sed -i "s|\[1 phrase — ce que le produit fait et pour qui\]|$PROJECT_DESC|g" CLAUDE.md
    sed -i "s|\[ex. Next.js · TypeScript strict · Tailwind CSS · Shadcn/ui · Lucide React\]|$TECH_STACK|g" CLAUDE.md
    sed -i "s|\[ex. Figma Desktop + figma-console-mcp (write access) + Bridge DS /design-workflow\]|${DESIGN_STACK:-— (configurer si besoin)}|g" CLAUDE.md
  fi
  echo -e "  ${GREEN}✓${RESET} CLAUDE.md configuré"
fi

# ─── Replace placeholders in AGENTS.md ───────────────────────────────────────
if [[ -f "AGENTS.md" ]]; then
  TODAY=$(date +%Y-%m-%d)
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s|\[Nom ou numéro du sprint\]|Sprint 1 — Setup|g" AGENTS.md
    sed -i '' "s|\[PLAN / DESIGN / SHIP / ANALYZE\]|PLAN|g" AGENTS.md
    sed -i '' "s|\[feature_XXX → feature_YYY\]|—|g" AGENTS.md
    sed -i '' "s|\[— ou description\]|—|g" AGENTS.md
    sed -i '' "s|\[Description\]|Première spec validée|g" AGENTS.md
  else
    sed -i "s|\[Nom ou numéro du sprint\]|Sprint 1 — Setup|g" AGENTS.md
    sed -i "s|\[PLAN / DESIGN / SHIP / ANALYZE\]|PLAN|g" AGENTS.md
    sed -i "s|\[feature_XXX → feature_YYY\]|—|g" AGENTS.md
    sed -i "s|\[— ou description\]|—|g" AGENTS.md
    sed -i "s|\[Description\]|Première spec validée|g" AGENTS.md
  fi
  echo -e "  ${GREEN}✓${RESET} AGENTS.md configuré"
fi

# ─── Next.js + Shadcn init ────────────────────────────────────────────────────
if [[ "$INIT_NEXTJS" =~ ^[oO]$ ]]; then
  echo ""
  echo -e "${CYAN}── Initialisation Next.js 15 ───────────${RESET}"
  npx create-next-app@latest . --typescript --tailwind --eslint --app --no-git --yes
  echo -e "  ${GREEN}✓${RESET} Next.js initialisé"

  echo ""
  echo -e "${CYAN}── Initialisation Shadcn/ui ────────────${RESET}"
  echo "  Sélectionne : Default style · Zinc · CSS variables: yes"
  npx shadcn@latest init
  echo -e "  ${GREEN}✓${RESET} Shadcn/ui initialisé"
fi

# ─── Git init (si pas déjà un repo) ──────────────────────────────────────────
if [[ ! -d ".git" ]]; then
  echo ""
  echo -e "${CYAN}── Git ─────────────────────────────────${RESET}"
  git init
  git add .
  git commit -m "init: agent stack — $PROJECT_NAME"
  echo -e "  ${GREEN}✓${RESET} Repo git initialisé"
fi

# ─── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════╗${RESET}"
echo -e "${BOLD}${GREEN}║   ✓ Setup terminé                    ║${RESET}"
echo -e "${BOLD}${GREEN}╚══════════════════════════════════════╝${RESET}"
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
echo -e "  4. Ouvre le projet dans Claude Code et lance :"
echo -e "     ${BOLD}/jo j'ai une idée : [ta première feature]${RESET}"
echo ""
echo -e "  ${YELLOW}ADR System :${RESET} Crée ton premier ADR dans ${BOLD}agent-system/adr/${RESET}"
echo -e "  quand tu as ta première décision d'architecture à documenter."
echo ""
