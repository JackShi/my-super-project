#!/bin/bash

echo "🧪 运行后端测试..."

# 检查是否在项目根目录
if [ ! -f "CLAUDE.md" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 进入后端目录
cd 02-backend

# 检查虚拟环境
if [ ! -d "venv" ]; then
    echo "❌ 虚拟环境不存在，请先运行 ./05-scripts/setup.sh"
    exit 1
fi

# 激活虚拟环境
source venv/bin/activate

# 检查是否需要安装测试依赖
echo "🔍 检查测试依赖..."
pip install pytest-cov -q

# 运行测试
echo "🔍 运行后端API测试..."
python -m pytest tests/ -v --tb=short

# 如果pytest-cov可用，添加覆盖率
if python -c "import pytest_cov" 2>/dev/null; then
    echo "📊 运行带覆盖率的测试..."
    python -m pytest tests/ -v --tb=short --cov=app --cov-report=term-missing
    TEST_RESULT=$?
else
    echo "⚠️  pytest-cov不可用，跳过覆盖率检查"
    python -m pytest tests/ -v --tb=short
    TEST_RESULT=$?
fi

# 检查测试结果
if [ $TEST_RESULT -eq 0 ]; then
    echo "✅ 后端测试通过！"
else
    echo "❌ 后端测试失败！"
    exit 1
fi