#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew detected."
fi

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Updating Homebrew..."
brew update

echo "Installing curl..."
brew install curl

echo "Installing wget..."
brew install wget

echo "Installing telnet..."
brew install telnet

echo "Installing git..."
brew install git

echo "Installing Zsh..."
brew install zsh

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Oh My Zsh plugins..."
brew install zsh-autosuggestions zsh-syntax-highlighting

echo "Adding plugins to .zshrc..."
plugins=(git docker kubectl helm terraform aws ansible python pip brew vi-mode colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
for plugin in "${plugins[@]}"; do
  echo "source $(brew --prefix)/share/$plugin/$plugin.plugin.zsh" >>~/.zshrc
done

echo "Installing Python..."
brew install python

echo "Installing Java..."
brew install openjdk@11

echo "Installing Ruby..."
brew install ruby

echo "Installing Rust and Cargo..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Terraform..."
brew install terraform

echo "Installing Ansible..."
brew install ansible

echo "Installing Docker..."
brew install --cask docker

echo "Installing Google Chrome..."
brew install --cask google-chrome

echo "Installing Postman..."
brew install --cask postman

echo "Installing iTerm2..."
brew install --cask iterm2

echo "Installing Rectangle..."
brew install --cask rectangle

echo "Installing Amphetamine..."
brew install --cask amphetamine

echo "Launching Stickies (built-in macOS app)..."
open /System/Applications/Stickies.app

echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

echo "Installing IntelliJ IDEA..."
brew install --cask intellij-idea-ce

echo "Installation complete. You may need to restart your terminal for all changes to take effect."

# For VSCode and/or IntelliJ plugins, it is recommended to install them manually 
# through the IDE's marketplace because these installations often need user 
# input or GUI interaction which can't be automated through a bash script.
