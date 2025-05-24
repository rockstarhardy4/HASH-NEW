#!/usr/bin/env node

import { execSync } from 'child_process';

console.log('Building client...');
execSync('vite build', { stdio: 'inherit' });

console.log('Building server...');
execSync('esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist', 
  { stdio: 'inherit' });

console.log('Build completed successfully!');