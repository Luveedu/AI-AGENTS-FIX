#!/bin/bash

# AI-AGENTS-FIX Setup Script
# Downloads skill definitions to your AI editor's configuration folder

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Skill definitions
SKILLS=(
    "speed-optimization"
    "seo-content"
    "project-guide"
    "mobile-ui-ux"
    "frontend-design"
)

# Base URL for raw files
BASE_URL="https://raw.githubusercontent.com/Luveedu/AI-AGENTS-FIX/refs/heads/main"

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     AI-AGENTS-FIX Setup Script            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
echo ""

# Display editor options
echo -e "${YELLOW}Which AI code editor do you use?${NC}"
echo ""
echo "  A) VS Code       ( .copilot )"
echo "  B) Kiro          ( .kiro )"
echo "  C) Trae          ( .trae )"
echo "  D) Cursor        ( .cursor )"
echo "  E) Antigravity   ( .antigravity )"
echo "  F) Claude        ( .claude )"
echo "  G) Codex         ( .codex )"
echo "  H) Others        ( .luveedu )"
echo ""

# Get user selection
read -p "Enter your choice (A-H): " choice

# Convert to lowercase
choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

# Determine folder name based on selection
case $choice in
    a)
        EDITOR_FOLDER=".copilot"
        EDITOR_NAME="VS Code"
        ;;
    b)
        EDITOR_FOLDER=".kiro"
        EDITOR_NAME="Kiro"
        ;;
    c)
        EDITOR_FOLDER=".trae"
        EDITOR_NAME="Trae"
        ;;
    d)
        EDITOR_FOLDER=".cursor"
        EDITOR_NAME="Cursor"
        ;;
    e)
        EDITOR_FOLDER=".antigravity"
        EDITOR_NAME="Antigravity"
        ;;
    f)
        EDITOR_FOLDER=".claude"
        EDITOR_NAME="Claude"
        ;;
    g)
        EDITOR_FOLDER=".codex"
        EDITOR_NAME="Codex"
        ;;
    h)
        EDITOR_FOLDER=".luveedu"
        EDITOR_NAME="Others"
        ;;
    *)
        echo -e "${RED}Invalid selection. Please run the script again and choose A-H.${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}Selected: ${EDITOR_NAME} (${EDITOR_FOLDER})${NC}"
echo ""

# Create skills directory (relative to current working directory)
SKILLS_DIR="$(pwd)/${EDITOR_FOLDER}/skills"
echo -e "${YELLOW}Creating skills directory: ${SKILLS_DIR}${NC}"
mkdir -p "${SKILLS_DIR}"

# Download each skill
echo ""
echo -e "${BLUE}Downloading skills...${NC}"
echo ""

for skill in "${SKILLS[@]}"; do
    SKILL_URL="${BASE_URL}/${skill}/SKILL.md"
    SKILL_PATH="${SKILLS_DIR}/${skill}"
    
    echo -n "  • ${skill}... "
    
    # Create skill directory
    mkdir -p "${SKILL_PATH}"
    
    # Download SKILL.md
    if curl -sL "${SKILL_URL}" -o "${SKILL_PATH}/SKILL.md"; then
        if [ -s "${SKILL_PATH}/SKILL.md" ]; then
            echo -e "${GREEN}✓${NC}"
        else
            echo -e "${RED}✗ (file empty or not found)${NC}"
            rm -f "${SKILL_PATH}/SKILL.md"
            rmdir "${SKILL_PATH}" 2>/dev/null || true
        fi
    else
        echo -e "${RED}✗ (download failed)${NC}"
        rm -rf "${SKILL_PATH}" 2>/dev/null || true
    fi
done

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║           Setup Complete!                  ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "Skills installed to: ${BLUE}${SKILLS_DIR}${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Restart your ${EDITOR_NAME} editor"
echo "  2. The AI agent will automatically detect the new skills"
echo "  3. Start using enhanced AI assistance!"
echo ""
