#!/bin/bash

echo "Stopping existing Flask app..."

# Find matching PIDs owned by ec2-user
PIDS=$(pgrep -u $(whoami) -f "python3 app.py")

if [ -z "$PIDS" ]; then
  echo "No Flask app running."
else
  echo "Killing Flask app with PID(s): $PIDS"
  kill $PIDS
fi