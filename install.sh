#!/bin/bash

echo "====================================="
echo "     FIRWELL-PRO INSTALLER"
echo "     Created by: ON MAHMOUD"
echo "====================================="
echo ""

# تحديث النظام
echo "[1/4] Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

# تثبيت الأدوات اللازمة
echo "[2/4] Installing required tools..."
sudo apt install -y curl wget unzip

# تنزيل ملفات البرنامج
echo "[3/4] Downloading Firwell-Pro files..."
REPO_URL="https://github.com/enemy7988/firwell-pro/archive/refs/heads/main.zip"
wget -O firwell-pro.zip "$REPO_URL"

# فك الضغط
echo "[4/4] Extracting files..."
unzip -o firwell-pro.zip
rm firwell-pro.zip

# نقل الملفات للمجلد النهائي (إن أردت تعديله قل لي)
FOLDER="firwell-pro-main"
if [ -d "$FOLDER" ]; then
    sudo mv "$FOLDER" /opt/firwell-pro
fi

echo ""
echo "====================================="
echo "   Firwell-Pro Installed Successfully!"
echo "         Powered by ON MAHMOUD"
echo "====================================="
