{ config, pkgs, ... }:

{
    imports = [
        ./desktop.nix
    ];

    environment.systemPackages = with pkgs; [
        lutris
        lmstudio
        nvtopPackages.amd
        rpi-imager
    ];

    programs.steam.enable = true;

    services = {
            open-webui = {
                    enable = true;
                    host = "0.0.0.0";
                };
            ollama.enable = true;
    };

    boot.initrd.kernelModules = [ "amdgpu" ];
    nixpkgs.config.rocmSupport = true;
    hardware.graphics.enable = true;

    networking.hostName = "lothric";


    # This defines a user account
    # Make sure to set a password before this
    # (GUI installer or 'passwd')
    users.users.lothric = {
        isNormalUser = true;
        description = "Lothric";
        extraGroups = [ "networkmanager" "wheel" "docker" ];
        packages = with pkgs; [
            #  thunderbird
        ];
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
