#!/bin/bash

echo "=� ����y�..."

# ��/&(y�9�U
if [ ! -f "CLAUDE.md" ]; then
    echo "L �(y�9�U�Ld,"
    exit 1
fi

echo "=' ��M�..."
cd 03-frontend
npm run build
if [ $? -ne 0 ]; then
    echo "L M��1%"
    exit 1
fi
cd ..

echo "= ����..."
cd 02-backend
source venv/bin/activate
python -m py_compile app/main.py
if [ $? -ne 0 ]; then
    echo "L ����1%"
    exit 1
fi
cd ..

echo " ���"
echo "=I M���i: 03-frontend/dist/"
echo "=I ����"