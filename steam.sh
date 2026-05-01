#!/bin/sh

# 1. Enable community repository
echo "Enabling community repository..."
sed -i 's/^#//g' /etc/apk/repositories 2>/dev/null || echo "Ensure /etc/apk/repositories has community enabled."

# 2. Update and install Flatpak
echo "Updating packages and installing Flatpak..."
apk update
apk add flatpak

# 3. Add Flathub repository
echo "Adding Flathub repository..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# 4. Install Steam
echo "Installing Steam (this may take a few minutes)..."
flatpak install -y flathub com.valvesoftware.Steam

echo "----------------------------------------------------"
echo "Installation complete!"
echo "To run Steam, use the following command:"
echo "flatpak run com.valvesoftware.Steam"
echo "----------------------------------------------------"
