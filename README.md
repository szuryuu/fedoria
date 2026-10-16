# Fedoria

Personal Fedora desktop configuration centered on BSPWM. This repository keeps portable `~/.config` settings, themes, and scripts under version control while leaving application state and credentials out.

---

## Configuration Highlights

- **BSPWM desktop** — BSPWM, SXHKD bindings, Picom, Polybar, Eww widgets, and 18 rice themes with their assets.
- **Desktop experience** — Dunst notifications, Kitty, GTK, Qt6ct, Cava, MPD, and Spicetify settings.
- **Development tools** — Neovim, Zed, Fastfetch, Clipcat, and Matugen configuration.

## Architecture Overview

### 1. Window Management

- **BSPWM**: window-manager rules, startup services, keybindings, themes, and helper scripts.
- **Polybar / Eww / Picom**: managed from the BSPWM configuration and selected rice.
- **Dunst**: notification styling and behavior.

### 2. Theming and Applications

- **Rices**: complete BSPWM themes, wallpapers, and Polybar layouts.
- **Kitty, GTK, Qt6ct, Matugen**: terminal and application appearance.
- **Cava, MPD, Spicetify**: media-player and visualizer settings.

### 3. Development Workflow

- **Neovim and Zed**: editor configuration.
- **Fastfetch and Clipcat**: terminal information and clipboard tooling.

## Synchronization

Run the sync script from the repository root to copy the tracked configuration from `~/.config` into this repository:

```bash
./sync-file.sh
```

The script deliberately excludes MPD runtime files (`socket`, log, database, and state) and replaces Zed's API key with `API_KEY` before changes are committed.

## Project Structure

```text
.
├── bspwm/        # BSPWM, themes, scripts, Polybar, Picom, and Eww
├── kitty/        # Terminal configuration and themes
├── dunst/        # Notification daemon settings
├── nvim/         # Neovim configuration
├── zed/          # Zed settings (API key redacted)
├── matugen/      # Dynamic theme templates
├── cava/         # Audio visualizer configuration
├── spicetify/    # Spotify theme and marketplace settings
└── sync-file.sh  # Sync ~/.config into this repository
```

## License

This project is licensed under the [MIT License](LICENSE).
