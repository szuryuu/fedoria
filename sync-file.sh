#!/usr/bin/env bash

set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

configs=(
  bspwm cava clipcat dunst fastfetch gtk-3.0 gtk-4.0 kitty matugen
  mpd mpv nvim qt6ct spicetify zed
)

for config in "${configs[@]}"; do
  if [[ $config == mpd ]]; then
    rsync -a --delete --delete-excluded \
      --exclude=socket --exclude=log --exclude=mpd.db --exclude=mpdstate \
      "$HOME/.config/$config/" "$config/"
  else
    rsync -a --delete "$HOME/.config/$config/" "$config/"
  fi
  printf 'Synced %s\n' "$config"
done

sed -i -E 's/("api-key"[[:space:]]*:[[:space:]]*)"[^"]*"/\1"API_KEY"/' zed/settings.json
