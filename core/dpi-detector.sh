#!/bin/sh

TEST_SITES="
https://cloudflare.com
https://discord.com
https://rutracker.org
"

echo "Starting DPI detection..."

for SITE in $TEST_SITES
do
    echo "Testing $SITE ..."
    wget -q --timeout=5 --spider $SITE

    if [ $? -eq 0 ]; then
        echo "OK: $SITE reachable"
    else
        echo "BLOCKED: $SITE"
    fi
done

echo "DPI detection finished"