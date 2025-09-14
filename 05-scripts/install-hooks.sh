#!/bin/bash

echo "🔧 安装Git Hooks..."

# 检查是否在项目根目录
if [ ! -f "CLAUDE.md" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 创建hooks目录
mkdir -p .git/hooks

# 创建pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

echo "🧪 Pre-commit: 运行快速测试..."

# 只运行快速的核心测试
cd 02-backend
source venv/bin/activate
python -m pytest tests/test_main.py::TestMainApp::test_root_endpoint_returns_correct_info -q
BACKEND_RESULT=$?

cd ../03-frontend  
npm run test -- --run --reporter=minimal App.test.tsx
FRONTEND_RESULT=$?

if [ $BACKEND_RESULT -ne 0 ] || [ $FRONTEND_RESULT -ne 0 ]; then
    echo "❌ 快速测试失败，提交被阻止"
    echo "💡 运行 './05-scripts/test-all.sh' 查看详细错误"
    exit 1
fi

echo "✅ 快速测试通过，允许提交"
EOF

# 创建pre-push hook
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash

echo "🧪 Pre-push: 运行完整测试套件..."

# 运行完整测试
./05-scripts/test-all.sh

if [ $? -ne 0 ]; then
    echo "❌ 测试失败，推送被阻止"
    echo "💡 请修复测试错误后再次推送"
    exit 1
fi

echo "✅ 所有测试通过，允许推送"
EOF

# 设置执行权限
chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/pre-push

echo "✅ Git Hooks安装完成！"
echo ""
echo "📋 安装的Hooks："
echo "👉 pre-commit: 提交前运行快速测试"
echo "👉 pre-push: 推送前运行完整测试"
echo ""
echo "💡 要跳过hooks，使用 --no-verify 参数"