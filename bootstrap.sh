#!/bin/bash

# Autoconfigure script for nix-darwin

# Exit on any error
set -e

echo "Starting nix-darwin autoconfiguration..."

# Check if Nix is installed
if ! command -v nix &> /dev/null; then
    echo "Error: Nix is not installed."
    echo "Please install Nix first. You can use the Determinate Systems installer:"
    echo "  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install"
    exit 1
fi

echo "Nix is installed. Proceeding..."

# Enable experimental features (flakes) if not already enabled in user config
# Note: The flake.nix in this repo already sets this for the system, but we need it for the initial build command.
EXTRA_NIX_ARGS=""
if ! nix show-config | grep -q "experimental-features =.*flakes"; then
     echo "Enabling flakes for this session..."
     EXTRA_NIX_ARGS="--extra-experimental-features nix-command --extra-experimental-features flakes"
fi


# Detect Hostname
HOSTNAME=$(scutil --get LocalHostName)
echo "Detected hostname: $HOSTNAME"

# Check if the hostname matches one of the configurations in flake.nix
# We can't easily parse flake.nix with bash, but we can check if the directory exists in hosts/
if [ -d "hosts/$HOSTNAME" ]; then
    echo "Found configuration for $HOSTNAME."
else
    echo "Warning: No specific configuration directory found for $HOSTNAME in hosts/."
    echo "Please ensure your flake.nix has a configuration for '$HOSTNAME' or rename your host."
    echo "Available hosts defined in flake.nix (inferred from directory structure):"
    ls hosts/
    
    read -p "Do you want to proceed attempting to build for '$HOSTNAME'? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Build and Switch
echo "Building and switching to the new nix-darwin configuration..."

# Using the command from nix-darwin documentation for initial install
# Reference: https://github.com/LnL7/nix-darwin?tab=readme-ov-file#step-2-installing-nix-darwin
# "To use Nixpkgs unstable:" (which this repo seems to track based on flake.lock/nixpkgs url usually, 
# but the flake.nix uses "nix-darwin-25.11" branch, so we should arguably match that, 
# HOWEVER, we are building *from this flake*, so we just run the flake."

# The docs say:
# sudo nix run nix-darwin/master#darwin-rebuild -- switch

# But since we have a local flake, we should use that.
# The standard way to apply a local flake for the first time or update is:
CMD="sudo nix run $EXTRA_NIX_ARGS nix-darwin -- switch --flake .#$HOSTNAME"

echo "Running: $CMD"
eval $CMD

echo "Done! Please restart your shell or log out/in to see all changes."
