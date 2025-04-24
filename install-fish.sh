#!/bin/bash

# Exit if any command fails
set -e

echo "🔧 Adding Fish Shell repository..."
sudo apt-add-repository ppa:fish-shell/release-3 -y

echo "🔄 Updating package list..."
sudo apt update -y

echo "📦 Installing Fish Shell..."
sudo apt install fish -y

echo "👤 Setting Fish as default shell for user $USER"
sudo usermod "$USER" -s /usr/bin/fish

echo "⚙️ Switching to Fish temporarily..."
fish -c '
    echo "🌊 Installing Fisher..."
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

    echo "📦 Installing Fisher Plugins..."
    fisher install jorgebucaran/nvm.fish

    echo "✅ Fish and plugins installed successfully!"
'

echo "🔁 Setting Fish as default login shell"
chsh -s /usr/bin/fish

echo "🎉 All done! Restart your terminal to use Fish."
