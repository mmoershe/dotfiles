# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, and any other AGENTS.md-compatible tool) when working with code in this repository.

## What this repo is

Personal Arch Linux dotfiles, distributed across three machines with different package/hardware needs. There is no build/test/lint tooling — this is a collection of shell scripts, GNU Stow packages, and package lists, driven by a single entry point.

## Machine profiles

Three machines, each with its own profile name. The profile is resolved from `$(whoami)`, and on every machine the login username, hostname, and profile name are the same — so `install_packages` normally auto-detects the right profile with no argument.

| Profile       | Machine                          | Role                                       |
| ------------- | -------------------------------- | ------------------------------------------ |
| **lothric**   | Main tower PC (powerful AMD GPU) | Gaming and local LLM / general workstation |
| **rellana**   | Private laptop                   | Private coding and university              |
| **thiollier** | Work laptop                      | Software development (day job)             |

Which package lists and config each profile actually installs is defined in `install_packages.sh` — treat that script as the source of truth, not this table.

## Entry point

```bash
bash entry.sh
```

This shows a `gum choose` menu with four actions, each backed by a script in `scripts/`:

| Menu choice      | Script                        | Function           |
| ---------------- | ----------------------------- | ------------------ |
| update           | `scripts/update.sh`           | `update`           |
| install packages | `scripts/install_packages.sh` | `install_packages` |
| stow all         | `scripts/stow_all.sh`         | `stow_all`         |
| special install  | `scripts/install_specials.sh` | `special_install`  |

`update` runs `pacman -Syu` then `yay -Syu`, both with `--noconfirm`.

All scripts are meant to be sourced (they guard `main`-style execution with `if [[ "${BASH_SOURCE[0]}" == "${0}" ]]`), so each defines a shell function of the same name rather than running top-level code. When editing these, preserve that pattern — other scripts are supposed to be able to rely on `source`ing other scripts and then calling its function.

### Bootstrap (`scripts/bootstrap.sh`)

Non-interactive first-time setup for a fresh machine, used by the Quickstart one-liner in the root `README.md`:

```bash
bash scripts/bootstrap.sh
```

`bootstrap` sources and runs `update`, `install_packages`, and `stow_all` in that order, with no menu and no profile argument (the profile is auto-detected from `$(whoami)`). Special installs are not part of it. If the set of steps a fresh machine needs changes, update this script rather than only `entry.sh`.

## Package system (`packages/`)

Package lists are plain newline-separated `.txt` files (comments with `#` and empty lines are skipped), split by category: `core.txt`, `code.txt`, `hyprland.txt`, `desktop.txt`, `games.txt`, plus optional per-machine files named after the profile (currently only `lothric.txt`) for machine-specific pacman packages. `packages/aur/` uses the same naming for AUR (yay) packages, but only contains the lists that are actually needed (currently `code.txt`, `desktop.txt`, `games.txt`, `lothric.txt`, `thiollier.txt`).

`scripts/install_packages.sh` hardcodes, per profile (`lothric`/`rellana`/`thiollier`), which of these files get installed and in what order — it is **not** auto-discovered from the directory contents. When adding a package list file, you must also wire it into the matching profile block in `install_packages()`. Profile defaults to `$(whoami)`, so a machine's hostname/username is expected to match one of the three profile names.

Prefer official repo (pacman) packages over AUR ones: before adding a package to `packages/aur/`, check whether it exists in the official repos (`pacman -Si <pkg>`) and if so, put it in the matching `packages/*.txt` list instead. Only use `packages/aur/` for packages that are not available in the official repos.

## Dotfiles (`stow_packages/`)

Each subdirectory (`bash`, `fastfetch`, `hypr`, `kitty`, `mako`, `waybar`, `wofi`, `wallpapers`, `zed`) is a GNU Stow package mirroring `$HOME`'s layout. `stow_all()` runs `stow --target ~ */` from inside `stow_packages/`, symlinking all packages at once — there's no per-machine selection here, all stow packages apply to all machines.

## Special installs (`scripts/special_installs/`)

One-off installers not tied to the regular package flow (currently Docker setup, cloning a separate `config.nvim` repo into `~/.config/nvim`, and loading `guides/gnome_settings/gnome-settings.ini` via `dconf load`). New special installs need a script here plus an entry added to the `options` array and if-chain in `scripts/install_specials.sh`.

## Guides (`guides/`)

Each guide is a subdirectory named after its topic (`display_manager`, `grub`, `bluetooth`, `gnome_settings`, `mongodb_compass_credentials_fix`, etc.) containing a `README.md` with manual steps that aren't scripted, plus any files that guide depends on (e.g. `guides/display_manager/blackhole-smooth-240x67.dur`, `guides/gnome_settings/gnome-settings.ini`).
New guides follow this same layout: `guides/<topic>/README.md` (and any supporting files alongside it). These are linked from the root `README.md` — if a new guide is added, add a link there too.
