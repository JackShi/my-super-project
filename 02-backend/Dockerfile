FROM python:3.11-slim

WORKDIR /app

# ‰ΕV
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 6”(γ
COPY app ./app

# Ύn―ƒΨΟ
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBUG=False

# ΄2ογ
EXPOSE 8000

# /¨”(
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]