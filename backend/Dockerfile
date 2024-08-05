# Base image
FROM python:3-slim

EXPOSE 8000

# Environment variables to avoid .pyc files and buffer issues
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set working directory and copy codebase
WORKDIR /app
COPY . /app

# Create a non-root user
RUN adduser -u 5678 --disabled-password --gecos "" backend && chown -R backend /app
USER backend

# Copy entrypoint script and set it as the entrypoint
COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
