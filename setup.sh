echo "[?] Select config"
select OPTION in "Config" "Exit"; do
    case $OPTION in
        "Config")
            CONFIG_DIR=".config"
            ICONS_DIR=".icons"
            WALLPAPER_DIR='wallpaper'
            TUIGREET_DIR='tuigreet'
            break
            ;;
        "Exit")
            echo "Exit..."
            exit 0
            ;;
        *)
            echo "Invalid option, try again"
            ;;
    esac
done


echo "[+] Updating system and installing base packages..."
sudo pacman -Syu
sudo pacman -S playerctl showtime gst-libav libmpeg2 xdg-desktop-portal-hyprland pavucontrol wireplumber pipewire-jack pipewire-pulse alsa-firmware alsa-utils \
nautilus alacritty base-devel brightnessctl fastfetch swaync firefox hyprland waybar hyprlock hypridle bluez blueman hyprshot \
loupe hyprpaper numlockx vulkan-radeon mesa tlp tlp-rdw nwg-look ttf-fira-code noto-fonts ttf-jetbrains-mono ttf-jetbrains-mono-nerd satty showtime \
greetd-tuigreet fzf wl-clipboard xdg-desktop-portal-gtk decibels neovim gnome-calendar hyprpicker noto-fonts-emoji papers hyprsunset syntax-highlighting rsync neovide \
qt6-shadertools quickshell eza yazi 

echo "[+] Enabling services..."
sudo systemctl enable greetd.service
sudo systemctl enable tlp.service
sudo systemctl enable bluetooth.service
systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user enable wireplumber.service

echo "[+] Copying to .icons..."
mkdir -p ~/.icons
cp -r $ICONS_DIR/* ~/.icons/
cp -r Bibata-Modern-Classic/ ~/.icons/

echo "[+] Copying to .config..."
mkdir -p ~/.config
cp -r $CONFIG_DIR/* ~/.config/

echo "[+] Setting tuigreet..."
sudo cp $TUIGREET_DIR/config.toml /etc/greetd/

echo "[+] Copying wallpaper..."
mkdir -p ~/Pictures/wallpaper/
cp $WALLPAPER_DIR/* ~/Pictures/wallpaper

echo "[+] Copying .bashrc..."
cp -f .bashrc ~/.bashrc
cp -f .blerc ~/.blerc

echo "[+] Making ~/gitclones folder..."
mkdir -p ~/Downloads/gitclones && cd ~/Downloads/gitclones


echo "[+] Installing dependencies for ble.sh..."
sudo pacman -S --noconfirm make gawk

echo "[+] Cloning and installing ble.sh..."
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

echo "[+] ble.sh installed in ~/.local/share/blesh/"

echo "[✅] Setup complete! You can now reboot to apply all changes."
