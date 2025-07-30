#!/bin/bash
set -e

echo "Installing dependencies..."

DEPLOY_DIR="/home/ec2-user/accad-demo-flask"

# Ensure ec2-user owns the folder
sudo chown -R ec2-user:ec2-user $DEPLOY_DIR

# Run the rest as ec2-user to avoid permission issues with venv
sudo -u ec2-user bash <<'EOF'
cd /home/ec2-user/accad-demo-flask

# Safety check: does requirements.txt exist?
if [ ! -f requirements.txt ]; then
  echo "requirements.txt not found in $(pwd)"
  exit 1
fi

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
EOF