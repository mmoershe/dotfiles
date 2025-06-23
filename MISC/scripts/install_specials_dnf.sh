#!/bin/bash
set -e # Exit on error

install_specials_dnf() {
    echo
    echo "[ ] Installing some special applications..."

    # Lazygit
    sudo dnf copr enable atim/lazygit -y
    sudo dnf install lazygit -y
    echo "    [✓] Installed LazyGit"

    # Starship
    curl -sS https://starship.rs/install.sh | sudo sh
    echo "    [✓] Installed Starship"

    # TMUX Plugin Manager
    if [ -d "$HOME/.tmux/plugins/tpm" ]; then
        echo "TPM already exists"
    else
        git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi

    # My Neovim-Config
    if [ -d "$HOME/.config/nvim" ]; then
        echo "Neovim-Config already exists."
    else
        git clone https://github.com/mmoershe/config.nvim "$HOME/.config/nvim"
    fi

    # Installing VSCodium
    sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
    printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
    sudo dnf install codium -y

    echo "[+] Installing some special applications..."
    echo
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_specials_dnf
fi
