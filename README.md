
# 🛡️ Dex2C & DPT Ultimate Protector
**Automated Dex2C & DPT Packer Environment for Termux**

![Version](https://img.shields.io/badge/Version-1.0%20Axel-Z-blue)
![Platform](https://img.shields.io/badge/Platform-Termux%20Android-green)
![Status](https://img.shields.io/badge/Status-Active-success)

## 📌 About The Project
**Dex2C & DPT Ultimate Protector** is a highly automated, security suite designed to protect Android applications (APK) from reverse engineering, modification, and unauthorized cloning. Built specifically for the Termux Android ecosystem, it eliminates the hassle of manual environment setups.

By combining the power of **Dex2C** (translating Dalvik bytecode into native C/C++ binaries) and **DPT Packer** (advanced application packing), this tool provides a multi-layered, iron-clad defense for your Android applications.

## ✨ Features
* **⚙️ 1-Click Environment Setup:** Automatically detects and installs required dependencies (Python, OpenJDK-17, Clang, Make, Android SDK, and NDK r26).
* **🛡️ Native Dex2C Obfuscation:** Converts vulnerable `.dex` code into heavily obfuscated `.so` native libraries.
* **📦 DPT Packer Integration:** Wraps the entire application structure, preventing unauthorized tampering and repackaging.
* **🔐 Secure Authentication:** Built-in verification system to ensure only authorized members can execute the compilation process.
* **📱 Mobile-First Design:** Fully optimized to run smoothly on Android via Termux, supporting both Rooted and Non-Rooted devices.

## 🚀 Installation & Usage
To install and run the protector, simply copy and paste the following one-liner command into your Termux application:

```bash
curl -sL "[https://raw.githubusercontent.com/reyjes15/Dex2c-DptShell-Protection/main/install.sh](https://raw.githubusercontent.com/reyjes15/Dex2c-DptShell-Protection/main/install.sh)" | bash
