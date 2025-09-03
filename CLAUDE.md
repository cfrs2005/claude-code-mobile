# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a containerized service that provides mobile access to Claude Code through Happy-coder. The service runs Claude Code in a Docker container and enables remote access via the Happy mobile app.

## Architecture

- **Base Image**: node:20-alpine with Claude Code and happy-coder installed
- **Core Services**: Claude Code CLI + Happy-coder mobile wrapper
- **Data Persistence**: Authentication and configuration mounted as Docker volumes
- **Working Directory**: `/workspace` - all project files should be placed here
- **Mobile Access**: Happy app connects to containerized Claude Code service

## Key Files

- `Dockerfile`: Container build configuration
- `entrypoint.sh`: Automated startup with expect script for interactive prompts  
- `docker-compose.yml`: Development service configuration
- `docker-compose.prod.yml`: Production service configuration using Docker Hub image
- `config.env.example`: Template for environment variables and API authentication
- Volume directories: `./claude-config/`, `./happy-auth/`, `./workspace/` (auto-created)

## Development Commands

### Container Management
```bash
# Build and start service
docker-compose up --build

# Rebuild image (required after script changes)
docker-compose build

# Start service (if already built)
docker-compose up

# Stop service
docker-compose down

# View logs
docker-compose logs -f
```

### Manual Access
```bash
# Execute commands inside running container
docker exec -it happycoderimage_happycoder_1 bash

# Start Happy manually (if auto-start fails)
docker exec -it happycoderimage_happycoder_1 happy
```

## Configuration

### Authentication Setup
1. API credentials in `config.env`
2. Claude authentication persisted in `./claude-config/`
3. Happy authentication persisted in `./happy-auth/`

### Project Files
- Place all development files in `./workspace/` directory
- This directory is mounted to `/workspace` inside container
- Happy service runs from `/workspace` for project access

## Service Behavior

- **Auto-initialization**: entrypoint.simple.sh handles interactive prompts automatically
- **Theme Selection**: Auto-selects dark mode
- **Security Prompts**: Auto-accepts Claude Code security notes
- **Persistent State**: Authentication and settings survive container restarts
- **Working Directory**: Service starts in `/workspace` for immediate project access

## Container Rebuild Requirements

Script modifications in `entrypoint.sh` require image rebuild:
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up
```

Volume-mounted files (`config.env`, user configs) update without rebuild.

## Production Deployment

Use pre-built Docker Hub image:
```bash
# Copy config template
cp config.env.example config.env
# Edit with your API token
nano config.env
# Start with production compose
docker-compose -f docker-compose.prod.yml up
```