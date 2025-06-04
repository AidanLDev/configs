#!/bin/bash

# Start PostgreSQL service on Arch Linux

echo "Starting PostgreSQL service..."
sudo systemctl start postgresql

# Check status
sudo systemctl status postgresql --no-pager

echo "PostgreSQL service started."
