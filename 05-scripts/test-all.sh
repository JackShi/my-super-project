#!/bin/bash

echo "🧪 运行全部测试套件..."

# 检查是否在项目根目录
if [ ! -f "CLAUDE.md" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 记录开始时间
START_TIME=$(date +%s)

# 运行后端测试
echo "📍 第1步：运行后端测试"
./05-scripts/test-backend.sh
BACKEND_RESULT=$?

if [ $BACKEND_RESULT -ne 0 ]; then
    echo "❌ 后端测试失败，停止测试"
    exit 1
fi

echo ""

# 运行前端测试
echo "📍 第2步：运行前端测试"  
./05-scripts/test-frontend.sh
FRONTEND_RESULT=$?

if [ $FRONTEND_RESULT -ne 0 ]; then
    echo "❌ 前端测试失败，停止测试"
    exit 1
fi

# 计算总耗时
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo ""
echo "🎉 所有测试通过！"
echo "⏱️  总耗时: ${DURATION}秒"
echo "✅ 后端测试: 通过"
echo "✅ 前端测试: 通过"
echo ""
echo "📊 测试覆盖率报告已生成"
echo "👉 后端覆盖率: 02-backend/htmlcov/index.html"
echo "👉 前端覆盖率: 运行 'cd 03-frontend && npm run test:coverage' 查看"