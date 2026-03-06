#!/bin/bash

if ! command -v termux-setup-storage &> /dev/null; then
    echo -e "\e[31m[!] Script ini hanya bisa dijalankan di dalam aplikasi Termux Android!\e[0m"
    exit 1
fi

clear
termux-setup-storage
sleep 2

pkg update -y && pkg upgrade -y
pkg install -y python wget git make clang openjdk-17 ncurses-utils aapt cmake rust ndk-sysroot zlib libxml2 libxslt pkg-config libjpeg-turbo build-essential binutils openssl

if [ -d "$HOME/android-sdk" ]; then
    echo -e "\e[36m[i] Android SDK ditemukan, melewati...\e[0m"
else
    rm -rf $HOME/androidide-tools
    git clone https://github.com/AndroidIDEOfficial/androidide-tools $HOME/androidide-tools
    cd $HOME/androidide-tools/scripts && ./idesetup -c
fi

cd $HOME
if [ -d "$HOME/android-sdk/ndk/26.1.10909125" ]; then
    ndk_v="26.1.10909125"
    echo -e "\e[36m[i] NDK r26 ditemukan, melewati instalasi...\e[0m"
else
    echo -e "\e[33m[!] NDK TIDAK DITEMUKAN. TUNGGU DAFTAR MUNCUL, KETIK 9 LALU ENTER!\e[0m"
    read -p "Tekan Enter untuk memulai instalasi NDK..."
    wget -q https://github.com/MrIkso/AndroidIDE-NDK/raw/main/ndk-install.sh -O ndk-install.sh
    chmod +x ndk-install.sh && ./ndk-install.sh
    
    if [ -d "$HOME/android-sdk/ndk/26.1.10909125" ]; then
        ndk_v="26.1.10909125"
    else
        ndk_v=$(ls $HOME/android-sdk/ndk 2>/dev/null | head -n 1)
    fi
fi

if [ -z "$ndk_v" ]; then
    echo -e "\e[31m[!] Gagal mendeteksi folder NDK. Instalasi dihentikan.\e[0m"
    exit 1
fi

sed -i '/ANDROID_HOME/d' ~/.bashrc ~/.zshrc 2>/dev/null
sed -i '/ANDROID_NDK_ROOT/d' ~/.bashrc ~/.zshrc 2>/dev/null
sed -i '/LD_LIBRARY_PATH/d' ~/.bashrc ~/.zshrc 2>/dev/null
sed -i '/BUILD_TOOLS/d' ~/.bashrc ~/.zshrc 2>/dev/null

cat << EOF | tee -a ~/.bashrc ~/.zshrc > /dev/null
export LD_LIBRARY_PATH=\$PREFIX/lib
export ANDROID_HOME=\$HOME/android-sdk
export ANDROID_NDK_ROOT=\$HOME/android-sdk/ndk/$ndk_v
export BUILD_TOOLS=\$(ls -d \$ANDROID_HOME/build-tools/* 2>/dev/null | tail -1)
export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools:\$ANDROID_NDK_ROOT:\$BUILD_TOOLS
EOF

cd $HOME
rm -f dcc-dpt-protection
wget -q --show-progress "https://github.com/reyjes15/Dex2c-DptShell-Protection/releases/download/v1.0/dcc-dpt-protection" -O dcc-dpt-protection
chmod 700 dcc-dpt-protection

echo -e "\e[32m[✓] INSTALASI SELESAI OLEH AXEL-Z!\e[0m"
echo -e "\e[33m[!] RESTART TERMUX DAN KETIK: ./dcc-dpt-protection\e[0m"
