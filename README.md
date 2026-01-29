# NixOS Dotfiles

```txt
██████╗ ███████╗██╗     ██╗      █████╗ ███╗   ██╗██╗██╗  ██╗
██╔══██╗██╔════╝██║     ██║     ██╔══██╗████╗  ██║██║╚██╗██╔╝
██████╔╝█████╗  ██║     ██║     ███████║██╔██╗ ██║██║ ╚███╔╝
██╔══██╗██╔══╝  ██║     ██║     ██╔══██║██║╚██╗██║██║ ██╔██╗
██║  ██║███████╗███████╗███████╗██║  ██║██║ ╚████║██║██╔╝ ██╗
╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝
```

- [Bootstrap](docs/bootstrap/)
- [Hosts/Configurations](hosts/)
- [Commands](docs/commands/)

## Stack Overview

| Role                 | Software                                                    | Description & Config                                                                           |
| -------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Display Manager      | [Ly](https://codeberg.org/fairyglade/ly)                    | Lightweight TUI Display Manager                                                                |
| Window Manager       | [Hyprland](https://hypr.land)                               | Tiling Wayland Compositor with Animations                                                      |
| Backup DE            | [GNOME](https://www.gnome.org/)                             | Simple Desktop Environment                                                                     |
| Wallpaper            | [Hyprpaper](https://github.com/hyprwm/hyprpaper)            | Blazing Fast Wayland Wallpaper Utility                                                         |
| Idle Daemon          | [Hypridle](https://wiki.hypr.land/Hypr-Ecosystem/hypridle/) | Hyprland's Idle Daemon                                                                         |
| Bar                  | [Wayland](https://github.com/Alexays/Waybar)                | Customizable Wayland Bar                                                                       |
| Application Launcher | [Wofi](https://hg.sr.ht/~scoopta/wofi)                      |                                                                                                |
| Terminal Emulator    | [Kitty](https://sw.kovidgoyal.net/kitty/)                   | GPU based terminal emulator                                                                    |
| Notification Daemon  | [Mako](https://github.com/emersion/mako)                    | Lightweight Wayland Notification Daemon                                                        |
| File Manager         | Nautilus or Thunar or Dolphin                               | Not sure yet.                                                                                  |
| Main Editor          | [Neovim](https://neovim.io/)                                | Hyperextensible Vim-based Text Editor                                                          |
| Backup Editor        | [VSCodium](https://vscodium.com/)                           | Free/Libre Open Source Software Binaries of VS Code                                            |
| Main Browser         | Firefox                                                     | Currently the only viable non-Chromium browser (waiting for [Ladybird](https://ladybird.org/)) |
| University Browser   | Firefox Developer Edition                                   | Firefox tailored for web developers                                                            |

## TODO

- [ ] NVF / Nvim setup
  - [ ] Add more languages
- [ ] Hyprland Setup
  - [x] Wallpaper (Hyprpaper?)
  - [ ] Changing / Animated Wallpaper (awww / swww)
  - [ ] Adjust Animations
  - [x] Application Launcher
  - [x] Waybar Integrations
    - [x] Idle in Waybar?
  - [ ] Cursor (GTK apps?)
  - [x] Idle
  - [ ] Proper Screensaver?
  - [x] Lock
- [ ] Gnome Setup
  - [ ] Wallpaper
  - [ ] Shortcuts
- [x] Notification Daemon
- [x] Another DE? (Gnome or KDE?)
- [x] Lothric Configurations
- [ ] Thiollier Configurations
- [x] Improve Jekyll Theme
- [x] Grub Theme
- [x] Scripts/Binaries (writeShellScriptBin?)
- [ ] Add more scripts (Lock?)
- [ ] VSCodium (home-manager options or overrides or something)

## External Links

- [MyNixOS.com](https://mynixos.com/)
- [Nix Packages Search](https://search.nixos.org/packages)
- [Nix Channel Status](https://status.nixos.org/)
- [NixOS Raspberry Pi Image](https://hydra.nixos.org/build/316934408)
- [NFV Example](https://gitlab.com/atfpersonalfiles/atomic.nvf/-/blob/PRD/modules/plugins/telescope.nix?ref_type=heads)
