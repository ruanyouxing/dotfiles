#!/bin/bash
echo "   " "$(df -H / | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 }')"
