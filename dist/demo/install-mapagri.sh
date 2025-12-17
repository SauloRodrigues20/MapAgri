#!/bin/bash

echo "🌾 MapAgri - Instalação Completa"
echo "================================"

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js não encontrado!"
    echo "📥 Instale: https://nodejs.org/"
    exit 1
fi

# Clonar projeto
echo "📥 Clonando MapAgri..."
git clone https://github.com/SauloRodrigues20/MapAgri.git
cd MapAgri

# Executar instalação automática
echo "🚀 Executando instalação automática..."
./install.sh

echo ""
echo "✅ MapAgri instalado com sucesso!"
echo ""
echo "📋 Próximos passos:"
echo "1. cd MapAgri/MapAgriApp"
echo "2. npm run android (se tiver Android Studio)"
echo "3. node scripts/web-simulator.js (para testar)"
echo ""
echo "🌾 MapAgri pronto para uso!"
