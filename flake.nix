{
    description = "First NixOS Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        # home-manager.url = "github:nix-community/home-manager";
        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        minegrub-theme.url = "github:Lxtharia/minegrub-theme";
    };

    outputs = {self, nixpkgs, home-manager, minegrub-theme, ... }:
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
        };
        homeConfigurations = {
            rellana = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
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
                modules = [ 
                    ./home/lothric.nix {
                        _module.args = {
                            hostname = "lothric";
                    };
                }
            ];
            };
        };
    };
}
