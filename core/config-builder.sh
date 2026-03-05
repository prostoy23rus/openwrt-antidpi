#!/bin/sh

CONFIG_DIR="/etc/antidpi"
CONFIG_FILE="$CONFIG_DIR/nfqws.conf"

mkdir -p $CONFIG_DIR

echo "Building nfqws configuration..."

cat > $CONFIG_FILE <<EOF
--filter-tcp=80,443
--dpi-desync=fake,split2
--dpi-desync-split-pos=1
--dpi-desync-repeats=3
--dpi-desync-fooling=badsum
EOF

echo "Configuration created: $CONFIG_FILE"