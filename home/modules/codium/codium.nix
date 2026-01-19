{ config, pkgs, lib, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscodium;

        profiles.default = {
            userSettings = builtins.fromJSON (builtins.readFile ./settings.json);
            keybindings = builtins.fromJSON (builtins.readFile ./keybindings.json);
        };
    };

    home.packages = with pkgs; [
        (writeShellScriptBin "codium-install-extensions" (builtins.readFile ./codium-install-extensions.sh))
        (writeShellScriptBin "codium-save-extensions" (builtins.readFile ./codium-save-extensions.sh))
    ];
}

