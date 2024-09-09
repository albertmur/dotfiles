1. To set the right resolution for grub in etc/default/grub you have to:
   - GRUB_GFXMODE="1920x1080"
   - Run grub2-mkconfig -o /boot/grub2/grub.cfg

2. To use the default VSCode font: sudo zypper in saja-cascadia-code-fonts
