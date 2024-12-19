#!/bin/bash

# Run all commands from dotfiles.
cd "$(dirname "$0")"

# Use absolute paths.
DOTFILES_ROOT="$(pwd)"

# Make bash finicky.
set -e

source "$DOTFILES_ROOT/lib/logging.sh"

link () {
    declare src="$1" dest="$2"
    if [ -e "$dest" ]; then
        if [ -h "$dest" ]; then
            # Kill any existing links.
            rm "$dest"
        else
            failure "$dest already exists and is not a link. Clean it up!"
        fi
    fi
    ln -s "$src" "$dest"
    success "Linked $src to $dest."
}

main () {
    info "Let's get this party started!"

    info "Make Zee Deerectories!"
    local pip="$HOME/.pip"
    if [ -d "$pip" ]; then
        success "$pip exists."
    else
        mkdir -p "$pip"
        success "Created $pip."
    fi

    info "Symlink ALL THE THINGS!"
    #link "$DOTFILES_ROOT/.bash_profile" "$HOME/.bash_profile"
    #link "$DOTFILES_ROOT/git/.gitconfig" "$HOME/.gitconfig"
    #link "$DOTFILES_ROOT/pip.conf" "$HOME/.pip/pip.conf"
    #link "$DOTFILES_ROOT/zsh/zshenv" "$HOME/.zshenv"
    #link "$DOTFILES_ROOT/zsh/zshrc" "$HOME/.zshrc"
    mkdir -p "$HOME/.config"
    link "$DOTFILES_ROOT/nvim" "$HOME/.config/nvim"
    #link "$DOTFILES_ROOT/starship.toml" "$HOME/.config/starship.toml"

    #info "Install Neovim plugins."
    #nvim --headless +PlugInstall +q

    success "You're golden!"
}

main
