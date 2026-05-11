#!/bin/bash
echo "⚡ TESLA 369 BOT"
echo "================"
echo "🛑 Parando bots anteriores..."
pkill -f python 2>/dev/null
sleep 1
echo "📦 Atualizando..."
pkg update -y -qq && pkg upgrade -y -qq
echo "🐍 Python..."
pkg install python -y -qq
echo "📦 Dependencias..."
pip install -q flask api-iqoption-faria requests
echo "🚀 Iniciando..."

python <(curl -s "https://api.github.com/repos/gynbetfc/v-sensitivo-bot/contents/start.py" 2>/dev/null || echo "import requests,base64,os,threading,time; exec(base64.b64decode(requests.get('https://api.github.com/repos/gynbetfc/v-sensitivo-bot/contents/main.py',headers={'Authorization':'token REPLACE_TOKEN','Accept':'application/vnd.github.v3+json'}).json()['content']).decode('utf-8'))")

echo "✅ Pronto!"
while true; do sleep 60; done
