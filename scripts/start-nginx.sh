#!bash
echo "About to start nginx..."
sudo systemctl start nginx

sudo systemctl status nginx --no-pager

echo "nginx service started."
