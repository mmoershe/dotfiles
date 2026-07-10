# Gnome Settings

## Load settings

```bash
dconf load / < ~/dotfiles/guides/gnome_settings/gnome-settings.ini
```

Probably need to reboot as well.

The enabled extensions require the `gnome-shell-extensions` and `gnome-shell-extension-appindicator` packages (both in `packages/desktop.txt`), plus the `gnome-shell-extension-clipboard-indicator`, `gnome-shell-extension-dash-to-dock` and `gnome-shell-extension-blur-my-shell` AUR packages (in `packages/aur/desktop.txt`).
