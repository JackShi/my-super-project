#!/bin/bash

echo "📦 构建超级项目..."

# 检查是否在项目根目录
if [ ! -f "CLAUDE.md" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

echo "🔧 构建前端..."
cd 03-frontend
npm run build
if [ $? -ne 0 ]; then
    echo "❌ 前端构建失败"
    exit 1
fi
cd ..

echo "🐍 验证后端代码..."
cd 02-backend
source venv/bin/activate
python -m py_compile app/main.py
if [ $? -ne 0 ]; then
    echo "❌ 后端代码验证失败"
    exit 1
fi
cd ..

echo "✅ 构建完成！"
echo "👉 前端构建产物: 03-frontend/dist/"
echo "👉 后端代码已验证"