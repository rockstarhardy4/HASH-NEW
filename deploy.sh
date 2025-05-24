#!/bin/bash

# Log the start of deployment
echo "Starting deployment process..."

# Build the application using our custom build script
echo "Building application..."
node build.js

# Handle any errors in the build process
if [ $? -ne 0 ]; then
  echo "Build failed. Please check the logs above."
  exit 1
fi

# Set environment variables if not already set
if [ -z "$SESSION_SECRET" ]; then
  echo "Warning: SESSION_SECRET not set. Using a random value (will be lost on restart)."
  export SESSION_SECRET=$(openssl rand -hex 32)
fi

echo "Starting application in production mode..."
npm run start

echo "Deployment complete!"