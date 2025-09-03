# Release v1.0.0

## 🚀 What's New

This is the initial release of Claude Code Mobile Service - a containerized solution for accessing Claude Code from mobile devices.

## ✨ Features

- **📱 Mobile Access**: Use Claude Code on your phone via Happy-coder app
- **🐳 Containerized**: Easy deployment with Docker and Docker Compose  
- **🔧 Auto-Setup**: Handles interactive initialization automatically
- **💾 Persistent Data**: Authentication and settings survive container restarts
- **🚀 Quick Start**: One-command deployment

## 🔧 Quick Start

1. Clone repository and copy config:
```bash
git clone https://github.com/yourusername/claude-code-mobile
cd claude-code-mobile
cp config.env.example config.env
```

2. Add your Anthropic API token to `config.env`

3. Start the service:
```bash
docker-compose up --build
```

4. Connect with Happy mobile app!

## 📦 Docker Hub

Pre-built images available:
- `yourusername/claude-code-mobile:latest`  
- `yourusername/claude-code-mobile:v1.0.0`

Use with production compose file:
```bash
docker-compose -f docker-compose.prod.yml up
```

## 📋 What's Included

- Automated Claude Code installation
- Happy-coder mobile wrapper setup
- Interactive prompt handling with expect scripts
- Volume persistence for auth and config
- GitHub Actions for automated Docker builds

## 🔒 Security Notes

- Never commit your actual API tokens
- Keep `config.env` and auth directories private
- Review container logs for any sensitive data leaks

## 🐛 Known Issues

None at this time.

## 📖 Full Documentation

See [README.md](README.md) for complete setup and usage instructions.