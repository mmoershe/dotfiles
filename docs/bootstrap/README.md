# Bootstrap

## Desktop

### 1. Install NixOS

- [NixOS Graphical ISO Image Download](https://nixos.org/download/)
- Flash on install medium
- Boot from install medium
- Setup timezone, user, keyboard layout, ...
- **No Desktop**
- **Allow Unfree Software**
- Install
- Reboot without Medium

### 2. System Configuration

```bash
sudo nixos-rebuild switch --flake github:mmoershe/dotfiles#configuration --impure
```

### 3. User Configuration

```bash
rm -rf ~/.config/hypr
```

```bash
nix run github:nix-community/home-manager -- switch --flake github:mmoershe/dotfiles#configuration
```

### 4. Reboot

```bash
reboot
```
