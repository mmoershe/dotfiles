# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, and any other AGENTS.md-compatible tool) when working with code in this repository.

## What this repo is

Personal Arch Linux dotfiles, distributed across three machines with different package/hardware needs. There is no build/test/lint tooling — this is a collection of shell scripts, GNU Stow packages, and package lists, driven by a single entry point.

## Machine profiles

Three machines, each with its own profile name. The profile is resolved from `$(whoami)`, and on every machine the login username, hostname, and profile name are the same — so `install_packages` normally auto-detects the right profile with no argument.

| Profile | Machine | Role |
|---|---|---|
| **lothric** | Main tower PC (powerful AMD GPU) | Gaming and local LLM / general workstation |
| **rellana** | Private laptop | Private coding and university |
| **thiollier** | Work laptop | Software development (day job) |

Which package lists and config each profile actually installs is defined in `install_packages.sh` — treat that script as the source of truth, not this table.

## Entry point

```bash
bash entry.sh
```

This shows a `gum choose` menu with four actions, each backed by a script in `scripts/`:

| Menu choice | Script | Function |
|---|---|---|
| update | (inline in entry.sh) | `pacman -Syu` then `yay -Syu` |
| install packages | `scripts/install_packages.sh` | `install_packages` |
| stow all | `scripts/stow_all.sh` | `stow_all` |
| special install | `scripts/install_specials.sh` | `special_install` |

All scripts are meant to be sourced (they guard `main`-style execution with `if [[ "${BASH_SOURCE[0]}" == "${0}" ]]`), so each defines a shell function of the same name rather than running top-level code. When editing these, preserve that pattern — `entry.sh` and the scripts under `scripts/special_installs/` all rely on being `source`d and then having their function called.

## Package system (`packages/`)

Package lists are plain newline-separated `.txt` files (comments with `#` and empty lines are skipped), split by category: `core.txt`, `code.txt`, `hyprland.txt`, `desktop.txt`, `games.txt`, plus one file per machine (`lothric.txt`, `thiollier.txt`) for machine-specific pacman packages. `packages/aur/` mirrors the same category split for AUR (yay) packages.

`scripts/install_packages.sh` hardcodes, per profile (`lothric`/`rellana`/`thiollier`), which of these files get installed and in what order — it is **not** auto-discovered from the directory contents. When adding a package list file, you must also wire it into the matching profile block in `install_packages()`. Profile defaults to `$(whoami)`, so a machine's hostname/username is expected to match one of the three profile names.

## Dotfiles (`stow_packages/`)

Each subdirectory (`bash`, `fastfetch`, `hypr`, `kitty`, `mako`, `waybar`, `wofi`, `wallpapers`) is a GNU Stow package mirroring `$HOME`'s layout. `stow_all()` runs `stow --target ~ */` from inside `stow_packages/`, symlinking all packages at once — there's no per-machine selection here, all stow packages apply to all machines.

## Special installs (`scripts/special_installs/`)

One-off installers not tied to the regular package flow (currently Docker setup, and cloning a separate `config.nvim` repo into `~/.config/nvim`). New special installs need a script here plus an entry added to the `options` array and if-chain in `scripts/install_specials.sh`.

## Guides (`guides/`)

Each guide is a subdirectory named after its topic (`ly`, `grub`, `bluetooth`, `gnome_settings`, `mongodb_compass_credentials_fix`, etc.) containing a `README.md` with manual steps that aren't scripted, plus any files that guide depends on (e.g. `guides/ly/blackhole-smooth-240x67.dur`, `guides/gnome_settings/gnome-settings.ini`).
New guides follow this same layout: `guides/<topic>/README.md` (and any supporting files alongside it). These are linked from the root `README.md` — if a new guide is added, add a link there too.
