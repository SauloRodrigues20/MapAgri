#!/bin/bash

# 🏗️ MapAgri - Criar APK Tradicional Localmente

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🏗️ MapAgri - Gerando APK Tradicional${NC}\n"

# Verificar se estamos na pasta correta
if [ ! -f "MapAgriApp/package.json" ]; then
    echo -e "${RED}❌ Execute na pasta raiz do MapAgri${NC}"
    exit 1
fi

cd MapAgriApp

# Instalar dependências
echo -e "${YELLOW}📦 Instalando dependências...${NC}"
npm install

# Instalar EAS CLI se não tiver
if ! command -v eas &> /dev/null; then
    echo -e "${YELLOW}🛠️ Instalando EAS CLI...${NC}"
    npm install -g @expo/cli eas-cli
fi

# Criar app.json para Expo
echo -e "${BLUE}📱 Configurando projeto para APK...${NC}"
cat > app.json << 'EOF'
{
  "expo": {
    "name": "MapAgri",
    "slug": "mapagri-agricultura",
    "version": "1.0.0",
    "orientation": "portrait",
    "icon": "./assets/icon.png",
    "userInterfaceStyle": "light",
    "splash": {
      "image": "./assets/splash.png", 
      "resizeMode": "contain",
      "backgroundColor": "#4CAF50"
    },
    "assetBundlePatterns": ["**/*"],
    "android": {
      "package": "com.mapagri.agricultura",
      "versionCode": 1,
      "permissions": [
        "ACCESS_FINE_LOCATION",
        "ACCESS_COARSE_LOCATION",
        "CAMERA", 
        "WRITE_EXTERNAL_STORAGE",
        "READ_EXTERNAL_STORAGE",
        "INTERNET"
      ],
      "adaptiveIcon": {
        "foregroundImage": "./assets/adaptive-icon.png",
        "backgroundColor": "#4CAF50"
      }
    },
    "plugins": [
      [
        "expo-location",
        {
          "locationAlwaysAndWhenInUsePermission": "MapAgri precisa de GPS para marcar coordenadas das amostras."
        }
      ]
    ]
  }
}
EOF

# Criar assets básicos
echo -e "${YELLOW}🎨 Criando ícones...${NC}"
mkdir -p assets

# Criar ícone simples (placeholder)
cat > assets/icon.png << 'EOF'
data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==
EOF

cp assets/icon.png assets/splash.png
cp assets/icon.png assets/adaptive-icon.png

# Configurar EAS
echo -e "${YELLOW}⚙️ Configurando EAS Build...${NC}"
cat > eas.json << 'EOF'
{
  "cli": {
    "version": ">= 5.8.0"
  },
  "build": {
    "production": {
      "android": {
        "buildType": "apk"
      }
    },
    "preview": {
      "android": {
        "buildType": "apk"
      }
    }
  }
}
EOF

# Login no EAS
echo -e "${BLUE}🔐 Fazendo login no EAS...${NC}"
echo -e "${YELLOW}💡 Crie conta grátis em: https://expo.dev${NC}"

if ! eas whoami &> /dev/null; then
    eas login
fi

# Build do APK
echo -e "\n${GREEN}🚀 Iniciando build do APK...${NC}"
echo -e "${BLUE}⏱️ Isso pode demorar 5-15 minutos...${NC}\n"

eas build --platform android --profile production

# Verificar se o build foi bem sucedido
echo -e "\n${BLUE}📋 Verificando status do build...${NC}"
eas build:list --limit=5

echo -e "\n${GREEN}✅ APK sendo gerado na nuvem!${NC}"

echo -e "\n${BLUE}📋 Próximos passos:${NC}"
echo -e "1. ⏱️ Aguardar build completar (5-15 min)"
echo -e "2. 📥 Download automático do APK será disponibilizado"  
echo -e "3. 📱 Instalar APK no celular Android"
echo -e "4. 🌾 Usar para coleta de amostras!"

echo -e "\n${YELLOW}🔗 Acompanhar build:${NC}"
echo -e "- https://expo.dev/accounts/$(eas whoami)/builds"

echo -e "\n${YELLOW}💡 Para automatizar no futuro:${NC}"
echo -e "- Usar GitHub Actions (já configurado)"
echo -e "- Build automático a cada release"

echo -e "\n${GREEN}🌾 APK tradicional será gerado! 🚀${NC}"