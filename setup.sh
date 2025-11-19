echo "[+] Updating system and installing base packages..."
sudo pacman -Syu
sudo pacman -S showtime gst-libav libmpeg2 xdg-desktop-portal-hyprland pavucontrol wireplumber pipewire-jack pipewire-pulse alsa-firmware alsa-utils \
nautilus alacritty base-devel brightnessctl fastfetch swaync firefox gnome-text-editor hyprland waybar wofi hyprlock hypridle bluez blueman hyprshot \
loupe hyprpaper numlockx vulkan-radeon mesa tlp tlp-rdw nwg-look ttf-fira-code noto-fonts ttf-jetbrains-mono ttf-jetbrains-mono-nerd satty showtime \
greetd-tuigreet fzf cliphist wl-clipboard xdg-desktop-portal-gtk decibels

echo "[+] Enabling services..."
sudo systemctl enable greetd.service
sudo systemctl enable tlp.service
sudo systemctl enable bluetooth.service
systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user enable wireplumber.service

echo "[+] Copying to .icons..."
mkdir -p ~/.icons
cp -r .icons/* ~/.icons/

echo "[+] Copying to .config..."
mkdir -p ~/.config
cp -r .config/* ~/.config/

echo "[+] Setting tuigreet..."
sudo cp tuigreet/config.toml /etc/greetd/

echo "[+] Copying wallpaper..."
mkdir -p ~/Pictures/wallpaper/
cp wallpaper/* ~/Pictures/wallpaper

echo "[+] Copying .bashrc..."
cp -f .bashrc ~/.bashrc

echo "[+] Making ~/gitclones folder..."
mkdir -p ~/Downloads/gitclones && cd ~/Downloads/gitclones

echo "[+] Installing dependencies for ble.sh..."
sudo pacman -S --noconfirm make gawk

echo "[+] Cloning and installing ble.sh..."
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

echo "[+] ble.sh installed in ~/.local/share/blesh/"

echo "[✅] Setup complete! You can now reboot to apply all changes."
