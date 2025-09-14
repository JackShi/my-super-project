from pydantic_settings import BaseSettings
from pydantic import ConfigDict
from typing import List
import os

class Settings(BaseSettings):
    """应用配置设置"""
    
    model_config = ConfigDict(env_file=".env", case_sensitive=True, extra="ignore")
    
    # 应用基础配置
    APP_NAME: str = "超级项目API"
    DEBUG: bool = True
    VERSION: str = "1.0.0"
    
    # 数据库配置
    DATABASE_URL: str = "sqlite+aiosqlite:///./app.db"
    
    # CORS配置 - 直接使用环境变量名称
    ALLOWED_ORIGINS: str = "http://localhost:3000,http://127.0.0.1:3000,http://localhost:5173,http://127.0.0.1:5173"
    
    # API配置
    API_PREFIX: str = "/api"
    
    # 日志配置
    LOG_LEVEL: str = "INFO"
    
    def get_allowed_origins(self) -> List[str]:
        """将CORS配置字符串转换为列表"""
        return [origin.strip() for origin in self.ALLOWED_ORIGINS.split(",")]

settings = Settings()