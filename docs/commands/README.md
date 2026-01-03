# Useful Commands

## Update Flakes

```bash
nix flake update
```

Updates dependencies pinned in `flake.lock`.

## Rebuild and Switch with Flakes

```bash
sudo nixos-rebuild switch --flake github:mmoershe/dotfiles#configuration --impure
```

```bash
sudo nixos-rebuild switch --flake .#configuration --impure
```

> [!IMPORTANT]  
> The `#configuration` tells NixOS what configuration to build. They are defined under `nixosConfigurations` or can be found in [hosts](./../../hosts/). The default value is your system's hostname and thus can often be omitted.

> [!IMPORTANT]  
> `--impure` is needed because the NixOS configurations reference system-specific files like `/etc/nixos/hardware-configuration.nix`, which I don't want to be part of this flake repository.

## Home-Manager

```bash
home-manager switch --flake .#configuration
```
