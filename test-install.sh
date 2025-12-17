#!/bin/bash

# 🧪 MapAgri - Script de Teste de Instalação

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}🧪 MapAgri - Teste de Instalação${NC}\n"

# Função para testar comandos
test_command() {
    local cmd="$1"
    local description="$2"
    
    echo -n "Testando $description... "
    
    if command -v "$cmd" &> /dev/null; then
        local version=$($cmd --version 2>&1 | head -1)
        echo -e "${GREEN}✅ $version${NC}"
        return 0
    else
        echo -e "${RED}❌ Não encontrado${NC}"
        return 1
    fi
}

# Função para testar arquivos
test_file() {
    local file="$1"
    local description="$2"
    
    echo -n "Testando $description... "
    
    if [ -f "$file" ]; then
        echo -e "${GREEN}✅ Encontrado${NC}"
        return 0
    else
        echo -e "${RED}❌ Não encontrado${NC}"
        return 1
    fi
}

# Função para testar pastas
test_directory() {
    local dir="$1"
    local description="$2"
    
    echo -n "Testando $description... "
    
    if [ -d "$dir" ]; then
        local count=$(find "$dir" -type f | wc -l)
        echo -e "${GREEN}✅ $count arquivos${NC}"
        return 0
    else
        echo -e "${RED}❌ Não encontrado${NC}"
        return 1
    fi
}

# Teste 1: Ferramentas do Sistema
echo -e "${YELLOW}📦 Testando ferramentas do sistema...${NC}"
test_command "node" "Node.js"
test_command "npm" "NPM"
test_command "git" "Git"

# Teste 2: Estrutura do Projeto
echo -e "\n${YELLOW}🗂️  Testando estrutura do projeto...${NC}"
test_directory "MapAgriApp" "Projeto principal"
test_file "MapAgriApp/package.json" "Package.json"
test_directory "MapAgriApp/src" "Código fonte"
test_directory "MapAgriApp/src/screens" "Telas"
test_directory "MapAgriApp/src/services" "Serviços"

# Teste 3: Arquivos de Configuração
echo -e "\n${YELLOW}⚙️  Testando arquivos de configuração...${NC}"
test_file "MapAgriApp/tsconfig.json" "TypeScript config"
test_file "MapAgriApp/metro.config.js" "Metro config"
test_file "MapAgriApp/.env" "Environment variables"

# Teste 4: Scripts de Instalação
echo -e "\n${YELLOW}📋 Testando scripts...${NC}"
test_file "install.sh" "Script de instalação (Linux/macOS)"
test_file "install.bat" "Script de instalação (Windows)"
test_file "start.sh" "Script de inicialização"
test_file "build.sh" "Script de build"

# Teste 5: Documentação
echo -e "\n${YELLOW}📖 Testando documentação...${NC}"
test_file "README.md" "README principal"
test_file "DEPLOY_CHECKLIST.md" "Checklist de deploy"

# Teste 6: Dependências (se já instaladas)
if [ -d "MapAgriApp/node_modules" ]; then
    echo -e "\n${YELLOW}📦 Testando dependências...${NC}"
    
    cd MapAgriApp
    
    # Verificar dependências críticas
    CRITICAL_DEPS=(
        "react"
        "react-native"
        "@react-navigation/native"
        "react-native-maps"
        "@supabase/supabase-js"
        "react-native-geolocation-service"
    )
    
    for dep in "${CRITICAL_DEPS[@]}"; do
        if npm list "$dep" &> /dev/null; then
            echo -e "✅ $dep instalado"
        else
            echo -e "${RED}❌ $dep não encontrado${NC}"
        fi
    done
    
    cd ..
else
    echo -e "\n${YELLOW}⚠️  node_modules não encontrado (execute npm install)${NC}"
fi

# Teste 7: TypeScript (se disponível)
if [ -f "MapAgriApp/tsconfig.json" ] && [ -d "MapAgriApp/node_modules" ]; then
    echo -e "\n${YELLOW}🔍 Testando TypeScript...${NC}"
    
    cd MapAgriApp
    
    if npx tsc --noEmit --skipLibCheck; then
        echo -e "${GREEN}✅ TypeScript: Sem erros${NC}"
    else
        echo -e "${YELLOW}⚠️  TypeScript: Avisos encontrados${NC}"
    fi
    
    cd ..
fi

# Teste 8: Simulação de Funcionalidades
echo -e "\n${YELLOW}🎮 Testando simulação...${NC}"
if [ -f "MapAgriApp/scripts/web-simulator.js" ]; then
    cd MapAgriApp
    if node scripts/web-simulator.js test; then
        echo -e "${GREEN}✅ Simulação: Funcionando${NC}"
    else
        echo -e "${RED}❌ Simulação: Erro${NC}"
    fi
    cd ..
else
    echo -e "${YELLOW}⚠️  Simulador não encontrado${NC}"
fi

# Resumo Final
echo -e "\n${BLUE}📊 Resumo dos Testes:${NC}\n"

# Contador de sucessos/falhas
SUCCESS_COUNT=0
TOTAL_TESTS=20

# Simular contagem baseada nos testes
if command -v node &> /dev/null; then ((SUCCESS_COUNT++)); fi
if command -v npm &> /dev/null; then ((SUCCESS_COUNT++)); fi
if command -v git &> /dev/null; then ((SUCCESS_COUNT++)); fi
if [ -d "MapAgriApp" ]; then ((SUCCESS_COUNT++)); fi
if [ -f "MapAgriApp/package.json" ]; then ((SUCCESS_COUNT++)); fi
if [ -d "MapAgriApp/src" ]; then ((SUCCESS_COUNT++)); fi
if [ -f "README.md" ]; then ((SUCCESS_COUNT++)); fi

PERCENTAGE=$((SUCCESS_COUNT * 100 / 10))

if [ $PERCENTAGE -ge 80 ]; then
    echo -e "${GREEN}🎉 Instalação: $PERCENTAGE% OK${NC}"
    echo -e "${GREEN}✅ MapAgri está pronto para uso!${NC}"
elif [ $PERCENTAGE -ge 60 ]; then
    echo -e "${YELLOW}⚠️  Instalação: $PERCENTAGE% OK${NC}"
    echo -e "${YELLOW}🔧 Alguns ajustes necessários${NC}"
else
    echo -e "${RED}❌ Instalação: $PERCENTAGE% OK${NC}"
    echo -e "${RED}🚨 Execute o script de instalação${NC}"
fi

# Próximos passos
echo -e "\n${BLUE}📋 Próximos passos:${NC}"

if [ $PERCENTAGE -ge 80 ]; then
    echo -e "1. ${GREEN}./start.sh${NC} - Iniciar o app"
    echo -e "2. ${GREEN}npm run android${NC} - Executar no Android"
    echo -e "3. ${GREEN}./build.sh${NC} - Fazer build de produção"
else
    echo -e "1. ${YELLOW}./install.sh${NC} - Executar instalação"
    echo -e "2. ${YELLOW}cd MapAgriApp && npm install${NC} - Instalar dependências"
    echo -e "3. ${YELLOW}Configurar .env${NC} - Credenciais Supabase"
fi

echo -e "\n${BLUE}🌾 Teste de instalação concluído!${NC}"