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


cd ~/Downloads/gitclones/
git clone https://github.com/vicinaehq/vicinae.git && cd vicinae

cmake -G Ninja .. \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5  \
	-DLTO=ON \
	-DUSE_SYSTEM_PROTOBUF=OFF \
	-DUSE_SYSTEM_ABSEIL=OFF \
	-DUSE_SYSTEM_CMARK_GFM=OFF \
	-DUSE_SYSTEM_MINIZIP=OFF


make host-optimized


cd build/

sudo ninja install


echo "Making desktop apps"
cp vicinae/apps/* ~/.local/share/applications/

echo "Copying theme"
sudo cp vicinae/themes/* /usr/local/share/vicinae/themes/
