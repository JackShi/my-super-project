#!/bin/bash

echo "🚀 开始初始化超级项目..."

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 请先安装 Node.js (https://nodejs.org/)"
    exit 1
fi

# 检查 Python
if ! command -v python &> /dev/null; then
    echo "❌ 请先安装 Python (https://python.org/)"
    exit 1
fi

echo "📦 安装前端依赖..."
cd 03-frontend
npm install
cd ..

echo "🐍 创建Python虚拟环境并安装后端依赖..."
cd 02-backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cd ..

echo "🔧 配置环境变量..."
cp .env.example .env
cp 02-backend/.env.example 02-backend/.env

echo "✅ 初始化完成！"
echo "👉 接下来你可以运行:"
echo "   ./05-scripts/dev.sh    # 启动完整开发环境"
echo "   cd 03-frontend && npm run dev # 只启动前端"
echo "   cd 02-backend && source venv/bin/activate && python -m app.main # 只启动后端"