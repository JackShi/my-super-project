# 🚀 超级全栈项目模板

一个为快速开发设计的全栈项目模板，专为与AI协作优化。

## ✨ 特性

- ⚡ **快速启动**: 一键安装和配置
- 🤖 **AI友好**: 完整的规范驱动开发结构  
- 🎨 **现代化栈**: React 18 + FastAPI + TypeScript
- 📦 **开箱即用**: 预配置开发环境
- 🔧 **自动化**: 丰富的工具脚本
- 🎯 **模板优先**: 可复制的项目基础架构

## 🚀 快速开始

### 1. 克隆项目
```bash
git clone https://github.com/JackShi/my-super-project.git my-new-project
cd my-new-project
```

### 2. 安装依赖
```bash
./05-scripts/setup.sh
```

### 3. 启动开发环境
```bash
./05-scripts/dev.sh
```

### 4. 访问应用
- 🌐 **前端**: http://localhost:3000
- 🐍 **后端**: http://localhost:8000  
- 📚 **API文档**: http://localhost:8000/docs
- ❤️ **健康检查**: http://localhost:8000/health

## 📁 项目结构

```
my-super-project/
│
├── 01-docs/                    # 📚 文档驱动核心
│   ├── 01-global/              # 🌍 全局规范标准
│   ├── 02-specs/               # 📋 功能规格定义
│   ├── 03-design/              # 🎨 设计决策文档
│   └── 04-operations/          # ⚙️ 运维部署指南
│
├── 02-backend/                 # 🐍 Python后端服务
│   ├── app/                    # FastAPI应用
│   ├── requirements.txt        # Python依赖
│   └── .env.example           # 环境变量模板
│
├── 03-frontend/                # ⚛️ React前端应用
│   ├── src/                   # 源代码
│   ├── package.json           # Node.js依赖
│   └── vite.config.ts         # Vite配置
│
├── 04-shared/                  # 🤝 前后端共享
│   ├── types/                 # TypeScript类型
│   └── constants/             # 配置常量
│
├── 05-scripts/                 # 🔧 自动化脚本
│   ├── setup.sh               # 环境初始化
│   ├── dev.sh                 # 开发环境
│   └── build.sh               # 生产构建
│
├── 06-templates/               # 📋 代码模板
│   ├── component.tsx.template # React组件
│   └── service.py.template    # Python服务
│
└── 07-docker/                  # 🐳 容器化配置
```

## 🛠️ 技术栈

### 后端 (02-backend/)
- **框架**: FastAPI + Pydantic v2
- **数据库**: SQLAlchemy 2.0 (异步)
- **开发**: Python 3.11+, Uvicorn
- **特性**: 自动API文档, CORS支持, 异步处理

### 前端 (03-frontend/)  
- **框架**: React 18 + TypeScript 5.0+
- **构建**: Vite + SWC
- **样式**: Tailwind CSS + Ant Design
- **状态**: Zustand (轻量级)
- **特性**: 热重载, 路径别名, API代理

## 🔧 开发命令

```bash
# 环境初始化
./05-scripts/setup.sh

# 启动开发环境（前后端并行）
./05-scripts/dev.sh

# 构建生产版本
./05-scripts/build.sh

# 单独启动前端
cd 03-frontend && npm run dev

# 单独启动后端  
cd 02-backend && source venv/bin/activate && python -m app.main
```

## 🧪 测试命令

```bash
# 运行所有测试
./05-scripts/test-all.sh

# 只运行后端测试
./05-scripts/test-backend.sh

# 只运行前端测试
./05-scripts/test-frontend.sh

# 生成覆盖率报告
./05-scripts/test-coverage.sh

# 安装Git测试钩子
./05-scripts/install-hooks.sh
```

## 📖 API接口

### 基础接口
- `GET /` - 根路径信息
- `GET /health` - 健康检查
- `GET /api/ping` - API连通测试
- `GET /api/info` - API详细信息

### API文档
- `GET /docs` - Swagger UI
- `GET /redoc` - ReDoc文档

## 🎯 如何使用此模板

### 复制模板
1. 克隆或下载此项目
2. 运行 `./05-scripts/setup.sh` 初始化
3. 运行 `./05-scripts/dev.sh` 启动开发

### 自定义开发
1. 查看 `CLAUDE.md` 了解AI协作规范
2. 阅读 `01-docs/03-design/ARCHITECTURE.md` 了解架构
3. 使用 `06-templates/` 中的模板快速创建组件
4. 参考 `01-docs/01-global/` 中的编码规范
5. 运行 `./05-scripts/install-hooks.sh` 开启自动测试

## 📋 环境要求

- **Node.js**: 18.0+
- **Python**: 3.11+
- **Git**: 任意版本

## 🧪 自动化测试

本项目采用**测试驱动开发**，确保代码质量：

### 测试策略
- ✅ **后端测试**: FastAPI端点、业务逻辑
- ✅ **前端测试**: React组件、用户交互
- ✅ **覆盖率要求**: 核心功能80%+
- ✅ **自动化**: Git提交/推送时自动测试

### 开发流程
1. 编写功能代码
2. 编写对应测试
3. 运行 `./05-scripts/test-all.sh` 验证
4. 提交代码（自动触发快速测试）
5. 推送代码（自动触发完整测试）

## 🤝 贡献

这是一个项目模板，适合：
- 快速启动新项目
- 学习现代化全栈开发
- 作为团队开发基础架构
- AI辅助开发的标准化模板
- **测试驱动开发**的最佳实践

## 📄 许可证

MIT License - 可自由使用和修改

---

**💡 提示**: 更多详细文档请查看 `01-docs/` 目录