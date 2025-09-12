from fastapi import APIRouter

router = APIRouter(prefix="/api", tags=["API"])

@router.get("/ping")
async def ping():
    """API连通性测试"""
    return {"message": "pong", "status": "ok"}

@router.get("/info")
async def get_api_info():
    """获取API信息"""
    return {
        "name": "超级项目API",
        "version": "1.0.0",
        "description": "现代化全栈项目的后端API服务",
        "endpoints": [
            "/api/ping",
            "/api/info",
            "/docs",
            "/health"
        ]
    }