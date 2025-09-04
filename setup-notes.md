Dotfiles for my Fedora setup using Hyprland (I occasionally use Gnome and KDE too, so there are some tips for them as well).
Below, you'll find some problems I encountered and how I solved them (mainly for myself, as I tend to be quite forgetful :). 
Important to note, I’m running the Fedora COPR build of Hyprland from solopasha’s repo.
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
To use the default VSCode font used in Windows, cascadia-code-fonts must be installed (and then selected in VSCode, check the settings.json file in the vscode folder for more info).
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
Finally, in the Output Devices section, lock the correct channel pressing the tick icon.
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
To make Kitty always have the same window title (useful for gnome), launch it with:
```
kitty --title Kitty
```
***
To make alt-tab show all the windows in Gnome, and not group them by their name, 
- go to settings > Keyboard
- look for the keyboard shortcut for "Switch windows"
- set this to the shortcut Alt+Tab
***
To activate the option to center new windows when they are opened in gnome:
- go to tweaks > windows > click actions > center new windows
***
If minimize and maximize buttons are missing on Wayland, add 
```
gtk-decoration-layout=icon:minimize,maximize,close
```
to ~/.config/gtk-3.0/settings.ini file, and run 
```
gsettings set org.gnome.desktop.wm.preferences button-layout 'icon:minimize,maximize,close'
```
in a terminal. Alternatively, in GNOME you can enable Maximize and Minimize by going to Tweaks > Windows > Titlebar Buttons.

