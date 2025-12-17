#!/bin/bash

# 🌾 MapAgri - Quick Start Script
# Executa instalação e inicialização rápida

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}🌾 MapAgri - Quick Start${NC}\n"

# Verificar se já está na pasta do projeto
if [ ! -f "MapAgriApp/package.json" ]; then
    echo -e "${YELLOW}📥 Executando instalação completa...${NC}"
    ./install.sh
fi

# Entrar na pasta do app
cd MapAgriApp

echo -e "\n${BLUE}🚀 Iniciando MapAgri...${NC}\n"

# Verificar .env
if [ ! -f ".env" ]; then
    echo -e "${YELLOW}⚠️  Arquivo .env não encontrado!${NC}"
    echo -e "${BLUE}Criando .env com configurações padrão...${NC}"
    
    cat > .env << 'EOF'
# Supabase Configuration
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key

# App Configuration
APP_NAME=MapAgri
APP_VERSION=1.0.0
DEBUG_MODE=true

# GPS Configuration
GPS_ACCURACY_THRESHOLD=10
SYNC_INTERVAL=30000
EOF
    
    echo -e "${YELLOW}📝 Configure suas credenciais do Supabase no .env${NC}"
fi

# Verificar dependências
echo -e "${BLUE}📦 Verificando dependências...${NC}"
if [ ! -d "node_modules" ]; then
    npm install
fi

# Iniciar Metro Bundler
echo -e "\n${GREEN}🎯 Iniciando Metro Bundler...${NC}"
echo -e "${BLUE}Em outro terminal, execute:${NC}"
echo -e "${YELLOW}  npm run android${NC}  # Para Android"
echo -e "${YELLOW}  npm run ios${NC}      # Para iOS"

npm start

echo -e "\n${GREEN}✨ MapAgri Quick Start concluído! ✨${NC}"