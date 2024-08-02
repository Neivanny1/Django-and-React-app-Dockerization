# Official Python runtime as a parent image
FROM python:3-slim
# Expose port 3000
EXPOSE 8000
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1
# Install pip requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Create and set the working directory
WORKDIR /app
COPY . /app
# Creates a non-root user and adds permission to access the /app folder
RUN adduser -u 5678 --disabled-password --gecos "" backend && chown -R backend /app
USER backend
# Start the application with Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "backend.wsgi"]
