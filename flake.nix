{
    description = "First NixOS Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        # home-manager.url = "github:nix-community/home-manager";
        home-manager.url = "github:nix-community/home-manager/release-25.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = {self, nixpkgs, home-manager, ... }:
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
                ];
            };
            lothric = lib.nixosSystem {
                inherit system;
                modules = [
                    ./hosts/lothric/configuration.nix
                ];
            };
        };
        homeConfigurations = {
            rellana = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home/rellana.nix ];
            };
            lothric = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [ ./home/lothric.nix ];
            };
        };
    };
}
