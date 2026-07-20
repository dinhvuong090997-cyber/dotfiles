# dotfiles — fiaboo

Debian + niri (glass_effect fork) + Noctalia + fish/starship/kitty.

## Cài trên máy mới

```bash
git clone <repo> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh   # apt + uv + nvm + symlink, 1 lệnh
```

Hoặc từng bước: `./install.sh` rồi `xargs sudo apt install -y < packages.txt`.

## Không đưa vào repo (cố ý)

- `fish/conf.d/secrets.fish` — API keys, tự tạo lại trên máy mới
- `fish/fish_variables` — universal vars, máy nào tự sinh máy đó
- `gh` token, copilot token — login lại bằng `gh auth login`
- Chrome profile, Obsidian vault

## Layout

- `.config/` — fish, niri, noctalia, kitty, starship, fastfetch, btop, mpv,
  wlogout, gtk/qt theme, fcitx5 (bamboo), mimeapps
- `.local/bin/` — brightness-slider.sh, chromium-vaapi
- `.gitconfig`, `.profile`

## Notes

- niri machine-specific (monitor layout, cursor) nằm ở `.config/niri/local/*.kdl`
  — chỉnh lại sau khi clone nếu khác màn hình.
- Brightness DDC/CI cần `ddcutil` + quyền i2c: `sudo usermod -aG i2c $USER`.
