#!/bin/bash
set -e
echo "Starting application..."
# Start the application
echo "Starting application..."
gunicorn --bind 0.0.0.0:8000 backend.wsgi