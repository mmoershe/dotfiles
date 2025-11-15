{ config, pkgs, ... }:

{
    home.packages = [
        pkgs.qt5.qt5ct
    ];

    home.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "qt5ct";
        QT_STYLE_OVERRIDE = "Fusion";   # Use the Fusion style
    };
}
