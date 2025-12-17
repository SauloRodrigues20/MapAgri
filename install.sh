#!/bin/bash

# 🌾 MapAgri - Script de Instalação Automática v1.0
# Instala o projeto MapAgri com todas as dependências

set -e  # Sair em caso de erro

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sem cor

# Header
echo -e "${GREEN}
🌾 MapAgri - Instalador Automático
=================================${NC}"

# Detectar sistema operacional
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="Linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macOS"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        OS="Windows"
    else
        OS="Unknown"
    fi
    echo -e "Sistema detectado: ${BLUE}$OS${NC}"
}

# Verificar Node.js
check_node() {
    echo -e "\n${YELLOW}📦 Verificando Node.js...${NC}"
    
    if ! command -v node &> /dev/null; then
        echo -e "${RED}❌ Node.js não encontrado!${NC}"
        echo -e "${YELLOW}📥 Instalando Node.js...${NC}"
        
        if [[ "$OS" == "macOS" ]]; then
            if command -v brew &> /dev/null; then
                brew install node
            else
                echo "Por favor, instale o Homebrew: https://brew.sh/"
                exit 1
            fi
        elif [[ "$OS" == "Linux" ]]; then
            # Ubuntu/Debian
            if command -v apt &> /dev/null; then
                curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
                sudo apt-get install -y nodejs
            # CentOS/RHEL
            elif command -v yum &> /dev/null; then
                curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
                sudo yum install -y nodejs npm
            else
                echo -e "${RED}Sistema Linux não suportado. Instale Node.js manualmente.${NC}"
                exit 1
            fi
        else
            echo -e "${RED}Sistema não suportado. Instale Node.js manualmente: https://nodejs.org/${NC}"
            exit 1
        fi
    fi
    
    NODE_VERSION=$(node --version)
    echo -e "${GREEN}✅ Node.js $NODE_VERSION instalado${NC}"
}

# Verificar Git
check_git() {
    echo -e "\n${YELLOW}📦 Verificando Git...${NC}"
    
    if ! command -v git &> /dev/null; then
        echo -e "${RED}❌ Git não encontrado!${NC}"
        
        if [[ "$OS" == "macOS" ]]; then
            xcode-select --install
        elif [[ "$OS" == "Linux" ]]; then
            if command -v apt &> /dev/null; then
                sudo apt update && sudo apt install -y git
            elif command -v yum &> /dev/null; then
                sudo yum install -y git
            fi
        fi
    fi
    
    GIT_VERSION=$(git --version)
    echo -e "${GREEN}✅ $GIT_VERSION instalado${NC}"
}

# Clonar repositório
clone_repo() {
    echo -e "\n${YELLOW}📥 Clonando MapAgri...${NC}"
    
    REPO_URL="https://github.com/SauloRodrigues20/MapAgri.git"
    PROJECT_DIR="MapAgri"
    
    if [ -d "$PROJECT_DIR" ]; then
        echo -e "${YELLOW}⚠️  Diretório $PROJECT_DIR já existe. Atualizando...${NC}"
        cd "$PROJECT_DIR"
        git pull origin main
        cd ..
    else
        git clone "$REPO_URL"
    fi
    
    echo -e "${GREEN}✅ Repositório clonado/atualizado${NC}"
}

# Instalar dependências
install_dependencies() {
    echo -e "\n${YELLOW}📦 Instalando dependências do projeto...${NC}"
    
    cd MapAgri/MapAgriApp
    
    # Verificar se package.json existe
    if [ ! -f "package.json" ]; then
        echo -e "${RED}❌ package.json não encontrado!${NC}"
        exit 1
    fi
    
    # Instalar dependências
    npm install
    
    echo -e "${GREEN}✅ Dependências instaladas${NC}"
}

