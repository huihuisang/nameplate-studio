#!/bin/zsh
# 发布铭牌工具到 ajigu 产品站：https://ajigu.com/nameplate/
# 用法：./deploy-ajigu.sh   （ajigu-site 仓库默认在 ~/Documents/GitHub/ajigu-site）
set -e
cd "$(dirname "$0")"
SITE="${AJIGU_SITE:-$HOME/Documents/GitHub/ajigu-site}"
[ -d "$SITE" ] || { echo "找不到 ajigu-site 仓库：$SITE"; exit 1; }

DEST="$SITE/nameplate"
rm -rf "$DEST"
mkdir -p "$DEST/vendor"
mkdir -p "$DEST/assets"
cp index.html styles.css app.js template-data.js .nojekyll "$DEST/"
cp assets/ajigu-logo.png assets/nameplate-icon.png assets/og.png "$DEST/assets/"
cp vendor/xlsx.full.min.js vendor/jszip.min.js vendor/three.min.js "$DEST/vendor/"

cd "$SITE"
git add nameplate
git commit -m "Update nameplate tool" 2>/dev/null || echo "nameplate 无变更，跳过提交"
git push
echo "完成：https://ajigu.com/nameplate/"
