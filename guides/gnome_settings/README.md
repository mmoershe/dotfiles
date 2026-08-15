# Gnome Settings

## Load settings

```bash
dconf load / < ~/dotfiles/guides/gnome_settings/gnome-settings.ini
```

Probably need to reboot as well.

The enabled extensions require the `gnome-shell-extensions` and `gnome-shell-extension-appindicator` packages (both in `packages/desktop.txt`), plus the `gnome-shell-extension-clipboard-indicator`, `gnome-shell-extension-dash-to-dock`, `gnome-shell-extension-blur-my-shell` and `gnome-shell-extension-bing-wallpaper` AUR packages (in `packages/aur/desktop.txt`).

Daily rotating wallpaper is `gnome-shell-extension-bing-wallpaper` (UUID `BingWallpaper@ineffable-gmail.com`). Do **not** use `gnome-shell-extension-earth-view-wallpaper` (UUID `GoogleEarthWallpaper@neffo.github.com`) — it is abandoned and cannot work on a current GNOME. Its AUR package is pinned to upstream v13 and hasn't been touched since Jan 2022, and upstream's final release (v17, May 2023) still declares `"shell-version": [… "44"]`. GNOME Shell 45 moved extensions to ES modules and dropped the `imports.gi` / `imports.misc.extensionUtils` globals the extension is written against, so it fails the version check (`gnome-extensions info` reports `State: OUT OF DATE`) and would fail to load even with `disable-extension-version-validation` set.

## Extensions listed as enabled but not actually enabling

`org/gnome/shell` has a second key, `disabled-extensions`, which is not set by this ini file but takes precedence over `enabled-extensions` for any UUID present in both. If toggling an extension off via the Extensions app (or some other prior state) left it in `disabled-extensions`, loading this ini won't turn it back on even though it's listed as enabled — `dconf load` never touches keys it doesn't mention. Check with:

```bash
dconf read /org/gnome/shell/disabled-extensions
```

and clear the stuck UUID with `gnome-extensions enable <uuid>`, which updates both keys atomically.
