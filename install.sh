#!/bin/bash

if ! command -v termux-setup-storage &> /dev/null; then
    echo -e "\e[31m[!] Script ini hanya bisa dijalankan di dalam aplikasi Termux Android!\e[0m"
    exit 1
fi

clear
echo -e "\e[32m[+] Meminta izin penyimpanan...\e[0m"
echo -e "\e[33m[!] Jika muncul popup, mohon klik 'Izinkan' (Allow)\e[0m"
termux-setup-storage
sleep 2

echo -e "\e[32m[+] Pengecekan Paket Dasar Termux...\e[0m"
pkg update -y && pkg upgrade -y
pkg install -y python wget git make clang openjdk-17 ncurses-utils aapt

if [ -f "$HOME/android-sdk/cmdline-tools/latest/bin/sdkmanager" ]; then
    echo -e "\e[36m[i] Android SDK valid dan lengkap, melewati tahap ini...\e[0m"
else
    echo -e "\e[31m[!] Android SDK tidak ditemukan atau cacat! Memulai instalasi...\e[0m"
    rm -rf $HOME/android-sdk
    rm -rf $HOME/androidide-tools
    git clone https://github.com/AndroidIDEOfficial/androidide-tools $HOME/androidide-tools
    cd $HOME/androidide-tools/scripts && ./idesetup -c
fi

if [ -f "$HOME/android-sdk/ndk/26.1.10909125/ndk-build" ]; then
    echo -e "\e[36m[i] Android NDK r26 valid dan lengkap, melewati tahap ini...\e[0m"
else
    echo -e "\e[31m[!] Android NDK r26 tidak ditemukan atau cacat! Memulai instalasi...\e[0m"
    rm -rf $HOME/android-sdk/ndk/26.1.10909125
    echo -e "\e[33m[!] PENTING: Saat ditanya versi NDK, WAJIB PILIH NDK r26\e[0m"
    echo -e "\e[33m[!] (Ini untuk menginstal NDK r26 sesuai standar script)\e[0m"
    sleep 5 

    cd $HOME
    wget -q https://github.com/MrIkso/AndroidIDE-NDK/raw/main/ndk-install.sh -O ndk-install.sh
    chmod +x ndk-install.sh && ./ndk-install.sh
fi

echo -e "\e[32m[+] Menyiapkan Jalur Sistem (Path)...\e[0m"
sed -i '/ANDROID_HOME/d' ~/.bashrc ~/.zshrc 2>/dev/null
sed -i '/ANDROID_NDK_ROOT/d' ~/.bashrc ~/.zshrc 2>/dev/null
sed -i '/LD_LIBRARY_PATH/d' ~/.bashrc ~/.zshrc 2>/dev/null
sed -i '/BUILD_TOOLS/d' ~/.bashrc ~/.zshrc 2>/dev/null

cat << 'EOF' | tee -a ~/.bashrc ~/.zshrc > /dev/null
export LD_LIBRARY_PATH=$PREFIX/lib
export ANDROID_HOME=$HOME/android-sdk
export ANDROID_NDK_ROOT=$(find $HOME/android-sdk/ndk -mindepth 1 -maxdepth 1 -type d | head -n 1)
export BUILD_TOOLS=$(ls -d $ANDROID_HOME/build-tools/* 2>/dev/null | tail -1)
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_NDK_ROOT:$BUILD_TOOLS
EOF

echo -e "\e[32m[+] Mengunduh/Update Core System Axel (dex2c&dpt)...\e[0m"
cd $HOME
rm -f dcc-dpt-protection
wget -q --show-progress "https://github.com/reyjes15/Dex2c-DptShell-Protection/releases/download/v1.0/dcc-dpt-protection" -O dcc-dpt-protection
chmod 700 dcc-dpt-protection

echo -e "\e[32m[✓] INSTALASI SELESAI & SCRIPT SIAP DIGUNAKAN!\e[0m"
echo -e "\e[33m[!] SILAKAN KELUAR DARI TERMUX (Tutup Aplikasi Sepenuhnya)\e[0m"
echo -e "\e[33m[!] LALU BUKA KEMBALI TERMUX DAN KETIK: ./dcc-dpt-protection\e[0m"
