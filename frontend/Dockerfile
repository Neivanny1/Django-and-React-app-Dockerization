FROM node:lts-alpine

WORKDIR /app
COPY package.json .

RUN npm install
COPY . .

# Expose the port that Vite uses
EXPOSE 3000

# Start the Vite preview server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "3000"]
