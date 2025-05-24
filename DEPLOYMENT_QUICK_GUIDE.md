# HashPoint Deployment Quick Guide

## Step 1: Update the Build Command in Replit

1. Go to the "Deployment" tab in your Replit project:
   ![Deployment Tab](https://replit.dev-docs.com/images/deploy/deployment_settings.jpg)

2. In the deployment settings, change the Build Command from:  
   ```
   npm run build -- --bundle-node-modules
   ```
   To:
   ```
   npm run build
   ```

   **This is critical for successful deployment!**

## Step 2: Configure Secrets

Make sure you set up these environment secrets for production:

1. `DATABASE_URL` - Your PostgreSQL connection string
2. `SESSION_SECRET` - A secure random string for session security

## Step 3: Deploy

Click "Deploy" and wait for the deployment to complete.

For detailed deployment instructions, refer to `DEPLOYMENT_INSTRUCTIONS.md`.