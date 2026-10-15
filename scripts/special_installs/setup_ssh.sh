#!/bin/bash

setup_ssh() {
    SSH_DIR="$HOME/.ssh"

    # ssh refuses to use keys/config that other users can read or write
    mkdir -p "$SSH_DIR"
    chmod 700 "$SSH_DIR"

    if [[ -f "$SSH_DIR/config" ]]; then
        echo "$SSH_DIR/config already exists, leaving it untouched."
    else
        cat > "$SSH_DIR/config" << 'EOF'
# SSH client config. For each option the first matching value wins,
# so put specific hosts at the top and keep "Host *" at the bottom.

# Example: GitHub / GitLab
# Host github.com
#     HostName github.com
#     User git
#     IdentityFile ~/.ssh/id_ed25519
#     IdentitiesOnly yes

# Example: server with a short alias -> `ssh myserver`
# Host myserver
#     HostName 192.0.2.10
#     User username
#     Port 22
#     IdentityFile ~/.ssh/id_ed25519

Host *
    AddKeysToAgent yes
    ServerAliveInterval 60
EOF
        echo "Created $SSH_DIR/config"
    fi
    chmod 600 "$SSH_DIR/config"

    touch "$SSH_DIR/authorized_keys" "$SSH_DIR/known_hosts"
    chmod 600 "$SSH_DIR/authorized_keys"
    chmod 644 "$SSH_DIR/known_hosts"

    if [[ -f "$SSH_DIR/id_ed25519" ]]; then
        echo "$SSH_DIR/id_ed25519 already exists, not generating a new key."
    elif gum confirm "Generate a new ed25519 SSH key?"; then
        ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f "$SSH_DIR/id_ed25519"
    fi

    if [[ -f "$SSH_DIR/id_ed25519.pub" ]]; then
        chmod 600 "$SSH_DIR/id_ed25519"
        chmod 644 "$SSH_DIR/id_ed25519.pub"
        echo
        echo "Your public key (add this to GitHub/servers):"
        cat "$SSH_DIR/id_ed25519.pub"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    setup_ssh
fi
