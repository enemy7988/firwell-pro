#!/bin/bash

# ON MAHMOUD Manager - Installer Script
# Auto-installation script for ON MAHMOUD Manager

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}"
echo -e "==============================================="
echo -e "    ON MAHMOUD Manager v3.3.3 Installer"
echo -e "===============================================${NC}"
echo -e ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: This script must be run as root${NC}"
    exit 1
fi

# Detect OS
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS=$ID
else
    echo -e "${RED}Cannot detect operating system${NC}"
    exit 1
fi

echo -e "${BLUE}Detected OS: $OS${NC}"
echo -e ""

# Update system packages
echo -e "${YELLOW}Updating system packages...${NC}"
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    apt-get update && apt-get upgrade -y
elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
    yum update -y
else
    echo -e "${RED}Unsupported OS: $OS${NC}"
    exit 1
fi

# Install dependencies
echo -e "${YELLOW}Installing dependencies...${NC}"
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    apt-get install -y curl wget git sudo net-tools ufw
elif [[ "$OS" == "centos" || "$OS" == "rhel" ]]; then
    yum install -y curl wget git sudo net-tools firewalld
fi

# Download ON MAHMOUD Manager
echo -e "${YELLOW}Downloading ON MAHMOUD Manager...${NC}"
cd /usr/local/bin

# Download the main script
curl -L -o onmahmoud-manager.sh "https://raw.githubusercontent.com/yourusername/on-mahmoud-manager/main/onmahmoud-manager.sh"

if [[ $? -eq 0 ]]; then
    chmod +x onmahmoud-manager.sh
    
    # Create symbolic link
    ln -sf /usr/local/bin/onmahmoud-manager.sh /usr/bin/onmahmoud
    
    echo -e "${GREEN}✓ ON MAHMOUD Manager downloaded successfully${NC}"
else
    echo -e "${RED}✗ Failed to download ON MAHMOUD Manager${NC}"
    exit 1
fi

# Create configuration directory
mkdir -p /etc/onmahmoud
echo -e "${GREEN}✓ Configuration directory created${NC}"

# Create service file
cat > /etc/systemd/system/onmahmoud.service << EOF
[Unit]
Description=ON MAHMOUD Manager Service
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/bin/onmahmoud
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

# Enable service
systemctl daemon-reload
systemctl enable onmahmoud.service

echo -e "${GREEN}✓ Service installed and enabled${NC}"

# Display completion message
echo -e ""
echo -e "${GREEN}===============================================${NC}"
echo -e "${GREEN}   ON MAHMOUD Manager Installation Complete!  ${NC}"
echo -e "${GREEN}===============================================${NC}"
echo -e ""
echo -e "${BLUE}Usage:${NC}"
echo -e "  Start:    ${GREEN}systemctl start onmahmoud${NC}"
echo -e "  Stop:     ${GREEN}systemctl stop onmahmoud${NC}"
echo -e "  Status:   ${GREEN}systemctl status onmahmoud${NC}"
echo -e "  Direct:   ${GREEN}onmahmoud${NC}"
echo -e ""
echo -e "${YELLOW}The manager will start automatically on boot.${NC}"
echo -e ""

# Start the service
echo -e "${BLUE}Starting ON MAHMOUD Manager...${NC}"
systemctl start onmahmoud.service

echo -e ""
echo -e "${GREEN}Installation completed successfully!${NC}"
echo -e "${YELLOW}You can now run 'onmahmoud' to start managing your server.${NC}"
