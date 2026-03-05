#!/bin/sh

echo "OpenWRT Anti-DPI installer"

INSTALL_DIR="/opt/antidpi"

echo "Creating directories..."
mkdir -p $INSTALL_DIR

echo "Downloading zapret2..."

wget -O /tmp/zapret2.tar.gz https://github.com/bol-van/zapret/archive/refs/heads/master.tar.gz

echo "Extracting..."
tar -xzf /tmp/zapret2.tar.gz -C /tmp

echo "Installing..."
cp -r /tmp/zapret-*/* $INSTALL_DIR

echo "Installation complete"

echo "Use command: antidpi start"