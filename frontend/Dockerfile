# Stage 1: Build the React app with Vite
FROM node:lts-alpine as build

# Set environment variables
ENV NODE_ENV=production

# Create and set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY ["package.json", "package-lock.json*", "./"]

# Install dependencies
RUN npm install --silent

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Serve the static files with nginx
FROM nginx:alpine

# Copy the built files from the previous stage
COPY --from=build /usr/src/app/dist /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
