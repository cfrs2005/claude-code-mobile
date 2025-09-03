<div align="center">

# 📱 Claude Code Mobile Service

*A containerized service for mobile Claude Code access*

[![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)](https://hub.docker.com/r/cfrs2005/claude-code-mobile)
[![GitHub Release](https://img.shields.io/github/v/release/cfrs2005/claude-code-mobile)](https://github.com/cfrs2005/claude-code-mobile/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Happy-coder Compatible](https://img.shields.io/badge/Happy--coder-Compatible-green)](https://github.com/cfrs2005/happy-coder)

[**🇺🇸 English**](#english) | [**🇨🇳 中文**](#中文)

---

</div>

## English

### Overview

Claude Code Mobile Service bridges the gap between powerful AI coding assistance and mobile accessibility. This containerized solution allows developers to access Claude Code from their smartphones using the Happy-coder mobile interface, enabling coding workflows anywhere, anytime.

### ✨ Key Features

| Feature | Description |
|---------|-------------|
| 📱 **Mobile-First** | Full Claude Code functionality on mobile devices |
| 🐳 **Containerized** | One-click deployment with Docker |
| 🔧 **Auto-Setup** | Zero-configuration startup with intelligent automation |
| 💾 **Persistent State** | Authentication and project data survive restarts |
| 🚀 **Production Ready** | Multi-architecture Docker Hub images |
| 🔒 **Secure** | Token-based authentication with volume isolation |

### 🚀 Quick Start

#### Prerequisites
- Docker & Docker Compose
- Anthropic API token
- Mobile device with Happy app

#### Installation

**Option 1: From Docker Hub (Recommended)**
```bash
# Clone configuration
git clone https://github.com/cfrs2005/claude-code-mobile.git
cd claude-code-mobile

# Configure your API token
cp config.env.example config.env
nano config.env  # Add your ANTHROPIC_AUTH_TOKEN

# Start service
docker-compose -f docker-compose.prod.yml up -d
```

**Option 2: Build from source**
```bash
git clone https://github.com/cfrs2005/claude-code-mobile.git
cd claude-code-mobile
cp config.env.example config.env
# Edit config.env with your token
docker-compose up --build -d
```

#### Mobile Connection
1. Install Happy app on your device
2. Connect to your server's IP address
3. Start coding on mobile!

### 🏗️ Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Mobile App    │────│   Happy-coder    │────│   Claude Code   │
│    (Happy)      │    │   (Web Bridge)   │    │     (AI CLI)    │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │
                       ┌────────▼────────┐
                       │ Docker Container │
                       │  - Node.js 20    │
                       │  - Auto Setup    │
                       │  - Persistence   │
                       └─────────────────┘
```

### 🔧 Configuration

#### Environment Variables (`config.env`)
```env
# Required
ANTHROPIC_AUTH_TOKEN=your_anthropic_api_token_here

# Optional  
ANTHROPIC_BASE_URL=https://api.anthropic.com
CLAUDE_CODE_AUTO_START=true
```

#### Volume Mounts
| Local Path | Container Path | Purpose |
|------------|---------------|---------|
| `./workspace/` | `/workspace` | Your project files |
| `./claude-config/` | `/root/.claude/` | Claude settings |
| `./happy-auth/` | `/root/.happy/` | Authentication data |
| `config.env` | `/config/config.env` | Environment variables |

### 📚 Advanced Usage

#### Development Commands
```bash
# View service logs
docker-compose logs -f

# Access container shell
docker exec -it claude-code-mobile_happycoder_1 bash

# Restart service  
docker-compose restart

# Update to latest version
docker-compose pull && docker-compose up -d
```

#### Troubleshooting
| Issue | Solution |
|-------|----------|
| Service won't start | Check API token in `config.env` |
| Mobile can't connect | Verify firewall settings and container status |
| Authentication fails | Delete `./happy-auth/` and restart |

### 🚢 Production Deployment

For production environments, use the pre-built Docker Hub images:

```yaml
# docker-compose.prod.yml
version: '3.8'
services:
  happycoder:
    image: cfrs2005/claude-code-mobile:latest
    # ... volume mounts and config
```

### 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open Pull Request

### 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 中文

### 概述

Claude Code Mobile Service 是一个容器化服务，让开发者能够通过手机访问 Claude Code AI 编程助手。通过 Happy-coder 移动界面，实现随时随地的智能编程体验。

### ✨ 主要特性

| 特性 | 说明 |
|------|------|
| 📱 **移动优先** | 手机端完整的 Claude Code 功能 |
| 🐳 **容器化部署** | Docker 一键部署 |
| 🔧 **自动配置** | 零配置启动，智能自动化 |
| 💾 **状态持久化** | 认证和项目数据重启后保持 |
| 🚀 **生产就绪** | 多架构 Docker Hub 镜像 |
| 🔒 **安全可靠** | 基于 Token 的认证和卷隔离 |

### 🚀 快速开始

#### 系统要求
- Docker 和 Docker Compose
- Anthropic API 令牌
- 安装了 Happy 应用的手机

#### 安装部署

**方式一：使用 Docker Hub 镜像（推荐）**
```bash
# 克隆配置文件
git clone https://github.com/cfrs2005/claude-code-mobile.git
cd claude-code-mobile

# 配置 API 令牌
cp config.env.example config.env
nano config.env  # 添加你的 ANTHROPIC_AUTH_TOKEN

# 启动服务
docker-compose -f docker-compose.prod.yml up -d
```

**方式二：源码构建**
```bash
git clone https://github.com/cfrs2005/claude-code-mobile.git
cd claude-code-mobile
cp config.env.example config.env
# 编辑 config.env 添加你的令牌
docker-compose up --build -d
```

#### 手机连接
1. 在手机上安装 Happy 应用
2. 连接到你服务器的 IP 地址
3. 开始移动端编程！

### 🏗️ 系统架构

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   手机应用      │────│   Happy-coder    │────│   Claude Code   │
│    (Happy)      │    │   (网页桥接)     │    │   (AI 命令行)   │
└─────────────────┘    └──────────────────┘    └─────────────────┘
                                │
                       ┌────────▼────────┐
                       │ Docker 容器     │
                       │  - Node.js 20    │
                       │  - 自动配置      │
                       │  - 数据持久化    │
                       └─────────────────┘
```

### 🔧 配置说明

#### 环境变量配置 (`config.env`)
```env
# 必填项
ANTHROPIC_AUTH_TOKEN=your_anthropic_api_token_here

# 可选项
ANTHROPIC_BASE_URL=https://api.anthropic.com  
CLAUDE_CODE_AUTO_START=true
```

#### 数据卷挂载
| 本地路径 | 容器路径 | 用途 |
|----------|----------|------|
| `./workspace/` | `/workspace` | 你的项目文件 |
| `./claude-config/` | `/root/.claude/` | Claude 设置 |
| `./happy-auth/` | `/root/.happy/` | 认证数据 |
| `config.env` | `/config/config.env` | 环境变量 |

### 📚 高级用法

#### 开发命令
```bash
# 查看服务日志
docker-compose logs -f

# 进入容器命令行
docker exec -it claude-code-mobile_happycoder_1 bash

# 重启服务
docker-compose restart

# 更新到最新版本
docker-compose pull && docker-compose up -d
```

#### 故障排除
| 问题 | 解决方案 |
|------|----------|
| 服务无法启动 | 检查 `config.env` 中的 API 令牌 |
| 手机无法连接 | 验证防火墙设置和容器状态 |
| 认证失败 | 删除 `./happy-auth/` 目录并重启 |

### 🚢 生产环境部署

生产环境建议使用预构建的 Docker Hub 镜像：

```bash
# 使用生产配置文件
docker-compose -f docker-compose.prod.yml up -d

# 检查服务状态
docker-compose ps
```

### 🤝 参与贡献

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/amazing-feature`
3. 提交更改：`git commit -m 'Add amazing feature'`
4. 推送分支：`git push origin feature/amazing-feature`
5. 提交 Pull Request

### 📞 支持与反馈

- 🐛 [报告问题](https://github.com/cfrs2005/claude-code-mobile/issues)
- 💬 [功能建议](https://github.com/cfrs2005/claude-code-mobile/discussions)
- 📖 [查看文档](https://github.com/cfrs2005/claude-code-mobile/wiki)

### 📄 开源协议

本项目采用 MIT 协议 - 查看 [LICENSE](LICENSE) 文件了解详情。

---

<div align="center">

**⭐ 如果这个项目对你有帮助，请给个 Star！**

Made with ❤️ by [cfrs2005](https://github.com/cfrs2005)

</div>