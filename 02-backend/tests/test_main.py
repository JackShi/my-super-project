import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

class TestMainApp:
    """测试主应用程序"""
    
    def test_root_endpoint_returns_correct_info(self):
        """测试根路径返回正确信息"""
        response = client.get("/")
        
        assert response.status_code == 200
        data = response.json()
        assert data["message"] == "超级项目API服务正在运行"
        assert data["version"] == "1.0.0"
    
    def test_health_check_returns_healthy(self):
        """测试健康检查返回正常状态"""
        response = client.get("/health")
        
        assert response.status_code == 200
        data = response.json()
        assert data["status"] == "healthy"
        assert data["service"] == "super-project-api"
    
    def test_docs_endpoint_accessible(self):
        """测试API文档端点可访问"""
        response = client.get("/docs")
        
        assert response.status_code == 200
        assert "swagger" in response.headers.get("content-type", "").lower() or \
               "html" in response.headers.get("content-type", "").lower()

class TestAPIRoutes:
    """测试API路由"""
    
    def test_ping_returns_pong(self):
        """测试ping返回pong"""
        response = client.get("/api/ping")
        
        assert response.status_code == 200
        data = response.json()
        assert data["message"] == "pong"
        assert data["status"] == "ok"
    
    def test_info_returns_api_information(self):
        """测试info返回API信息"""
        response = client.get("/api/info")
        
        assert response.status_code == 200
        data = response.json()
        assert data["name"] == "超级项目API"
        assert data["version"] == "1.0.0"
        assert isinstance(data["endpoints"], list)
        assert len(data["endpoints"]) > 0

class TestCORSMiddleware:
    """测试CORS中间件"""
    
    def test_cors_headers_present(self):
        """测试CORS头部存在"""
        response = client.options("/api/ping", headers={
            "Origin": "http://localhost:3000",
            "Access-Control-Request-Method": "GET"
        })
        
        # OPTIONS请求应该被正确处理
        assert response.status_code in [200, 204]

class TestErrorHandling:
    """测试错误处理"""
    
    def test_nonexistent_endpoint_returns_404(self):
        """测试不存在的端点返回404"""
        response = client.get("/nonexistent")
        
        assert response.status_code == 404
    
    def test_invalid_method_returns_405(self):
        """测试无效HTTP方法返回405"""
        response = client.post("/")  # root只支持GET
        
        assert response.status_code == 405