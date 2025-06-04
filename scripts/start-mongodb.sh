#!bash
echo "About to start monbodb..."
sudo systemctl start mongodb

sudo systemctl status mongodb --no-pager

echo "Mongodb service started."
