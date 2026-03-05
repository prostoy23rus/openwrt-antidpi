#!/bin/sh

HOST_DIR="/etc/antidpi/hosts"
COMPILED="$HOST_DIR/compiled.txt"

mkdir -p $HOST_DIR

echo "Compiling hostlists..."

cat /opt/antidpi/hosts/*.txt > $COMPILED 2>/dev/null

echo "Hostlist compiled: $COMPILED"