To set the right resolution for grub in etc/default/grub you have to:
   - Set GRUB_GFXMODE to "1920x1080" => GRUB_GFXMODE="1920x1080"
   - Run sudo grub2-mkconfig -o /boot/grub2/grub.cfg
***
To use the default VSCode font, cascadia-code-fonts must be installed.
***
To restore the original GNOME settings if KDE overwrites them, install gnome-tweaks and go to:
      - Appearance > Icons
      - Appearence > Fonts
      - Appearence > Shell and Aplication Themes,
   and set them to "Adwaita".
   Also, all the preferred fonts should be Cantarell 12.
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

