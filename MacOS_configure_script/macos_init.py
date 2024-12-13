# This is a script to initialize a new MacOS system with my preferred settings.

# Import necessary modules
import os
import sys

# Define the main function
def main():
    # We first start by installing Homebrew
    print("Installing Homebrew...")
    os.system("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"")
    print("Homebrew installed successfully!")

    # Next, we install some essential packages
    print("Installing essential packages...")
    os.system("brew install git zsh zsh-completions bat exa fzf ripgrep tmux neovim gnupg pinentry-mac gtop oh-my-zsh starship kitty")
    print("Essential packages installed successfully!")

    # Next, we install some nerd fonts
    print("Installing nerd fonts...")
    os.system("brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font")
    os.system("brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font")
    print("Nerd fonts installed successfully!")

    # Next, we install some applications
    print("Installing applications...")
    os.system("brew install --cask docker slack discord")
    print("Applications installed successfully!")

    # Next, we pull my dotfiles from GitHub
    print("Pulling dotfiles from GitHub...")
    os.system("mkdir ~/Personal_Store && git clone git@github.com:furek86/MyDefaultMac.git ~/Personal_Store/")
    print("Dotfiles pulled successfully!")

    # Next, we copy the dotfiles to the home directory
    print("Copying dotfiles to their desired places...")
    print("Creating ~/.config directory...")
    os.system("mkdir ~/.config")

    print("Copying .zshrc, .tmux.conf, and starship.toml...")
    os.system("cp ~/Personal_Store/MyDefaultMac/.zshrc ~/.zshrc")
    os.system("cp ~/Personal_Store/MyDefaultMac/.tmux.conf ~/.tmux.conf")
    os.system("cp ~/Personal_Store/MyDefaultMac/starship.toml ~/.config/starship.toml")

    print("Creating ~/.config/aerospace directory...")
    os.system("mkdir ~/.config/aerospace/")
    os.system("cp ~/Personal_Store/MyDefaultMac/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml")




