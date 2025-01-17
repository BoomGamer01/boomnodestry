#!/bin/bash

# Print the start message
echo "Starting Wings installation..."

# Update system packages
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies
echo "Installing required dependencies..."
sudo apt install -y curl wget git unzip php-cli php-mbstring php-xml php-curl php-zip

# Install Composer (required for Wings)
echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Clone the Wings repository from GitHub
echo "Cloning Wings repository..."
cd /opt
sudo git clone https://github.com/pterodactyl/wings.git

# Install Wings dependencies
echo "Installing Wings dependencies..."
cd wings
sudo composer install --no-dev --optimize-autoloader

# Set up Wings service (systemd)
echo "Setting up Wings as a systemd service..."
sudo cp wings.service /etc/systemd/system/wings.service
sudo systemctl enable wings
sudo systemctl start wings

# Confirm installation
echo "Wings installation complete! Use 'sudo systemctl status wings' to check the status."
