# 🛡️ Dex2C & DPT Shell Ultimate Protection
**Automated Dex2C & DPT Packer Environment for Termux**

![Version](https://img.shields.io/badge/Version-1.0%20Dex2cDptShell-blue)
![Platform](https://img.shields.io/badge/Platform-Termux%20Android-green)
![Status](https://img.shields.io/badge/Status-Active-success)

## 📌 About The Project
**Dex2C & DPT Ultimate Protector** is a highly automated, premium security suite designed to protect Android applications (APK) from reverse engineering, modification, and unauthorized cloning. Built specifically for the Termux Android ecosystem, it eliminates the hassle of manual environment setups.

By combining the power of **Dex2C** (translating Dalvik bytecode into native C/C++ binaries) and **DPT Packer** (advanced application packing), this tool provides a multi-layered, iron-clad defense for your Android applications.

## ✨ Features
* **⚙️ 1-Click Environment Setup:** Automatically detects and installs required dependencies (Python, OpenJDK-17, Clang, Make, Android SDK, and NDK r26).
* **🛡️ Native Dex2C Obfuscation:** Converts vulnerable `.dex` code into heavily obfuscated `.so` native libraries.
* **📦 DPT Packer Integration:** Wraps the entire application structure, preventing unauthorized tampering and repackaging.
* **🔐 Secure Authentication:** Built-in verification system to ensure only authorized members can execute the compilation process.
* **📱 Mobile-First Design:** Fully optimized to run smoothly on Android via Termux, supporting both Rooted and Non-Rooted devices.

## 🚀 Installation
To install and set up the environment, simply copy and paste the following one-liner command into your Termux application:

```bash
curl -sL "https://raw.githubusercontent.com/reyjes15/Dex2c-DptShell-Protection/refs/heads/main/install.sh" | bash
```

> **Note:** Please ensure you have a stable internet connection during the initial setup as the script will download necessary SDK/NDK components if they are not already present on your device.

## 📖 Usage Guide

Follow these simple steps to start protecting your Android applications:

**1. Prepare the Workspace**
Create a new folder named `MOD` in your device's internal storage (SD Card).

**2. Target Placement**
Copy or move the target `.apk` file you wish to protect inside the newly created `MOD` folder.

**3. Execute the Suite**
Open your Termux application and execute the protector by simply typing:
```bash
./dcc-dpt-protection
```

**4. Retrieve Protected Assets**
Depending on the protection method you selected in the tool, the final protected APK will be automatically generated and saved in specific output folders inside the `MOD` directory:

* 📁 **`MOD/DEX2C/`** ➔ Contains APKs protected with **Dex2C Only**.
* 📁 **`MOD/DPT/`** ➔ Contains APKs protected with **DPT Only** OR the **Dex2C + DPT Shell Combo**.

> **💡 Pro Tip (Ultimate Combo):** If you execute the combo protection, the output file found in the `DPT` folder is your ultimate protected APK. It has been successfully processed through Dex2C native obfuscation first, and subsequently wrapped with the DPT Shell Packer for maximum, iron-clad security.

## 👨‍💻 Developer & Contact
This project is exclusively developed and maintained by:

* **Developer:** AXEL-Z
* **Telegram:** [@NocturneVail](https://t.me/NocturneVail)

For access, support, or inquiries regarding this project, please contact the developer directly via Telegram.

---
*Securing your digital assets, one byte at a time.* 🪄
