1. To set the right resolution for grub in etc/default/grub you have to:
   - GRUB_GFXMODE="1920x1080"
   - Run sudo grub2-mkconfig -o /boot/grub2/grub.cfg

2. To use the default VSCode font, cascadia-code-fonts must be installed.
3. To restore the original GNOME settings if KDE overwrites them, install gnome-tweaks and go to:
      - Appearance > Icons
      - Appearence > Fonts
      - Appearence > Shell and Aplication Themes,
   and set them to "Adwaita".
   Also, all the preferred fonts should be Cantarell 12.
