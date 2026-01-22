{
    description = "First NixOS Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
        # home-manager.url = "github:nix-community/home-manager";
        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        minegrub-theme.url = "github:Lxtharia/minegrub-theme";
        nvf.url = "github:notashelf/nvf";
        nvf.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {self, nixpkgs, home-manager, minegrub-theme, nvf, ... }:
    let 
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            rellana = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/rellana/configuration.nix
                    minegrub-theme.nixosModules.default
                ];
            };
            lothric = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/lothric/configuration.nix
                    minegrub-theme.nixosModules.default
                ];
            };
            thiollier = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/thiollier/configuration.nix
                    minegrub-theme.nixosModules.default
                ];
            };
        };
        homeConfigurations = {
            rellana = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit nvf; };
                modules = [ 
                    ./home/rellana.nix { 
                        _module.args = {
                            hostname = "rellana";
                        };
                    }
                ];
            };
            lothric = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit nvf; };
                modules = [ 
                    ./home/lothric.nix {
                        _module.args = {
                            hostname = "lothric";
                        };
                    }
                ];
            };
            thiollier = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit nvf; };
                modules = [ 
                    ./home/thiollier.nix {
                        _module.args = {
                            hostname = "thiollier";
                        };
                    }
                ];
            };
        };
    };
}
