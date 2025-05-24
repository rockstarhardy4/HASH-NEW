# Deployment Instructions for HashPoint

## Setting up the Database

For the application to use a persistent database in production, you need to set up a PostgreSQL database and provide its connection string as an environment variable.

### 1. Create a PostgreSQL Database

You can use any PostgreSQL provider (like Neon, Supabase, ElephantSQL, etc.)

### 2. Configure Required Secrets

In your deployment environment, you need to add the following secrets:

#### DATABASE_URL
Add a secret called `DATABASE_URL` with your PostgreSQL connection string:

```
DATABASE_URL=postgresql://username:password@hostname:port/database
```

#### SESSION_SECRET
Add a secret called `SESSION_SECRET` with a secure random string for session security:

```
SESSION_SECRET=your-secure-random-string
```

These should be set as secrets in your deployment platform.

### 3. Deployment Options

#### Option 1: Using the Deployment Script

For the easiest deployment experience, use the provided deployment script:

```
./deploy.sh
```

This script will:
1. Build the client files with Vite
2. Build the server with esbuild
3. Set necessary environment variables if missing
4. Start the application in production mode

#### Option 2: Manual Deployment

If you prefer manual deployment, follow these steps:

1. Build the application:
```
node build.js
```

2. Start the application:
```
npm run start
```

### 4. Fallback Mechanism

The application includes a fallback to in-memory storage if the DATABASE_URL is not available. However, this means:
- Data will be lost on application restart
- Only the default admin user will be available
- Uploaded images will not persist

For production use, always configure the DATABASE_URL secret.

## Important Deployment Notes

1. When deploying on Replit, you need to update the deployment build command in Replit's deployment settings:
   - Go to the "Deployment" tab in your Replit project
   - Click "Settings" at the top of the page
   - Under "Build command", change it from:
     ```
     npm run build -- --bundle-node-modules
     ```
     to:
     ```
     npm run build
     ```
   - OR simply:
     ```
     node build.js
     ```
   - Click "Save changes"

2. The SESSION_SECRET will be generated automatically if not provided, but this means sessions will be invalidated on each restart. For a better user experience, always configure a persistent SESSION_SECRET.

3. The application will work with or without a database connection, but for production use, a database is highly recommended.