# 🏗️ 系统架构设计文档
## 📁 项目结构架构
### 整体架构模式
前后端分离架构 + 文档驱动开发 + AI协作优化

```text
project-name/
│
├── 01-docs/                           # 📚 文档驱动核心（AI协作基础）
│   ├── 01-global/                     # 🌍 全局规范标准
│   ├── 02-specs/                      # 📋 功能规格定义
│   ├── 03-design/                     # 🎨 设计决策文档
│   └── 04-operations/                 # ⚙️ 运维部署指南
│
├── 02-backend/                        # 🐍 Python后端服务（独立进程）
│   └── app/
│       ├── api/                       # 🚀 API路由层
│       ├── services/                  # ⚡ 业务逻辑层
│       ├── models/                    # 🗄️ 数据模型层
│       └── utils/                     # 🛠️ 工具函数库
│
├── 03-frontend/                       # ⚛️ React前端应用（独立进程）
│   └── src/
│       ├── components/                # 🧩 UI组件库
│       ├── pages/                     # 🖥️ 页面容器
│       ├── hooks/                     # 🎣 自定义Hooks
│       ├── services/                  # 🔌 API服务层
│       └── store/                     # 🗃️ 状态管理层
│
├── 04-shared/                         # 🤝 前后端共享资源
│   ├── types/                         # 📝 TypeScript类型定义
│   └── constants/                     # 🔧 配置常量
│
├── 05-scripts/                        # 🔧 自动化工具链
│   ├── setup.sh                       # 🏗️ 环境初始化
│   ├── dev.sh                         # 🚀 开发环境启动
│   ├── build.sh                       # 📦 生产构建
│   └── deploy.sh                      # ☁️ 部署发布
│
├── 06-templates/                         # 📋 代码生成模板
│   ├── component.tsx.template         # 🧩 React组件模板
│   ├── page.tsx.template              # 🖥️ 页面组件模板
│   ├── hook.ts.template               # 🎣 Custom Hook模板
│   ├── api_route.py.template          # 🐍 FastAPI路由模板
│   └── service.py.template            # ⚡ 业务服务模板
│
└── 07-docker/                            # 🐳 容器化配置
    ├── docker-compose.yml             # 🏠 开发环境
    └── docker-compose.prod.yml        # 🌐 生产环境
```


## 🎯 架构设计原则
### 1. 数字前缀编号系统
- 01-docs/ - 文档优先，AI协作基础
- 02-backend/ - 后端服务，独立进程=
- 03-frontend/ - 前端应用，独立进程
- 04-shared/ - 共享资源，类型安全
- 05-scripts/ - 自动化工具，效率提升

### 2. 前后端完全分离
- 独立开发：前后端可并行开发
- 独立部署：支持分别部署和扩展
- API驱动：通过RESTful API通信
- 技术栈独立：可独立升级技术栈

### 3. 分层架构设计
后端分层：
- 路由层（API）→ 业务层（Services）→ 数据层（Models）→ 工具层（Utils）

前端分层：
- 页面层（Pages）→ 组件层（Components）→ 状态层（Store）→ 服务层（Services）

### 4. 文档驱动开发
- 规范先行：开发前先定义文档
- AI友好：结构化文档便于AI理解
- 知识传承：降低团队协作成本

## 🔗 技术栈架构
### 后端技术栈
```yaml
框架: FastAPI + Pydantic v2
数据库: SQLAlchemy 2.0 (异步ORM)
运行时: Python 3.11+
验证: Pydantic模型验证
异步: async/await全异步架构
API: OpenAPI + Swagger UI自动文档
```

### 前端技术栈
```yaml
框架: React 18 + TypeScript 5.0+
构建: Vite + SWC
样式: Tailwind CSS + CSS Modules
状态: Zustand (轻量状态管理)
UI库: Ant Design组件库
路由: React Router v6
HTTP: Axios + React Query
```

### 开发工具链
```yaml
IDE: VS Code + 统一配置
包管理: pip + npm
容器: Docker + Docker Compose
脚本: Bash自动化脚本
质量: ESLint + Prettier + Pre-commit
```

## 📊 数据流架构
### API通信流程
```text
前端组件 → React Hook → API Service → Axios → 
FastAPI路由 → Pydantic验证 → Service层 → 
SQLAlchemy模型 → 数据库 → 返回响应
```

### 状态管理流程
```text
组件UI → 用户操作 → Zustand Store更新 → 
API调用 → 更新Store → 组件重新渲染
```

## 🚀 部署架构
### 开发环境
```yaml
模式: 前后端独立进程
后端: Uvicorn热重载 (端口8000)
前端: Vite开发服务器 (端口3000)
数据库: SQLite (文件数据库)
```

### 生产环境
```yaml
模式: Docker容器化
后端: Gunicorn + Uvicorn Workers
前端: Nginx静态文件服务
数据库: PostgreSQL (容器化)
网络: Nginx反向代理
```

## 🎨 设计决策说明
### 为什么选择数字前缀？
- 强制排序：确保重要的文档优先
- 视觉清晰：在文件浏览器中自然排序
- AI友好：明确的优先级和阅读顺序

### 为什么前后端完全分离？
- 部署灵活：支持独立扩展和部署
- 技术自由：可独立选择和技术演进

### 为什么选择这些技术栈？
- 现代化：选择当前最主流和活跃的技术
- 开发体验：优秀的开发工具和生态
- 性能：异步架构和现代构建工具
- 类型安全：全面的TypeScript支持

## 📈 可扩展性设计
### 水平扩展
- 无状态API服务，可轻松水平扩展
- 前端静态资源，CDN加速支持
- 数据库读写分离支持

### 垂直扩展
- 模块化架构，易于功能扩展
- 插件化设计，可添加新功能模块
- 配置驱动，可通过配置启用功能

## 🔧 运维架构
### 监控日志
- 结构化日志记录
- 性能监控支持
- 错误追踪集成

### 配置管理
- 环境变量配置
- 多环境支持（dev/staging/prod）
- 密钥安全管理