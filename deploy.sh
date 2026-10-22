#!/usr/bin/env bash
# Met en ligne l'appli : tamponne un numéro de version (déclenche le bandeau « Nouvelle version » sur les téléphones), commit et push.
# Usage : ./deploy.sh "message de commit"
set -e
cd "$(dirname "$0")"
v=$(date +%Y%m%d-%H%M%S)
sed -i "s/const APP_VERSION = '[^']*'/const APP_VERSION = '$v'/" index.html
git add -A
git commit -q -m "${1:-Mise à jour}" -m "Version $v"
git push -q
echo "Version $v en ligne (GitHub Pages met ~1 min à se mettre à jour)"
