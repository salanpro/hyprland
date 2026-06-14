echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Copying apps.desktop"
mkdir -p ~/.local/share/applications/
cp vicinae/apps/* ~/.local/share/applications/

echo "Copying scripts"
cp vicinae/scripts/* ~/.config/hypr/scripts/

echo "Copying vicinae-scripts"
mkdir -p ~/.local/share/vicinae/scripts/
cp vicinae/vicinae-scripts/* ~/.local/share/vicinae/scripts/.

sudo pacman -S --needed base-devel
cd ~/Downloads/gitclones/
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru vicinae-git
paru wlogout
paru quickshell-overview-git

cd ~/Downloads/gitclones/
git clone https://github.com/devmobasa/wayscriber.git
cd ~/Downloads/gitclones/wayscriber
cargo build --release
sudo cp target/release/wayscriber /usr/local/bin/
