#!/bin/bash

echo "=ζ „ϊ…§yξ..."

# ΐε/&(yξ9ξU
if [ ! -f "CLAUDE.md" ]; then
    echo "L χ(yξ9ξUΠLd,"
    exit 1
fi

echo "=' „ϊMο..."
cd 03-frontend
npm run build
if [ $? -ne 0 ]; then
    echo "L Mο„ϊ1%"
    exit 1
fi
cd ..

echo "= Αογ..."
cd 02-backend
source venv/bin/activate
python -m py_compile app/main.py
if [ $? -ne 0 ]; then
    echo "L ογΑ1%"
    exit 1
fi
cd ..

echo " „ϊ"
echo "=I Mο„ϊ§i: 03-frontend/dist/"
echo "=I ογςΑ"