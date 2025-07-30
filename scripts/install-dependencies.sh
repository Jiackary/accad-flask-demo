#!/bin/bash
set -e

echo "Installing dependencies..."

# Define DEPLOY_DIR FIRST
DEPLOY_DIR="/home/ec2-user/accad-flask-demo"

# Clean up any existing deployment (prevents "file already exists" errors)
echo "Cleaning up existing deployment directory..."
sudo rm -rf $DEPLOY_DIR/*

# Now create the directory
sudo mkdir -p $DEPLOY_DIR

# Ensure ec2-user owns the folder
sudo chown -R ec2-user:ec2-user $DEPLOY_DIR

# Run the rest as ec2-user to avoid permission issues with venv
sudo -u ec2-user bash <<'EOF'
cd /home/ec2-user/accad-flask-demo

# Safety check: does requirements.txt exist?
if [ ! -f requirements.txt ]; then
  echo "requirements.txt not found in $(pwd)"
  exit 1
fi

# Create virtual environment
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "Dependencies installed successfully"
EOF

echo "install-dependencies.sh completed successfully"