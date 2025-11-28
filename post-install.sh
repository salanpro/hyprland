echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Copying apps.desktop"
mkdir -p ~/.local/share/applications/
cp vicinae/apps/* ~/.local/share/applications/

echo "Copying scripts"
cp vicinae/scripts/* ~/.config/hypr/scripts/

echo "Installing dependencies for vicinae"
sudo pacman -Syu			\
    base-devel 		\
    cmake			\
    ninja			\
    nodejs			\
    npm				\
    qt6-base		\
    qt6-svg			\
    protobuf		\
    cmark-gfm		\
    layer-shell-qt 	\
    libqalculate 	\
    minizip			\
    qtkeychain-qt6	\
    rapidfuzz-cpp \
    ccache \
    mold

echo "Cloning vicinae"
cd ~/Downloads/gitclones/
git clone https://github.com/vicinaehq/vicinae.git && cd vicinae

echo "Making build"
make host-optimized

cd build/
sudo ninja install



cd ~/Downloads/gitclones/
git clone https://github.com/devmobasa/wayscriber.git
cd wayscriber
cargo build --release
sudo cp target/release/wayscriber /usr/local/bin/


echo "Copying theme"
cd ~/hyprland/
sudo cp vicinae/themes/* /usr/local/share/vicinae/themes/
