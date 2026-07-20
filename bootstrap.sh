#!/usr/bin/env bash
# bootstrap.sh — setup máy mới 1 lệnh: apt + uv + nvm + symlink dotfiles
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "==> apt packages"
grep -vE '^\s*(#|$)' packages.txt | xargs sudo apt install -y

echo "==> uv"
command -v uv >/dev/null || curl -LsSf https://astral.sh/uv/install.sh | sh

echo "==> nvm"
[ -d "$HOME/.nvm" ] || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "==> dotfiles"
./install.sh

cat <<'EOF'

Done. Còn cài tay:
  - niri glass_effect fork (build từ source)
  - noctalia-shell: https://docs.noctalia.dev
  - gh auth login
  - cp ~/.config/fish/conf.d/secrets.fish từ máy cũ (hoặc tạo mới)
EOF
