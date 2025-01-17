#!/bin/bash

echo "Welcome to the PocketMine-MP Installer!"

# Update system packages
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y wget curl git screen

# Download PocketMine-MP
echo "Downloading PocketMine-MP..."
wget -q -O pocketmine.phar https://github.com/pmmp/PocketMine-MP/releases/latest/download/PocketMine-MP.phar

# Create a directory for the server
echo "Setting up server directory..."
mkdir -p ~/PocketMine-MP
mv pocketmine.phar ~/PocketMine-MP/
cd ~/PocketMine-MP

# Create a start script
echo "Creating start script..."
echo "#!/bin/bash" > start.sh
echo "php PocketMine-MP.phar" >> start.sh
chmod +x start.sh

# Finish
echo "Installation complete! Navigate to ~/PocketMine-MP and run ./start.sh to start your server."
