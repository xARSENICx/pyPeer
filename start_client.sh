#!/bin/bash
echo "Starting pyPeer Client..."
echo "Make sure the server is running first!"
echo ""

cd "$(dirname "$0")/src/client"
python3 app.py