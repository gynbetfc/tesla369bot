#!/bin/bash
echo "⚡ TESLA 369 BOT"
echo "================"
echo "🛑 Parando bots anteriores..."
pkill -f python 2>/dev/null
sleep 1
echo "📦 Atualizando Termux..."
pkg update -y -qq && pkg upgrade -y -qq
echo "🐍 Instalando Python..."
pkg install python -y -qq
echo "📦 Instalando dependencias..."
pip install -q flask api-iqoption-faria requests
echo "📥 Baixando bot..."
echo "🚀 Iniciando..."
echo ""

# Baixar e executar o script Python de inicializacao
python <(curl -s https://raw.githubusercontent.com/gynbetfc/tesla369bot/main/boot.py)

echo ""
echo "✅ BOT RODANDO!"
echo "📱 Chrome foi aberto automaticamente"
echo "🔒 Trave o Termux: notificacao > cadeado"
echo "🛑 Parar: pkill -f python"
while true; do sleep 60; done
