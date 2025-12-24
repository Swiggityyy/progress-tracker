#!/bin/bash

# Progress Tracker Server Launcher
# This script starts a simple HTTP server to make the progress tracker accessible on your local network

PORT=8000

echo "=================================="
echo " Progress Tracker Server Starting"
echo "=================================="
echo ""

# Change to the script's directory
cd "$(dirname "$0")"

# Get local IP address (works on Linux and macOS)
if command -v hostname &> /dev/null; then
    # Try hostname command first (works on most systems)
    LOCAL_IP=$(hostname -I 2>/dev/null | awk '{print $1}')

    # Fallback for macOS
    if [ -z "$LOCAL_IP" ]; then
        LOCAL_IP=$(ipconfig getifaddr en0 2>/dev/null)
    fi

    # Another fallback using ifconfig
    if [ -z "$LOCAL_IP" ]; then
        LOCAL_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -1)
    fi
fi

# If we still don't have an IP, use localhost
if [ -z "$LOCAL_IP" ]; then
    LOCAL_IP="localhost"
fi

echo "Server started successfully!"
echo ""
echo "Access your progress tracker:"
echo "  - On this computer: http://localhost:$PORT"
echo "  - On your network:  http://$LOCAL_IP:$PORT"
echo ""
echo "To access from other devices on your network:"
echo "  1. Make sure devices are on the same WiFi/network"
echo "  2. Open a browser and go to: http://$LOCAL_IP:$PORT"
echo "  3. Bookmark it for easy access!"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=================================="
echo ""

# Start Python HTTP server (try Python 3 first, then Python 2)
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    python -m http.server $PORT
else
    echo "Error: Python is not installed!"
    echo "Please install Python 3 to run this server."
    exit 1
fi
