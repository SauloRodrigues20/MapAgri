#!/bin/bash

# 🏗️ MapAgri - Gerador de APK para Download Direto

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🏗️ MapAgri - Gerador de APK${NC}\n"

# Verificar se estamos na pasta correta
if [ ! -f "MapAgriApp/package.json" ]; then
    echo -e "${RED}❌ Execute este script na pasta raiz do MapAgri${NC}"
    exit 1
fi

cd MapAgriApp

# Verificar dependências
echo -e "${YELLOW}📦 Verificando dependências...${NC}"
if [ ! -d "node_modules" ]; then
    echo -e "${BLUE}Instalando dependências...${NC}"
    npm install
fi

# Limpar builds anteriores
echo -e "${YELLOW}🧹 Limpando builds anteriores...${NC}"
cd android
./gradlew clean
cd ..

# Preparar para release
echo -e "${YELLOW}⚙️ Configurando para release...${NC}"

# Criar keystore se não existir
if [ ! -f "android/app/mapagri-key.keystore" ]; then
    echo -e "${BLUE}🔐 Criando keystore de release...${NC}"
    keytool -genkey -v -keystore android/app/mapagri-key.keystore -name mapagri-key -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=MapAgri, OU=Agriculture, O=MapAgri, L=Brasilia, S=DF, C=BR" -storepass mapagri123 -keypass mapagri123
fi

# Configurar gradle.properties
cat > android/gradle.properties << 'EOF'
org.gradle.jvmargs=-Xmx2048m -XX:MaxPermSize=512m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
android.useAndroidX=true
android.enableJetifier=true
org.gradle.parallel=true
org.gradle.configureondemand=true
org.gradle.daemon=true

# Release keystore
MAPAGRI_UPLOAD_STORE_FILE=mapagri-key.keystore
MAPAGRI_UPLOAD_KEY_ALIAS=mapagri-key
MAPAGRI_UPLOAD_STORE_PASSWORD=mapagri123
MAPAGRI_UPLOAD_KEY_PASSWORD=mapagri123
EOF

# Configurar build.gradle para release
if ! grep -q "signingConfigs" android/app/build.gradle; then
    echo -e "${BLUE}📝 Configurando assinatura do APK...${NC}"
    
    # Backup do build.gradle
    cp android/app/build.gradle android/app/build.gradle.backup
    
    # Adicionar configuração de signing
    sed -i '/android {/a\
    signingConfigs {\
        release {\
            if (project.hasProperty("MAPAGRI_UPLOAD_STORE_FILE")) {\
                storeFile file(MAPAGRI_UPLOAD_STORE_FILE)\
                storePassword MAPAGRI_UPLOAD_STORE_PASSWORD\
                keyAlias MAPAGRI_UPLOAD_KEY_ALIAS\
                keyPassword MAPAGRI_UPLOAD_KEY_PASSWORD\
            }\
        }\
    }' android/app/build.gradle
    
    # Configurar buildTypes
    sed -i '/release {/,/}/ s/}/        signingConfig signingConfigs.release\
    }/' android/app/build.gradle
fi

# Build do APK de release
echo -e "\n${YELLOW}🔨 Fazendo build do APK de release...${NC}"
cd android
./gradlew assembleRelease

# Verificar se foi criado
APK_PATH="app/build/outputs/apk/release/app-release.apk"
if [ -f "$APK_PATH" ]; then
    APK_SIZE=$(du -h "$APK_PATH" | cut -f1)
    echo -e "${GREEN}✅ APK criado com sucesso! Tamanho: $APK_SIZE${NC}"
    
    # Criar pasta de distribuição
    cd ..
    mkdir -p ../dist/release
    
    # Copiar APK com nome versionado
    VERSION=$(node -p "require('./package.json').version")
    FINAL_NAME="MapAgri-v$VERSION-release.apk"
    
    cp "android/$APK_PATH" "../dist/release/$FINAL_NAME"
    
    echo -e "${GREEN}📦 APK disponível em: dist/release/$FINAL_NAME${NC}"
    
    # Gerar informações do APK
    cat > "../dist/release/APK_INFO.txt" << EOF
