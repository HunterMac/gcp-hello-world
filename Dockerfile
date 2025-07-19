# Dockerfile
# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if any) to install dependencies
# This step is often done separately to leverage Docker cache
COPY package*.json ./

# Install app dependencies
# For this minimal app, there are no external dependencies,
# but this is good practice for future expansion.
RUN npm install --omit=dev

# Copy the application code into the container
COPY . .

# Cloud Run services must listen on the port specified by the PORT environment variable.
# The default is 8080.
ENV PORT 8080
EXPOSE 8080

# Run the application
CMD ["node", "app.js"]