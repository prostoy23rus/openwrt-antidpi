#!/bin/sh

HOST_DIR="/etc/antidpi/hosts"
TMP_DIR="/tmp/antidpi-hosts"

mkdir -p $HOST_DIR
mkdir -p $TMP_DIR

echo "[AntiDPI] Updating hostlists..."

# antifilter list
wget -O $TMP_DIR/antifilter.txt https://raw.githubusercontent.com/antifilter/antifilter/master/domains.lst

# community list example
wget -O $TMP_DIR/community.txt https://raw.githubusercontent.com/hufrea/byedpi/master/data/hostlist.txt

# merge lists
cat $TMP_DIR/*.txt > $HOST_DIR/compiled.txt

# remove duplicates
sort -u $HOST_DIR/compiled.txt -o $HOST_DIR/compiled.txt

echo "[AntiDPI] Hostlists updated"
echo "Total domains:"
wc -l $HOST_DIR/compiled.txt