MapAgri v$VERSION - APK Release
===============================

Arquivo: $FINAL_NAME
Tamanho: $APK_SIZE
Data: $(date)
Plataforma: Android (API 21+)

Instalação:
1. Baixar o APK no celular Android
2. Permitir "Fontes desconhecidas" nas configurações
3. Tocar no arquivo APK para instalar
4. Seguir instruções na tela

Compatibilidade:
- Android 5.0+ (API 21+)
- RAM: 2GB mínimo, 4GB recomendado
- Armazenamento: 100MB livres
- GPS obrigatório
- Câmera recomendada

Funcionalidades:
✅ Coleta de amostras de solo com GPS
✅ 10 tipos de solo diferentes
✅ Upload de fotos
✅ Funciona offline
✅ Export/Import KML
✅ Sincronização com nuvem (opcional)

Suporte:
- GitHub: https://github.com/SauloRodrigues20/MapAgri
- Issues: https://github.com/SauloRodrigues20/MapAgri/issues
- Email: suporte@mapagri.com.br

Desenvolvido com ❤️ para a agricultura brasileira 🇧🇷
EOF
    
    # Gerar checksums
    cd ../dist/release
    sha256sum "$FINAL_NAME" > "$FINAL_NAME.sha256"
    
    echo -e "${BLUE}🔐 Checksum SHA256 gerado${NC}"
    
    # Criar script de instalação para usuário final
    cat > "instalar-mapagri.sh" << 'EOF'
#!/bin/bash

# MapAgri - Instalador Direto no Celular
# Execute este script no seu celular Android com Termux

echo "📱 MapAgri - Instalador para Android"
echo "===================================="

# Verificar se estamos no Android
if [ ! -d "/storage/emulated/0" ]; then
    echo "❌ Este script é para Android com Termux"
    echo "📥 Baixe o APK diretamente: MapAgri-v*.apk"
    exit 1
fi

# Copiar APK para Downloads
APK_FILE=$(ls MapAgri-v*.apk 2>/dev/null | head -1)
if [ -f "$APK_FILE" ]; then
    cp "$APK_FILE" /storage/emulated/0/Download/
    echo "✅ APK copiado para Downloads"
    echo "📱 Abra o gerenciador de arquivos e instale"
else
    echo "❌ APK não encontrado nesta pasta"
fi
EOF
    
    chmod +x "instalar-mapagri.sh"
    
    # Mostrar resumo
    echo -e "\n${GREEN}🎉 APK de distribuição criado com sucesso!${NC}\n"
    
    echo -e "${BLUE}📋 Arquivos gerados:${NC}"
    ls -la
    
    echo -e "\n${YELLOW}📱 Para distribuir:${NC}"
    echo -e "1. Upload do APK para GitHub Releases"
    echo -e "2. Compartilhar link: https://github.com/SauloRodrigues20/MapAgri/releases"
    echo -e "3. Usuários baixam e instalam diretamente no celular"
    
    echo -e "\n${YELLOW}🔗 Link direto:${NC}"
    echo -e "https://github.com/SauloRodrigues20/MapAgri/releases/download/v$VERSION/$FINAL_NAME"
    
    # Testar APK (se tiver dispositivo conectado)
    cd ../../MapAgriApp
    if adb devices | grep -q device; then
        echo -e "\n${BLUE}📱 Testando instalação...${NC}"
        adb install -r "../dist/release/$FINAL_NAME"
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ APK instalado com sucesso no dispositivo!${NC}"
        fi
    fi
    
else
    echo -e "${RED}❌ Erro ao criar APK de release${NC}"
    echo -e "${YELLOW}Verifique os logs acima para mais detalhes${NC}"
    exit 1
fi

cd ..
echo -e "\n${GREEN}🌾 MapAgri APK pronto para distribuição! 🚀${NC}"