#!bash
echo "About to start Redis..."
sudo systemctl start valkey 

# Check status
sudo systemctl status valkey --no-pager

echo "Redis service started."
