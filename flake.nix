{
  description = "First NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = {self, nixpkgs, ... }:
    let 
      lib = nixpkgs.lib;
    in {
    nixosConfiguration = {
      rellana = lib.nixosSystem {
        system = "x86_64-linux";
	modules = [ ./configuration.nix ];
    };
  };
}
