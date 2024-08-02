# official Node.js runtime as a parent image
FROM node:lts-alpine
# Set environment variables
ENV NODE_ENV=production
# Create and set the working directory
WORKDIR /usr/src/app
# Copy package.json and install dependencies
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
# Copy the rest of the application code
COPY . .
# Expose port 3000
EXPOSE 3000
# Change ownership to non-root user
RUN chown -R node /usr/src/app
USER node
# Start the application
CMD ["npm", "start"]
