from pydantic_settings import BaseSettings
from typing import List
import os

class Settings(BaseSettings):
    """”(Mn¾n"""
    
    # ”(ú@Mn
    APP_NAME: str = "…§yîAPI"
    DEBUG: bool = True
    VERSION: str = "1.0.0"
    
    # pn“Mn
    DATABASE_URL: str = "sqlite+aiosqlite:///./app.db"
    
    # CORSMn
    ALLOWED_ORIGINS: List[str] = [
        "http://localhost:3000",
        "http://127.0.0.1:3000",
        "http://localhost:5173",
        "http://127.0.0.1:5173"
    ]
    
    # APIMn
    API_PREFIX: str = "/api"
    
    # å×Mn
    LOG_LEVEL: str = "INFO"
    
    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings()