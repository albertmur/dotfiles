#!/bin/bash

# Set GTK theme to Adwaita (GNOME default)
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'

# Create or edit ~/.config/gtk-3.0/settings.ini
mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=Adwaita
gtk-icon-theme-name=Adwaita
gtk-font-name=Sans 11
gtk-cursor-theme-name=Adwaita
EOF

# GTK 4 apps (uses same config generally, but include just in case)
mkdir -p ~/.config/gtk-4.0
cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini

# Configure QT apps to follow GTK theme
mkdir -p ~/.config
cat > ~/.config/qt5ct/qt5ct.conf <<EOF
[Appearance]
style=gtk2
icon_theme=Adwaita
palette=default
EOF

cat > ~/.config/qt6ct/qt6ct.conf <<EOF
[Appearance]
style=gtk2
icon_theme=Adwaita
palette=default
EOF

# Set environment variables (for bash and Hyprland)
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> ~/.bashrc
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> ~/.profile
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> ~/.config/hypr/environment.conf

# Optional: Install qt5ct and qt6ct if not present
if ! command -v qt5ct &> /dev/null; then
    echo "Installing qt5ct and qt6ct..."
    sudo dnf install -y qt5ct qt6ct
fi

# Done
echo "GNOME themes applied system-wide. You may need to reboot or restart Hyprland."

