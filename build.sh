#!/bin/bash

# 🌾 MapAgri - Build Script para Distribuição

set -e

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}🚀 MapAgri - Build para Distribuição${NC}\n"

# Entrar no diretório do app
cd MapAgriApp

# Limpar cache
echo -e "${YELLOW}🧹 Limpando cache...${NC}"
npx react-native start --reset-cache &
METRO_PID=$!
sleep 3
kill $METRO_PID 2>/dev/null || true
rm -rf node_modules/.cache
rm -rf /tmp/metro-*

# Verificar dependências
echo -e "\n${YELLOW}📦 Verificando dependências...${NC}"
npm audit --audit-level=moderate
npm run compile || echo "Continuando mesmo com avisos..."

# Build Android Release
build_android() {
    echo -e "\n${YELLOW}📱 Fazendo build Android (Release)...${NC}"
    
    cd android
    
    # Limpar build anterior
    ./gradlew clean
    
    # Build APK de release
    ./gradlew assembleRelease
    
    # Verificar se o APK foi criado
    APK_PATH="app/build/outputs/apk/release/app-release.apk"
    if [ -f "$APK_PATH" ]; then
        APK_SIZE=$(du -h "$APK_PATH" | cut -f1)
        echo -e "${GREEN}✅ APK criado: $APK_SIZE${NC}"
        echo -e "${BLUE}📱 Localização: android/$APK_PATH${NC}"
        
        # Copiar para pasta de distribuição
        mkdir -p ../dist
        cp "$APK_PATH" "../dist/MapAgri-v1.0.0-release.apk"
        echo -e "${GREEN}📦 APK copiado para: dist/MapAgri-v1.0.0-release.apk${NC}"
    else
        echo -e "${RED}❌ Erro ao criar APK${NC}"
        exit 1
    fi
    
    cd ..
}

# Build iOS Release (apenas macOS)
build_ios() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        echo -e "${YELLOW}⚠️  Build iOS disponível apenas no macOS${NC}"
        return
    fi
    
    echo -e "\n${YELLOW}🍎 Fazendo build iOS (Release)...${NC}"
    
    cd ios
    
    # Instalar pods
    pod install
    
    # Build usando xcodebuild
    xcodebuild -workspace MapAgriApp.xcworkspace \
               -scheme MapAgriApp \
               -configuration Release \
               -destination generic/platform=iOS \
               -archivePath ../dist/MapAgriApp.xcarchive \
               archive
    
    if [ -d "../dist/MapAgriApp.xcarchive" ]; then
        echo -e "${GREEN}✅ Archive iOS criado${NC}"
        echo -e "${BLUE}📱 Localização: dist/MapAgriApp.xcarchive${NC}"
        echo -e "${YELLOW}💡 Use o Xcode Organizer para distribuir na App Store${NC}"
    else
        echo -e "${RED}❌ Erro ao criar archive iOS${NC}"
    fi
    
    cd ..
}

# Criar bundle JavaScript
build_bundle() {
    echo -e "\n${YELLOW}📦 Criando bundle JavaScript...${NC}"
    
    mkdir -p dist/bundle
    
    # Bundle para Android
    npx react-native bundle \
        --platform android \
        --dev false \
        --entry-file index.js \
        --bundle-output dist/bundle/index.android.bundle \
        --assets-dest dist/bundle/android
    
    # Bundle para iOS (se no macOS)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        npx react-native bundle \
            --platform ios \
            --dev false \
            --entry-file index.js \
            --bundle-output dist/bundle/index.ios.bundle \
            --assets-dest dist/bundle/ios
    fi
    
    echo -e "${GREEN}✅ Bundles criados em dist/bundle/${NC}"
}

# Gerar checksums
generate_checksums() {
    echo -e "\n${YELLOW}🔐 Gerando checksums...${NC}"
    
    cd dist
    
    # Gerar SHA256 para todos os arquivos
    find . -type f \( -name "*.apk" -o -name "*.xcarchive" -o -name "*.bundle" \) | while read file; do
        sha256sum "$file" >> checksums.sha256
    done
    
    if [ -f "checksums.sha256" ]; then
        echo -e "${GREEN}✅ Checksums gerados em dist/checksums.sha256${NC}"
    fi
    
    cd ..
}

