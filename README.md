# pyPeer

_A lightweight file-sharing and messaging platform for local networks._

## Author

-   [Ayush Sah](https://github.com/ayushsah)

## Related Projects

This is a sister project to [CPeer](https://github.com/xARSENICx/CPeer), a C/C++ implementation with similar peer-to-peer file sharing capabilities. Both projects explore different approaches to local network file sharing.

## Technologies Used

-   Python ≥ 3.10
-   PyQt5 (GUI Framework)
-   Sockets (Network Communication)
-   TinyDB (Database)
-   msgpack (Serialization)

## About pyPeer

pyPeer is a simple yet powerful file-sharing application designed specifically for local networks such as college campuses and home environments. The system implements a hybrid architecture that combines centralized user discovery and file metadata management with direct peer-to-peer file transfers and messaging.

The core design philosophy emphasizes simplicity, cross-platform compatibility, and efficient resource usage. Unlike traditional centralized file-sharing systems, pyPeer's server component only handles user registry and metadata—actual file transfers occur directly between peers, reducing server load and improving transfer speeds.

## Key Features

### 🌐 Network Discovery
- Automatically discover users on your local network
- See who's online and when they were last active
- Real-time status updates

### 💬 Peer-to-Peer Messaging
- Direct private messaging between users
- No server intermediary for chat messages
- Real-time communication

### 📁 File Sharing & Browsing
- Browse files shared by other users on the network
- Controlled sharing through designated share folders
- Only files you choose to share are accessible to others

### 🔍 Network-Wide Search
- Search across all shared files on the network
- Find files without knowing which user has them
- Fuzzy search capabilities

### 💾 Direct File Transfer
- High-speed peer-to-peer file transfers
- Download individual files or entire directories
- No server bandwidth limitations

### ⏯️ Pause & Resume Downloads
- Pause downloads at any time
- Resume downloads even after restarting the application
- Automatic progress tracking between sessions

### 🔒 Security & Integrity
- SHA-256 hash verification for file integrity
- User consent required for incoming file transfers
- Corruption detection and tamper-proofing

### 🔗 Smart Storage Management
- Symbolic link support to avoid file duplication
- Efficient disk space usage
- Import files without copying

### 🚨 Desktop Notifications
- Get notified when downloads complete
- Message notifications
- Customizable notification settings

## Architecture Overview

pyPeer uses a **hybrid architecture** combining the best of both worlds:

### Client-Server Component
- **Purpose**: User discovery and metadata management
- **Handles**: User registry, file metadata, network status
- **Benefits**: Easy peer discovery, centralized search

### Peer-to-Peer Component  
- **Purpose**: Direct data transfer and messaging
- **Handles**: File transfers, private messaging, real-time communication
- **Benefits**: High speed, no server bottleneck, privacy

### Key Characteristics
- **Lightweight Server**: Minimal resource requirements, suitable for home networks
- **Cross-Platform**: Python-based with PyQt5 GUI (Linux, Windows, macOS)
- **Scalable**: Server handles discovery; P2P handles data transfer
- **Efficient**: Direct peer connections for maximum speed

## Installation & Setup

### Prerequisites
- Python ≥ 3.10
- pip package manager

### Quick Setup

1. **Clone the repository**
```bash
git clone <repository-url>
cd pyPeer
```

2. **Create required directories**
```bash
mkdir -p ~/.pyPeer/db ~/.pyPeer/logs ~/.pyPeer/tmp ~/.pyPeer/share
```

3. **Install dependencies**

**Using pipenv (recommended):**
```bash
# Install pipenv if not available
python3 -m pip install --user pipenv

# Server setup
cd src/server
pipenv install
pipenv run python server.py

# Client setup (in another terminal)
cd src/client  
pipenv install
pipenv run python app.py
```

**Using pip directly:**
```bash
pip install pyqt5 msgpack tinydb fuzzysearch notify-py
```

### Running pyPeer

1. **Start the Server** (run on one machine per network)
```bash
cd src/server
pipenv run python server.py
```
The server will display its IP address. Note this for client configuration.

2. **Start the Client** (run on each user's machine)
```bash
cd src/client
pipenv run python app.py
```

## Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| **Linux** | ✅ Full Support | All features work as intended |
| **macOS** | ⚠️ Mostly Supported | Some socket optimizations disabled |
| **Windows** | ⚠️ Limited Support | Pause/Resume may not work, Admin required for symlinks |

### Known Issues
- **Windows/macOS**: Pause/Resume functionality may be limited
- **macOS**: Some UI theme inconsistencies possible
- **Windows**: Symbolic link imports require administrator privileges

## Communication Patterns

### Client-Server Messages
- `NEW_CONNECTION`: User registration and authentication
- `SHARE_DATA`: Upload file metadata to server database
- `FILE_BROWSE`: Request another user's shared file list
- `FILE_SEARCH`: Search files across the entire network
- `HEARTBEAT_REQUEST`: Maintain connection and sync user status

### Peer-to-Peer Messages
- `FILE_REQUEST`: Initiate direct file transfer
- `MESSAGE`: Send private messages between users
- `FILE_CHUNK`: Transfer file data in chunks with resume support

## Core Components

| Component | Purpose | Key Files |
|-----------|---------|-----------|
| **Server** | User discovery & metadata | `src/server/server.py` |
| **Client** | GUI application | `src/client/app.py` |
| **Utils** | Shared protocols & helpers | `src/utils/` |
| **GUI** | PyQt5 interface components | `src/client/ui/` |

## Directory Structure

```
pyPeer/
├── src/
│   ├── server/           # Server component
│   ├── client/           # Client application  
│   └── utils/            # Shared utilities
├── ~/.pyPeer/            # User data directory
│   ├── share/            # Files to share with network
│   ├── downloads/        # Downloaded files
│   ├── tmp/              # Temporary/partial downloads
│   ├── db/               # Database files
│   └── logs/             # Application logs
└── README.md
```

## Configuration

pyPeer uses a simple configuration approach:

- **Share Folder**: `~/.pyPeer/share/` - Only files here are shared
- **Downloads**: `~/.pyPeer/downloads/` - Where downloaded files go
- **Database**: Server stores user and file metadata in `~/.pyPeer/db/`
- **Logs**: Application logs stored in `~/.pyPeer/logs/`

## Contributing

This is a personal project by Ayush Sah. Feel free to fork and modify for your own use.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: pyPeer is designed for trusted local networks. Use appropriate network security measures when deploying on larger or public networks.