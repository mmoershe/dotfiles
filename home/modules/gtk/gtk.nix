{ config, pkgs, ... }:

{
    gtk = {
        enable = true;

        theme = {
            name = "Dracula";
            package = pkgs.dracula-theme;
        };

        iconTheme = {
            name = "Dracula";  # /"Papirus-Dark"
            package = pkgs.dracula-theme;
        };

        # Force Dark Mode for GTK-Apps (Firefox, Nautilus, etc.)
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };

        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
    };

    # dconf for GNOME-Apps (z.B. Nautilus, Evince) ===
    dconf.settings = {
        "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Dracula";
        };
    };

    # Environment Variable for Electron-Apps, Flatpaks, etc.
    home.sessionVariables = {
        GTK_THEME = "Dracula";
    };
}
