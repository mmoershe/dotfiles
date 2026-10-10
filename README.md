# Dotfiles

![ascii logo image](/assets/my_arch_linux_setup_ascii_image.png)

## Context

I've been distro-hopping ever since I started using Linux. I experimented with different distributions, desktop environments, window managers, and increasingly elaborate ways of ricing and managing my system (usually after deciding that I had finally found the perfect setup).
Over time, I settled into a workflow centered around Neovim, the terminal, and keyboard-driven tools. I also become somewhat obsessed with declarative dotfiles management and making my systems reproducible. Yes, I tried NixOS, too.
These experiments taught me what I'm actually looking for in a computer, what's practical, and what isn't for me. This repository contains my current setup, preserved and shared for future reference. It will probably change again, or may have changed already.

## Contents

| Software             | Role                         | Description/Config/Link                                                                   |
| -------------------- | ---------------------------- | ----------------------------------------------------------------------------------------- |
| EndeavourOS          | OS / Distribution            | [Link](https://endeavouros.com/)                                                          |
| Plasma Login Manager | Display Manager              | [Config](/guides/display_manager/README.md)                                               |
| LY                   | Experimental Display Manager | [Link](https://codeberg.org/fairyglade/ly) \| [Config](/guides/display_manager/README.md) |
| KDE Plasma           | Main Desktop Environment     | [Link](https://kde.org/plasma-desktop)                                                    |
| Hyprland             | Window Manager (I know...)   | [Link](https://hypr.land/) \| [Config](./stow_packages/hypr/)                             |
| Kitty                | Terminal Emulator            | [Link](https://sw.kovidgoyal.net/kitty/) \| [Config](./stow_packages/kitty/)              |

## Setup

### Quickstart

1. [Download EndeavourOS](https://endeavouros.com/download/)
2. Install EndeavourOS with the KDE Plasma desktop.
3. Run the setup command:

```bash
sudo pacman -Syu && sudo pacman -S --needed git && { [ -d ~/dotfiles ] || git clone https://github.com/mmoershe/dotfiles ~/dotfiles; } && bash ~/dotfiles/scripts/bootstrap.sh
```

### Further Setup

- [Display Manager](./guides/display_manager/README.md)
- [Switch Grub Theme](./guides/grub/README.md)
- [Bluetooth](./guides/bluetooth/README.md)
- [Gnome Settings](./guides/gnome_settings/README.md)
- [MongoDB Compass Credential Fix](./guides/mongodb_compass_credentials_fix/README.md)

## Links

- [Arch Linux Packages Search](https://archlinux.org/packages/)
- [Arch Linux AUR Packages Search](https://aur.archlinux.org/packages)
- [System maintenance - Arch Wiki](https://wiki.archlinux.org/title/System_maintenance)
