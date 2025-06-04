#!bash
echo "About to start Docker..."
sudo systemctl start docker 

echo "Logging version to check if Docker is running or not"
docker --version

echo "Docker service started."
