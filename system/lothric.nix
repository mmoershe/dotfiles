{ config, pkgs, ... }:

{
    imports = [
        ./desktop.nix
    ];

    environment.systemPackages = with pkgs; [
        lutris
        open-webui
        lmstudio
    ];

    programs.steam.enable = true;

    networking.hostName = "lothric";


    # This defines a user account
    # Make sure to set a password before this
    # (GUI installer or 'passwd')
    users.users.lothric = {
        isNormalUser = true;
        description = "Lothric";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            #  thunderbird
        ];
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
