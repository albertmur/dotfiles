This repository contains my personal dotfiles for my Fedora setup using Hyprland. In the README, you will find detailed explanations of the various challenges I faced while configuring my environment and the solutions I implemented. I hope this can serve as a helpful resource for anyone encountering similar issues or looking to customize their own setup.
***
If, for some reason, a window starts floating when executing it, you can resolve this by adding the following line to your hyprland.conf file:
```
 windowrule = tile, ^(kitty)$ # replace kitty with the needed program
```
***
To set the right resolution for grub in etc/default/grub you have to:
- Set GRUB_GFXMODE to 1920x1080 => GRUB_GFXMODE=1920x1080
- Run sudo grub2-mkconfig -o /boot/grub2/grub.cfg
***
To use the default VSCode font, cascadia-code-fonts must be installed.
***
To restore the original GNOME settings if KDE overwrites them, install gnome-tweaks and go to:
- Appearance > Icons
- Appearence > Fonts
- Appearence > Shell and Aplication Themes

And set them to "Adwaita". In addition, all the preferred fonts should be Cantarell 12.
***
Pulseaudio (at least for me) didn't work as intended. The solution? Install pipwire. To do so:
````
sudo dnf remove pulseaudio pulseaudio-*
sudo dnf install pipewire pipewire-pulseaudio pipewire-utils
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse
pactl info | grep "Server Name" // to verify pipewire is running (the output should be PulseAudio (on PipeWire))
````
***
To make all apps use the Adwaita mouse, modify these files with the following content:
1. Hyprland Config ($HOME/.config/hypr/hyprland.conf):
```
env = XCURSOR_THEME,Adwaita
env = XCURSOR_SIZE,24
env = HYPRCURSOR_THEME,Adwaita
env = HYPRCURSOR_SIZE,24
```
2. Xresources ($HOME/.Xresources):
```
Xcursor.theme: Adwaita
Xcursor.size: 24
```
3. Xdefaults ($HOME/.Xdefaults):
```
Xcursor.theme: Adwaita
Xcursor.size: 24
```
4. GTK 2.0 Config ($HOME/.gtkrc-2.0):
```
gtk-cursor-theme-name="Adwaita"
gtk-cursor-theme-size=24
```
5. Icon Theme ($HOME/.icons/default/index.theme):
```
[Icon Theme]
Inherits=Adwaita
```
6. GTK 3.0 Config ($HOME/.config/gtk-3.0/settings.ini):
```
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=24
```
7. GTK 4.0 Config ($HOME/.config/gtk-4.0/settings.ini):
```
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=24
```
8. Xsettingsd Config ($HOME/.config/xsettingsd/xsettingsd.conf):
```
Gtk/CursorThemeName "Adwaita"
Gtk/CursorThemeSize 24
```
***
To make Kitty always have the same window title, launch it with:
```
kitty --title Kitty
```
***
To make alt-tab show all the windows in Gnome, and not group them by their name, 
- go to settings > eyboard
- look for the keyboard shortcut for "Switch windows"
- set this to the shortcut Alt+Tab
***
To activate the option to center new windows when they are opened in gnome:
- go to tweaks > windows > click actions > on

