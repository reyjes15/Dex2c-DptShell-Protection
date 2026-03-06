#!/bin/bash

if ! command -v termux-setup-storage &> /dev/null; then
    echo -e "\e[31m[!] Jalankan di Termux Android!\e[0m"
    exit 1
fi

clear
termux-setup-storage
sleep 2

pkg update -y && pkg upgrade -y
pkg install -y python wget git make clang openjdk-17 ncurses-utils aapt cmake rust ndk-sysroot zlib libxml2 libxslt pkg-config libjpeg-turbo build-essential binutils openssl

if [ -d "$HOME/android-sdk/cmdline-tools" ]; then
    echo -e "\e[36m[i] Android SDK ditemukan.\e[0m"
else
    rm -rf $HOME/androidide-tools
    git clone https://github.com/AndroidIDEOfficial/androidide-tools $HOME/androidide-tools
    cd $HOME/androidide-tools/scripts && ./idesetup -c
fi

cd $HOME

NDK_PATH=$(find $HOME/android-sdk/ndk -maxdepth 1 -type d -name "26.*" | head -n 1)

if [ -n "$NDK_PATH" ] && [ -f "$NDK_PATH/ndk-build" ]; then
    NDK_FOLDER=$(basename "$NDK_PATH")
    echo -e "\e[36m[i] Android NDK versi $NDK_FOLDER ditemukan.\e[0m"
else
    echo -e "\e[31m[!] NDK r26 tidak ditemukan!\e[0m"
    echo -e "\e[33m[!] Memulai instalasi NDK r26b (Otomatis pilih No. 9)...\e[0m"
    wget -q https://github.com/MrIkso/AndroidIDE-NDK/raw/main/ndk-install.sh -O ndk-install.sh
    chmod +x ndk-install.sh
    echo "9" | ./ndk-install.sh
    NDK_FOLDER=$(ls $HOME/android-sdk/ndk | grep "26." | head -n 1)
fi

sed -i '/ANDROID_HOME/d; /ANDROID_NDK_ROOT/d; /LD_LIBRARY_PATH/d; /BUILD_TOOLS/d' ~/.bashrc ~/.zshrc 2>/dev/null

cat << EOF | tee -a ~/.bashrc ~/.zshrc > /dev/null
export LD_LIBRARY_PATH=\$PREFIX/lib
export ANDROID_HOME=\$HOME/android-sdk
export ANDROID_NDK_ROOT=\$HOME/android-sdk/ndk/$NDK_FOLDER
export BUILD_TOOLS=\$(ls -d \$ANDROID_HOME/build-tools/* 2>/dev/null | tail -1)
export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools:\$ANDROID_NDK_ROOT:\$BUILD_TOOLS
EOF

# OPSI 2: Auto-Source (Memaksa memuat ulang konfigurasi path)
if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc 2>/dev/null
else
    source ~/.bashrc 2>/dev/null
fi

cd $HOME
rm -f dcc-dpt-protection
wget -q --show-progress "https://github.com/reyjes15/Dex2c-DptShell-Protection/releases/download/v1.0/dcc-dpt-protection" -O dcc-dpt-protection
chmod 700 dcc-dpt-protection

# OPSI 1: Peringatan Keras di akhir instalasi
echo -e "\e[32m[✓] INSTALASI SELESAI OLEH AXEL-Z!\e[0m"
echo -e "\e[31m====================================================\e[0m"
echo -e "\e[31m[!] PENTING: JANGAN LANGSUNG JALANKAN SCRIPT!\e[0m"
echo -e "\e[33m[1] KETIK: exit (lalu tekan Enter) untuk keluar Termux.\e[0m"
echo -e "\e[33m[2] Hapus Termux dari Recent Apps (Latar Belakang).\e[0m"
echo -e "\e[33m[3] Buka kembali Termux, lalu ketik: ./dcc-dpt-protection\e[0m"
echo -e "\e[31m====================================================\e[0m"
