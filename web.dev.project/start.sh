#!/bin/bash
# ─────────────────────────────────────────────────────────────
# SteamDB Mini — Quick Setup Script
# Team: Bekeshov Arsen, Shynbulat Kazbek, Naseken Olzhas
# ─────────────────────────────────────────────────────────────

echo "═══════════════════════════════════════"
echo "  ⬡  SteamDB Mini — Setup"
echo "═══════════════════════════════════════"

# ── Backend ──────────────────────────────
echo ""
echo "▶ Setting up Django backend..."
cd backend

python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

pip install -r requirements.txt

python manage.py migrate
echo "✓ Database migrated"

echo ""
echo "Create a superuser? (y/n)"
read -r answer
if [ "$answer" = "y" ]; then
  python manage.py createsuperuser
fi
