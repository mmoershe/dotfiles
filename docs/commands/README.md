## Useful Commands

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
