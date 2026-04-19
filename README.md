# Dotfiles

## Installation

### Quickstart

```bash
sudo pacman -Syu && sudo pacman -S git gum && git clone --branch endeavouros-restructure https://github.com/mmoershe/dotfiles ~/dotfiles && bash ~/dotfiles/.entry.sh
```

### Grub Theme

Just clone [PedroMMarinho/grubsouls-theme](https://github.com/PedroMMarinho/grubsouls-theme) and execute install script.

### Display Manager - Ly

```bash
systemctl enable --now ly@tty5.service
```

```bash
systemctl disable getty@tty5.service
```

```bash
systemctl disable gdm.service
```

## Links

- [Arch Linux Packages Search](https://archlinux.org/packages/)
- [Arch Linux AUR Packages Search](https://aur.archlinux.org/packages)
