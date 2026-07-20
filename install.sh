#!/usr/bin/env bash
# install.sh — symlink dotfiles vào $HOME (backup file cũ trước)
set -euo pipefail

DOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

cd "$DOTDIR"

mapfile -t FILES < <(find . -type f \
  -not -path "./.git/*" \
  -not -name "install.sh" \
  -not -name "README.md" \
  -not -name "packages.txt" \
  -not -name ".gitignore" | sed 's|^\./||')

for f in "${FILES[@]}"; do
  src="$DOTDIR/$f"
  dst="$HOME/$f"

  # đã link đúng rồi thì bỏ qua
  if [ -L "$dst" ] && [ "$(readlink -f "$dst")" = "$src" ]; then
    continue
  fi

  # backup nếu target tồn tại (file thật hoặc link khác)
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "$f")"
    mv "$dst" "$BACKUP/$f"
    echo "backup: $f"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "link:   $f"
done

# executable bit cho scripts
chmod +x "$DOTDIR"/.config/niri/scripts/*.sh 2>/dev/null || true
chmod +x "$DOTDIR"/.config/mpv/scripts/*.sh 2>/dev/null || true
chmod +x "$DOTDIR"/.local/bin/* 2>/dev/null || true

echo
[ -d "$BACKUP" ] && echo "Backup cũ ở: $BACKUP"
echo "Done."
