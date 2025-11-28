#!/bin/bash
clear
echo "====================================="
echo "       MAHMOUD MANAGER INSTALL       "
echo "====================================="
sleep 1

# تحديث النظام
apt update -y && apt upgrade -y
apt install -y curl wget sudo unzip socat cron

# إنشاء أمر menu
cat << 'EOF' > /usr/bin/menu
#!/bin/bash
clear
echo "====================================="
echo "          MAHMOUD MANAGER            "
echo "====================================="
echo "1) تثبيت SSH + WebSocket"
echo "2) تثبيت OpenVPN"
echo "3) تثبيت WireGuard"
echo "4) تثبيت XRAY (VMESS/VLESS/TROJAN)"
echo "5) تفعيل Nginx Reverse Proxy"
echo "6) تثبيت Haproxy"
echo "7) إصدار شهادة SSL"
echo "8) إعداد DNS لدومينك"
echo "0) خروج"
echo "====================================="
read -p "اختر رقم: " num

case $num in

1)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/ssh-ws.sh)
;;
2)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/openvpn.sh)
;;
3)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/wireguard.sh)
;;
4)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/xray.sh)
;;
5)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/nginx.sh)
;;
6)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/haproxy.sh)
;;
7)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/ssl.sh)
;;
8)
   bash <(curl -s https://raw.githubusercontent.com/enemy7988/firwell-pro/main/modules/dns.sh)
;;
0)
   exit
;;
*)
   echo "خيار غير صحيح"
;;
esac
EOF

chmod +x /usr/bin/menu

clear
echo "====================================="
echo "   تم تثبيت MAHMOUD MANAGER بنجاح   "
echo "   شغل القائمة قبل: menu            "
echo "====================================="
