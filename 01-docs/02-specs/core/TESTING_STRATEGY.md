# 🧪 自动化测试策略

## 🎯 测试目标
- **效率优先**：快速验证代码是否正常运行
- **实用主义**：重点测试核心功能，不过度测试
- **自动化驱动**：每次代码变更后自动运行测试
- **快速反馈**：开发者只需看测试结果即可判断代码质量

## 📋 测试分层策略

### 1. 单元测试 (Unit Tests)
- **后端**：测试API端点、业务逻辑、数据处理
- **前端**：测试组件渲染、用户交互、状态管理
- **覆盖率目标**：核心功能 80%+

### 2. 集成测试 (Integration Tests)  
- **API集成**：前端调用后端API的完整流程
- **数据库集成**：数据持久化和查询功能
- **第三方服务**：外部API调用（如有）

### 3. E2E测试 (End-to-End Tests)
- **关键用户流程**：主要业务场景的完整流程
- **跨浏览器兼容**：确保在主流浏览器正常工作

## 🔧 测试工具链

### 后端测试 (Python)
```yaml
框架: pytest + pytest-asyncio
HTTP测试: httpx + TestClient
数据库: SQLite内存数据库
Mock: unittest.mock
覆盖率: pytest-cov
```

### 前端测试 (JavaScript/TypeScript)
```yaml
框架: Jest + Testing Library
组件测试: @testing-library/react
用户交互: @testing-library/user-event
Mock: Jest mocks
覆盖率: Jest内置
```

## ⚡ 测试原则

### 快速原则
- 所有测试在30秒内完成
- 使用内存数据库，避免真实数据库操作
- Mock外部依赖，专注测试自身逻辑

### 实用原则
- 优先测试核心业务逻辑
- 不测试第三方库的功能
- 不测试简单的getter/setter
- 重点测试用户可见的功能

### 自动化原则
- Git commit前自动运行测试
- 代码变更触发完整测试套件
- 测试失败自动阻止提交

## 📝 测试用例设计

### API测试用例
- ✅ 正常请求返回正确响应
- ✅ 错误请求返回正确错误码
- ✅ 参数验证功能正常
- ✅ 认证授权正常工作

### 前端测试用例
- ✅ 组件正常渲染
- ✅ 用户交互触发正确行为
- ✅ API调用处理正确
- ✅ 错误状态显示正确

## 🚀 测试命令

```bash
# 运行所有测试
npm run test

# 后端测试
./05-scripts/test-backend.sh

# 前端测试  
./05-scripts/test-frontend.sh

# 测试覆盖率报告
./05-scripts/test-coverage.sh
```

## 📊 测试报告

### 成功标准
- ✅ 所有测试用例通过
- ✅ 核心功能覆盖率 > 80%
- ✅ 测试运行时间 < 30秒
- ✅ 无明显性能问题

### 失败处理
- ❌ 测试失败时显示详细错误信息
- ❌ 提供修复建议和相关文档链接
- ❌ 自动阻止不合格代码提交

## 🔄 持续集成

### Git Hooks
- **pre-commit**: 运行快速测试
- **pre-push**: 运行完整测试套件

### 开发流程
1. 编写功能代码
2. 编写对应测试
3. 运行测试确保通过
4. 提交代码（自动触发测试）
5. 推送到远程仓库

## 💡 测试最佳实践

### 测试命名
```python
# 好的测试命名
def test_api_ping_returns_pong():
def test_user_login_with_valid_credentials():
def test_create_item_with_invalid_data_returns_400():
```

### 测试结构
```python
# AAA模式：Arrange, Act, Assert
def test_create_user():
    # Arrange - 准备测试数据
    user_data = {"name": "test", "email": "test@example.com"}
    
    # Act - 执行被测试的操作
    response = client.post("/users", json=user_data)
    
    # Assert - 验证结果
    assert response.status_code == 201
    assert response.json()["name"] == "test"
```

### 测试数据管理
- 使用工厂函数生成测试数据
- 每个测试独立，不依赖其他测试
- 测试后清理数据，避免污染