#!/bin/bash
set -e
#create migrations
echo "Creating database migrations..."
python3 manage.py makemigrations
# Run migrations
echo "Applying database migrations..."
python3 manage.py migrate

# Start the application
echo "Starting application..."
gunicorn --bind 0.0.0.0:8000 backend.wsgi
