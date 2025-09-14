#!/bin/bash

echo "🧪 运行前端测试..."

# 检查是否在项目根目录
if [ ! -f "CLAUDE.md" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 进入前端目录
cd 03-frontend

# 检查node_modules
if [ ! -d "node_modules" ]; then
    echo "❌ 前端依赖未安装，请先运行 ./05-scripts/setup.sh"
    exit 1
fi

# 检查测试依赖
if ! npm list vitest &>/dev/null; then
    echo "🔍 安装测试依赖..."
    npm install vitest @testing-library/react @testing-library/jest-dom @testing-library/user-event jsdom --save-dev
fi

# 运行测试
echo "🔍 运行前端组件测试..."
npm run test -- --run --reporter=verbose

# 检查测试结果
if [ $? -eq 0 ]; then
    echo "✅ 前端测试通过！"
else
    echo "❌ 前端测试失败！"
    exit 1
fi