# Configurar ambiente
setup_environment() {
    echo -e "\n${YELLOW}⚙️  Configurando ambiente...${NC}"
    
    # Criar .env se não existir
    if [ ! -f ".env" ]; then
        echo -e "${BLUE}📝 Criando arquivo .env...${NC}"
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
        echo -e "${YELLOW}⚠️  Configure suas credenciais do Supabase no arquivo .env${NC}"
    fi
    
    # Verificar TypeScript
    echo -e "\n${YELLOW}🔍 Verificando TypeScript...${NC}"
    npx tsc --noEmit --skipLibCheck
    
    echo -e "${GREEN}✅ Ambiente configurado${NC}"
}

# Configurar Android (opcional)
setup_android() {
    echo -e "\n${YELLOW}📱 Configurando Android...${NC}"
    
    if command -v adb &> /dev/null; then
        echo -e "${GREEN}✅ Android SDK encontrado${NC}"
        
        # Verificar dispositivos conectados
        DEVICES=$(adb devices | grep -v "List of devices" | wc -l)
        if [ "$DEVICES" -gt 1 ]; then
            echo -e "${GREEN}📱 $((DEVICES-1)) dispositivo(s) Android conectado(s)${NC}"
        else
            echo -e "${YELLOW}📱 Nenhum dispositivo Android conectado${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️  Android SDK não encontrado${NC}"
        echo -e "Instale o Android Studio para desenvolvimento Android"
    fi
}

# Testes finais
run_tests() {
    echo -e "\n${YELLOW}🧪 Executando testes...${NC}"
    
    # Teste de compilação TypeScript
    if npx tsc --noEmit --skipLibCheck; then
        echo -e "${GREEN}✅ TypeScript: OK${NC}"
    else
        echo -e "${RED}❌ Erros de TypeScript encontrados${NC}"
    fi
    
    # Teste básico de dependências
    if npm list --depth=0 > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Dependências: OK${NC}"
    else
        echo -e "${YELLOW}⚠️  Algumas dependências podem ter issues${NC}"
    fi
}

# Instruções finais
show_final_instructions() {
    echo -e "\n${GREEN}🎉 MapAgri instalado com sucesso!${NC}\n"
    
    echo -e "${BLUE}📋 Próximos passos:${NC}"
    echo -e "1. ${YELLOW}cd MapAgri/MapAgriApp${NC}"
    echo -e "2. ${YELLOW}Configure o .env com suas credenciais do Supabase${NC}"
    echo -e "3. ${YELLOW}npm run android${NC} (ou ${YELLOW}npm run ios${NC} no macOS)"
    echo -e "4. ${YELLOW}npm start${NC} para iniciar o Metro bundler\n"
    
    echo -e "${BLUE}📖 Documentação:${NC}"
    echo -e "- README: ${YELLOW}cat README.md${NC}"
    echo -e "- Supabase: ${YELLOW}docs/SUPABASE_SETUP.md${NC}"
    echo -e "- API: ${YELLOW}docs/API.md${NC}\n"
    
    echo -e "${BLUE}🧪 Testes disponíveis:${NC}"
    echo -e "- ${YELLOW}npm test${NC} - Testes unitários"
    echo -e "- ${YELLOW}node scripts/test-supabase.js${NC} - Testar Supabase"
    echo -e "- ${YELLOW}npx tsc --noEmit${NC} - Verificar TypeScript\n"
    
    echo -e "${GREEN}🌾 MapAgri pronto para uso!${NC}"
    echo -e "Desenvolvido com ❤️  para a agricultura brasileira 🇧🇷"
}

# Função principal
main() {
    detect_os
    check_node
    check_git
    clone_repo
    install_dependencies
    setup_environment
    setup_android
    run_tests
    show_final_instructions
}

# Capturar erros
handle_error() {
    echo -e "\n${RED}❌ Erro durante a instalação!${NC}"
    echo -e "${YELLOW}Verifique os logs acima e tente novamente.${NC}"
    echo -e "${BLUE}Para suporte: https://github.com/SauloRodrigues20/MapAgri/issues${NC}"
    exit 1
}

trap handle_error ERR

# Executar instalação
main

echo -e "\n${GREEN}✨ Instalação concluída! ✨${NC}"