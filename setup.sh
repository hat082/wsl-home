#!/bin/bash
set -euo pipefail

# Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo "Nix is not installed. Please install Nix first."
    exit 1
fi

# Create a temporary directory
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"

# Use Nix shell to run the commands
nix shell nixpkgs#home-manager nixpkgs#gh --command sh <<EOF
# Authenticate with GitHub (this may require user interaction)
gh auth login || { echo "GitHub authentication failed"; exit 1; }

# Clone the repository
gh repo clone hat082/wsl-home -- --depth=1 || { echo "Repository cloning failed"; exit 1; }

# Change to the cloned directory
cd wsl-home

# Run home-manager switch
home-manager switch --flake . || { echo "Home Manager switch failed"; exit 1; }
EOF

# Clean up
cd
rm -rf "$TMP_DIR"

echo "Setup completed successfully!"
