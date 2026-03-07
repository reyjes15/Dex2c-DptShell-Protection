# 🛡️ Dex2C & DPT Shell Ultimate Protection With Anti-Tamper
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


## ✨ What's New in v1.1
* **🤖 Auto-Pilot Anti-Tamper:** No more manual byte counting or 2x execution tricks! The built-in AI engine automatically creates bait files, calculates the 100% accurate final APK size, injects it, and finalizes the protection completely on its own.
* **🌍 Multi-Language Interface:** Now supports both **English** and **Indonesian**, dynamically switchable at runtime.
* **📂 Custom Directory Scanning:** You are no longer restricted to a hardcoded folder. Type any target folder path, and the script will automatically scan it.
* **🧹 Smart Auto-Clean:** Automatically deletes bait and temporary files after execution to keep your workspace perfectly clean.
* **🗂️ Organized Output:** Automatically categorizes your final APKs into specific `DEX2C/`, `DPT/`, and `COMBO/` sub-folders.

## 🚀 Installation
To install and set up the environment, simply copy and paste the following one-liner command into your Termux application:

```bash
curl -sL "https://raw.githubusercontent.com/reyjes15/Dex2c-DptShell-Protection/refs/heads/main/install.sh" | bash
```

> **Note:** Please ensure you have a stable internet connection during the initial setup as the script will download necessary SDK/NDK components if they are not already present on your device.

## 📖 Usage Guide

Follow these simple steps to start protecting your Android applications:

**1. Prepare the Workspace**
Create a new folder anywhere in your internal storage (e.g., `/storage/emulated/0/MOD/`).

**2. Target Placement**
Place the target `.apk` file you wish to protect inside the newly created folder.

**3. Execute the Suite**
Open your Termux application and execute the protector by simply typing:
```bash
./dcc-dpt-protection
```

**4. Follow the On-Screen Prompts**
Select your preferred language, enter your custom folder path, and choose your protection method. The script will automatically scan the directory and process your APK.

**5. Retrieve Protected Assets**
The final protected APK will be automatically generated and saved in specific auto-created sub-folders inside your target directory:
* 📁 **`.../DEX2C/`** ➔ Contains APKs protected with **Dex2C Only**.
* 📁 **`.../DPT/`** ➔ Contains APKs protected with **DPT Only**.
* 📁 **`.../COMBO/`** ➔ Contains APKs protected with **Dex2C + DPT Shell Combo** (Maximum Security).

> **⚠️ CRITICAL NOTE (FOLDER CLEANUP):**
> **ALWAYS ensure that the `DEX2C` and `COMBO` output folders are completely EMPTY or DELETED before executing the script for a new APK.** If old output files are left inside, the Auto-Pilot system might read the wrong file size, resulting in a failed Anti-Tamper injection and a crashing APK!

**If you encounter a "Warning: linker" when executing this for the first time, ignore the warning or run this fix:**
```bash
echo "export LD_LIBRARY_PATH=\$PREFIX/lib" >> ~/.bashrc && source ~/.bashrc
```

## 📢 AUTOMATED ANTI-TAMPER (AUTO-PILOT)
*Good news! The manual Anti-Tamper setup from version 1.0 is now officially obsolete.* You no longer need to execute the script twice, manually check APK properties. Our new **Auto-Pilot** system will execute the bait process in the background, and re-compile your APK with a 100% accurate Anti-Tamper injection. **Just 1-click and relax!**

> **⚠️ CRITICAL NOTE (FOLDER CLEANUP):**
> **CLEAN THE DEX2C AND COMBO FOLDER EVERY TIME YOU WANT TO EXECUTE A SCRIPT.**




## **FILTER**

▣ Protect all methods in a specific class.
```bash
com/some/class;.*
```

▣ Protect onCreate methods in specific classes.
```bash
com/some/class;.*;onCreate\(.*
```

▣ Protect all methods in all classes under a package path. (Risk)
```bash
com/some/package/.*;.*
```


▣ Protect a method with the name onCreate in all classes. (RISK)
```bash
.*;onCreate\(.*
```



## 👨‍💻 Developer & Contact
This project is exclusively developed and maintained by:

* **This script requires a login, contact admin to a license.**
* **Developer:** AXEL-Z
* **Telegram:** [@NocturneVail](https://t.me/NocturneVail)

For access, support, or inquiries regarding this project, please contact the developer directly via Telegram.

---
*Securing your digital assets, one byte at a time.* 🪄
