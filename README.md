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


