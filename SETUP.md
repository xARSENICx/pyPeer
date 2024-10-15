# pyPeer Setup Guide

## Quick Start

### 1. Start the Server (run this first)
```bash
./start_server.sh
```
The server will display its IP address. Note this for client connections.

### 2. Start the Client (run in another terminal)
```bash
./start_client.sh
```

## Manual Setup

### Server
```bash
cd src/server
python3 server.py
```

### Client  
```bash
cd src/client
python3 app.py
```

## Requirements Met ✅
- Python 3.13.3 ✅
- PyQt5 ✅
- All dependencies installed ✅
- pyPeer directories created ✅

## Network Setup
- Server runs on port 1234
- Clients connect on port 4321 for P2P
- Make sure these ports are available
- For local testing, both server and client can run on the same machine

## Directories
- `~/.pyPeer/share/` - Put files here to share with others
- `~/.pyPeer/downloads/` - Downloaded files appear here
- `~/.pyPeer/logs/` - Application logs
- `~/.pyPeer/db/` - Database files

## Troubleshooting
- If server fails to start, check if port 1234 is in use: `lsof -i :1234`
- If client GUI doesn't appear, check PyQt5 installation
- Check logs in `~/.pyPeer/logs/` for detailed error messages