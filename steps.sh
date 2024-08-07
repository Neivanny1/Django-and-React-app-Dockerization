docker network create database
docker run --name my-postgres -e POSTGRES_USER=backend -e POSTGRES_PASSWORD=backend -d --network=database postgres
docker build -t todo_backend:v1 .
docker run --name todo_backend -p 8000:8000 --network=database -d todo_backend:v1

# FRONTEND BUILDS
docker build -t todo_fronted:v1 .
docker run --name todo_frontend -d -p 3000:3000 todo_frontend:v1
