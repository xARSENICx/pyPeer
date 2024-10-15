#!/bin/bash
echo "Starting pyPeer Server..."
echo "Make sure port 1234 is available"
echo ""

cd "$(dirname "$0")/src/server"
python3 server.py