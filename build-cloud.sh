#!/bin/bash

# 🏗️ MapAgri - Gerar APK SEM Android Studio (Para Distribuição)

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🏗️ MapAgri - Gerar APK para Distribuição${NC}"
echo -e "${BLUE}📱 APK será gerado na NUVEM sem Android Studio!${NC}\n"

# Verificar Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js não encontrado!${NC}"
    echo -e "${YELLOW}📥 Instale: https://nodejs.org/${NC}"
    exit 1
fi

# Entrar no projeto
cd MapAgriApp

# Instalar dependências
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
npm install

# Instalar EAS CLI
echo -e "${YELLOW}🛠️ Instalando EAS CLI...${NC}"
npm install -g eas-cli

# Login no Expo
echo -e "${BLUE}🔐 Fazendo login no Expo...${NC}"
echo -e "${YELLOW}💡 Crie conta grátis em: https://expo.dev${NC}"
eas login

# Configurar build
echo -e "${YELLOW}⚙️ Configurando projeto...${NC}"
if [ ! -f "eas.json" ]; then
    eas build:configure
fi

# Menu de build
echo -e "\n${BLUE}🚀 Escolha tipo de build:${NC}"
echo -e "1. 📱 APK para distribuição (usuários finais)"
echo -e "2. 🏪 AAB para Google Play Store" 
echo -e "3. 🧪 APK de desenvolvimento (teste)"

read -p "Opção (1-3): " choice

case $choice in
    1)
        echo -e "\n${GREEN}📱 Gerando APK para distribuição...${NC}"
        eas build --platform android --profile production --local=false
        ;;
    2)
        echo -e "\n${GREEN}🏪 Gerando AAB para Play Store...${NC}"
        eas build --platform android --profile production --local=false
        ;;
    3)
        echo -e "\n${GREEN}🧪 Gerando APK de desenvolvimento...${NC}"
        eas build --platform android --profile development --local=false
        ;;
    *)
        echo -e "${YELLOW}Opção inválida. Gerando APK de distribuição...${NC}"
        eas build --platform android --profile production --local=false
        ;;
esac

echo -e "\n${GREEN}🎉 Build iniciado na nuvem!${NC}\n"

echo -e "${BLUE}📋 Próximos passos:${NC}"
echo -e "1. ⏱️ Aguardar build (5-10 minutos)"
echo -e "2. 📥 Download automático do APK"
echo -e "3. 📤 Upload para GitHub Releases"
echo -e "4. 🔗 Compartilhar link com usuários"

echo -e "\n${BLUE}🔗 Acompanhar build:${NC}"
echo -e "- https://expo.dev/accounts/[seu-usuario]/builds"

echo -e "\n${YELLOW}💡 Para automatizar:${NC}"
echo -e "- Configurar GitHub Actions"
echo -e "- Build automático a cada commit"
echo -e "- Upload direto para Releases"

echo -e "\n${GREEN}🌾 APK será gerado SEM Android Studio! 🚀${NC}"