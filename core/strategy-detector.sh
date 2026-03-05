#!/bin/sh

TEST_SITE="https://rutracker.org"

echo "[AntiDPI] Detecting best DPI bypass strategy..."

strategies="
fake
split2
multisplit
disorder2
"

best=""

for s in $strategies
do
 echo "Testing strategy: $s"

 nfqws --dpi-desync=$s --filter-tcp=80,443 &
 PID=$!

 sleep 3

 wget -q --timeout=5 --spider $TEST_SITE

 if [ $? -eq 0 ]; then
  echo "Working strategy found: $s"
  best=$s
  kill $PID
  break
 fi

 kill $PID
done

if [ -z "$best" ]; then
 echo "No working strategy detected"
 exit 1
fi

echo "Best strategy: $best"

echo $best > /etc/antidpi/best-strategy.conf