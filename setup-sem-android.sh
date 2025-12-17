#!/bin/bash

# 🌾 MapAgri - Setup SEM Android Studio

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}🌾 MapAgri - Setup SEM Android Studio${NC}\n"

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo -e "${YELLOW}📦 Instalando Node.js...${NC}"
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Clonar projeto se não existir
if [ ! -d "MapAgriApp" ]; then
    echo -e "${BLUE}📥 Clonando MapAgri...${NC}"
    git clone https://github.com/SauloRodrigues20/MapAgri.git .
fi

cd MapAgriApp

# Instalar dependências
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
npm install

# Menu de opções
echo -e "\n${BLUE}🚀 Escolha como executar o MapAgri:${NC}"
echo -e "1. 📱 Expo Go (celular) - RECOMENDADO"
echo -e "2. 🌐 Simulador Web (computador)"  
echo -e "3. ☁️  Build online (EAS)"
echo -e "4. 🖥️  Metro + dispositivo USB"

read -p "Opção (1-4): " choice

case $choice in
    1)
        echo -e "\n${GREEN}📱 Configurando Expo Go...${NC}"
        
        # Instalar Expo CLI
        npm install -g @expo/cli
        
        echo -e "${BLUE}📋 Próximos passos:${NC}"
        echo -e "1. Baixar 'Expo Go' no seu celular:"
        echo -e "   📱 Android: https://play.google.com/store/apps/details?id=host.exp.exponent"
        echo -e "   🍎 iOS: https://apps.apple.com/app/expo-go/id982107779"
        echo -e "\n2. Executar comando:"
        echo -e "   ${YELLOW}npx expo start --tunnel${NC}"
        echo -e "\n3. Escanear QR code com Expo Go"
        echo -e "\n${GREEN}Executando agora...${NC}"
        
        npx expo start --tunnel
        ;;
        
    2)
        echo -e "\n${GREEN}🌐 Executando Simulador Web...${NC}"
        
        if [ -f "scripts/web-simulator.js" ]; then
            node scripts/web-simulator.js
        else
            echo -e "${YELLOW}Simulador não encontrado. Iniciando Metro...${NC}"
            npm start
        fi
        ;;
        
    3)
        echo -e "\n${GREEN}☁️ Configurando Build Online...${NC}"
        
        # Instalar EAS CLI
        npm install -g eas-cli
        
        echo -e "${BLUE}📋 Próximos passos:${NC}"
        echo -e "1. Criar conta no Expo: https://expo.dev"
        echo -e "2. Fazer login: ${YELLOW}eas login${NC}"
        echo -e "3. Build APK: ${YELLOW}eas build --platform android${NC}"
        echo -e "\n${GREEN}Fazendo login agora...${NC}"
        
        eas login
        ;;
        
    4)
        echo -e "\n${GREEN}🖥️ Configurando Metro + USB...${NC}"
        
        echo -e "${BLUE}📋 Pré-requisitos:${NC}"
        echo -e "1. Celular Android conectado via USB"
        echo -e "2. 'Depuração USB' ativada nas configurações"
        echo -e "3. ADB instalado: ${YELLOW}sudo apt install adb${NC}"
        echo -e "\n${GREEN}Iniciando Metro Bundler...${NC}"
        
        # Instalar ADB se necessário
        if ! command -v adb &> /dev/null; then
            sudo apt update && sudo apt install -y adb
        fi
        
        # Iniciar Metro
        npx react-native start &
        METRO_PID=$!
        
        echo -e "\n${BLUE}Em outro terminal, execute:${NC}"
        echo -e "${YELLOW}npx react-native run-android --device${NC}"
        
        # Aguardar input para parar
        echo -e "\nPressione ENTER para parar o Metro..."
        read
        kill $METRO_PID 2>/dev/null || true
        ;;
        
    *)
        echo -e "${YELLOW}Opção inválida. Executando simulador web...${NC}"
        node scripts/web-simulator.js 2>/dev/null || npm start
        ;;
esac

echo -e "\n${GREEN}🌾 MapAgri configurado! Agricultura sem complicação! 🚀${NC}"