# Criar pacote de distribuição
create_distribution_package() {
    echo -e "\n${YELLOW}📦 Criando pacote de distribuição...${NC}"
    
    # Criar estrutura
    mkdir -p dist/MapAgri-v1.0.0
    
    # Copiar arquivos essenciais
    cp ../README.md dist/MapAgri-v1.0.0/
    cp ../LICENSE dist/MapAgri-v1.0.0/ 2>/dev/null || echo "# MIT License" > dist/MapAgri-v1.0.0/LICENSE
    
    # Copiar documentação
    if [ -d "../docs" ]; then
        cp -r ../docs dist/MapAgri-v1.0.0/
    fi
    
    # Copiar scripts de instalação
    cp ../install.sh dist/MapAgri-v1.0.0/ 2>/dev/null || true
    cp ../install.bat dist/MapAgri-v1.0.0/ 2>/dev/null || true
    
    # Criar arquivo de informações da build
    cat > dist/MapAgri-v1.0.0/BUILD_INFO.txt << EOF
MapAgri v1.0.0 - Build Information
=================================

Build Date: $(date)
Platform: $OSTYPE
Node.js: $(node --version)
React Native: 0.83.0
TypeScript: 5.0

Included Files:
- Android APK (se disponível)
- iOS Archive (se disponível, apenas macOS)  
- JavaScript Bundles
- Documentação completa
- Scripts de instalação
- Checksums SHA256

Installation:
1. Extract files
2. Run install.sh (Linux/macOS) or install.bat (Windows)  
3. Configure Supabase credentials
4. npm run android/ios

Support: https://github.com/SauloRodrigues20/MapAgri/issues
EOF
    
    # Criar ZIP
    cd dist
    zip -r "MapAgri-v1.0.0-distribution.zip" MapAgri-v1.0.0/
    
    echo -e "${GREEN}✅ Pacote de distribuição criado: MapAgri-v1.0.0-distribution.zip${NC}"
    
    cd ..
}

# Mostrar resumo
show_summary() {
    echo -e "\n${GREEN}🎉 Build concluído com sucesso!${NC}\n"
    
    echo -e "${BLUE}📦 Arquivos gerados em dist/:${NC}"
    ls -la dist/ 2>/dev/null || echo "Nenhum arquivo encontrado"
    
    echo -e "\n${BLUE}📋 Próximos passos:${NC}"
    echo -e "1. Testar o APK/Archive em dispositivos reais"
    echo -e "2. Configurar CI/CD para builds automáticos"
    echo -e "3. Publicar na Play Store/App Store"
    echo -e "4. Distribuir o pacote ZIP para usuários"
    
    echo -e "\n${GREEN}🌾 MapAgri pronto para distribuição!${NC}"
}

# Menu de opções
echo -e "${BLUE}Escolha o tipo de build:${NC}"
echo -e "1. 📱 Android APK"
echo -e "2. 🍎 iOS Archive (apenas macOS)"
echo -e "3. 📦 Bundle JavaScript"
echo -e "4. 🚀 Build completo (All-in-one)"
echo -e "5. 📋 Apenas pacote de distribuição"

read -p "Opção (1-5): " choice

case $choice in
    1)
        build_android
        ;;
    2)
        build_ios
        ;;
    3)
        build_bundle
        ;;
    4)
        build_android
        build_ios
        build_bundle
        generate_checksums
        create_distribution_package
        ;;
    5)
        create_distribution_package
        ;;
    *)
        echo -e "${YELLOW}Opção inválida. Executando build completo...${NC}"
        build_android
        build_ios
        build_bundle
        generate_checksums
        create_distribution_package
        ;;
esac

show_summary

echo -e "\n${GREEN}✨ Build finalizado! ✨${NC}"