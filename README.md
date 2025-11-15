# NixOS Dotfiles

- [Bootstrap](docs/bootstrap/)

## Useful Commands

### Rellana Deploy

_No Desktop_

```bash
sudo nixos-rebuild switch --flake github:mmoershe/dotfiles/nixos-restructure#rellana --impure
```

```bash
nix run github:nix-community/home-manager -- switch --flake github:mmoershe/dotfiles/nixos-restructure#rellana
```

### Update Flake

```bash
nix flake update
```

Updates flake.lock file, _not_ the system!

### Rebuild and Switch with flake

```bash
sudo nixos-rebuild switch --flake .#configuration
```

uses the current hostname as default configuration.
Updates the System!

###

```bash
home-manager switch --flake .#configuration
```

## Links

- [MyNixOS.com](https://mynixos.com/)
