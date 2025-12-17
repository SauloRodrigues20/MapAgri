#!/bin/bash

# 🤖 MapAgri - Setup Rápido GitHub Actions

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🤖 GitHub Actions - Setup Completo${NC}\n"

# Verificar estrutura
if [ ! -f ".github/workflows/build-apk.yml" ]; then
    echo -e "${RED}❌ Workflow não encontrado!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Workflow GitHub Actions encontrado!${NC}"
echo -e "${BLUE}📍 Local: .github/workflows/build-apk.yml${NC}\n"

# Verificar se tem conta Expo
echo -e "${YELLOW}🔐 Verificando login Expo...${NC}"
cd MapAgriApp

if npx expo whoami &> /dev/null; then
    EXPO_USER=$(npx expo whoami)
    echo -e "${GREEN}✅ Logado como: $EXPO_USER${NC}"
else
    echo -e "${YELLOW}⚠️ Não logado no Expo${NC}"
    echo -e "${BLUE}📋 Opções:${NC}"
    echo -e "1. ${YELLOW}Criar conta:${NC} https://expo.dev/signup"
    echo -e "2. ${YELLOW}Login:${NC} npx expo login"
    echo -e "3. ${YELLOW}Continuar assim mesmo${NC} (configurar depois)\n"
    
    read -p "Quer fazer login agora? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        npx expo login
        EXPO_USER=$(npx expo whoami)
        echo -e "${GREEN}✅ Logado como: $EXPO_USER${NC}"
    else
        echo -e "${YELLOW}⏭️ Pulando login (configurar depois)${NC}"
    fi
fi

cd ..

echo -e "\n${BLUE}📋 Próximos passos para ativar GitHub Actions:${NC}\n"

echo -e "${YELLOW}1. 🔑 Configurar EXPO_TOKEN no GitHub:${NC}"
echo -e "   • Acesse: ${BLUE}https://expo.dev/settings/access-tokens${NC}"
echo -e "   • Criar token > Copiar"
echo -e "   • GitHub > Settings > Secrets > New secret"
echo -e "   • Nome: ${YELLOW}EXPO_TOKEN${NC}"
echo -e "   • Valor: Cole o token"

echo -e "\n${YELLOW}2. 🚀 Disparar primeiro build:${NC}"
echo -e "   • ${BLUE}git tag v1.0.0${NC}"
echo -e "   • ${BLUE}git push origin v1.0.0${NC}"

echo -e "\n${YELLOW}3. 📱 Aguardar APK (15 min):${NC}"
echo -e "   • Build: ${BLUE}https://github.com/SauloRodrigues20/MapAgri/actions${NC}"
echo -e "   • Download: ${BLUE}https://github.com/SauloRodrigues20/MapAgri/releases${NC}"

# Criar tag se quiser testar agora
echo -e "\n${BLUE}🎯 Quer testar agora?${NC}"
read -p "Criar tag v1.0.0 e disparar build? (y/n): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "\n${YELLOW}🏷️ Criando tag...${NC}"
    
    if git tag v1.0.0 2>/dev/null; then
        echo -e "${GREEN}✅ Tag v1.0.0 criada!${NC}"
        
        echo -e "${YELLOW}📤 Enviando para GitHub...${NC}"
        if git push origin v1.0.0; then
            echo -e "\n${GREEN}🚀 Build disparado!${NC}"
            echo -e "${BLUE}📱 APK será gerado em ~15 minutos${NC}"
            echo -e "${BLUE}🔗 Acompanhar: https://github.com/SauloRodrigues20/MapAgri/actions${NC}"
        else
            echo -e "${RED}❌ Erro ao enviar tag${NC}"
            echo -e "${YELLOW}💡 Configure git push primeiro ou use GitHub web${NC}"
        fi
    else
        echo -e "${YELLOW}⚠️ Tag v1.0.0 já existe${NC}"
        echo -e "${BLUE}💡 Use: git tag v1.0.1 (próxima versão)${NC}"
    fi
else
    echo -e "${BLUE}👌 Ok! Configure EXPO_TOKEN primeiro e depois:${NC}"
    echo -e "${YELLOW}git tag v1.0.0 && git push origin v1.0.0${NC}"
fi

echo -e "\n${GREEN}🌾 GitHub Actions configurado para MapAgri! 🤖${NC}"
echo -e "\n${BLUE}📋 Resumo do que acontece:${NC}"
echo -e "1. 🏷️ ${YELLOW}Tag criada${NC} → Dispara build automático"
echo -e "2. 🤖 ${YELLOW}GitHub Actions${NC} → Gera APK na nuvem" 
echo -e "3. 📱 ${YELLOW}APK pronto${NC} → Download no GitHub Releases"
echo -e "4. 🌾 ${YELLOW}Distribua${NC} → Compartilhar APK com agricultores"

echo -e "\n${YELLOW}💡 Builds futuros: Só criar nova tag!${NC}"
echo -e "${BLUE}git tag v1.0.1 && git push origin v1.0.1${NC}"