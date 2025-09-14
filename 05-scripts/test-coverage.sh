#!/bin/bash

echo "📊 生成测试覆盖率报告..."

# 检查是否在项目根目录
if [ ! -f "CLAUDE.md" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 后端覆盖率
echo "📍 生成后端覆盖率报告..."
cd 02-backend
source venv/bin/activate

# 确保pytest-cov已安装
pip install pytest-cov -q

# 尝试运行带覆盖率的测试
if python -c "import pytest_cov" 2>/dev/null; then
    python -m pytest tests/ --cov=app --cov-report=html:htmlcov --cov-report=term-missing --quiet
    BACKEND_COV_RESULT=$?
else
    echo "⚠️  pytest-cov不可用，运行普通测试"
    python -m pytest tests/ --quiet
    BACKEND_COV_RESULT=$?
fi
cd ..

# 前端覆盖率
echo "📍 生成前端覆盖率报告..."
cd 03-frontend

# 检查测试依赖
if ! npm list vitest &>/dev/null; then
    echo "🔍 安装测试依赖..."
    npm install vitest @testing-library/react @testing-library/jest-dom @testing-library/user-event jsdom --save-dev
fi

# 尝试运行覆盖率测试
if npm list @vitest/coverage-v8 &>/dev/null; then
    npm run test:coverage -- --run --reporter=verbose
    FRONTEND_COV_RESULT=$?
else
    echo "⚠️  覆盖率工具不可用，运行普通测试"
    npm run test -- --run --reporter=verbose
    FRONTEND_COV_RESULT=$?
fi
cd ..

echo ""
if [ $BACKEND_COV_RESULT -eq 0 ] && [ $FRONTEND_COV_RESULT -eq 0 ]; then
    echo "✅ 测试报告生成完成！"
    echo ""
    echo "📂 报告位置："
    if [ -f "02-backend/htmlcov/index.html" ]; then
        echo "👉 后端HTML报告: 02-backend/htmlcov/index.html"
    fi
    echo "👉 前端覆盖率: 查看上方输出"
    echo ""
    echo "🎯 覆盖率目标: 80%+"
else
    echo "❌ 测试报告生成失败"
    exit 1
fi