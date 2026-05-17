#!/usr/bin/env bash
set -euo pipefail

# 基于脚本位置定位项目根目录 (scripts/ -> 项目根目录)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# 显式声明关键环境变量
export PORT=5000

# 清理 5000 端口残留进程（幂等性）
fuser -k 5000/tcp 2>/dev/null || true
sleep 1

# 启动静态文件服务器
cd "$PROJECT_DIR/project"
exec npx serve . -l 5000 -s
