#!/bin/bash

# 🏗️ MapAgri - Criador de APK de Demonstração (Sem Android SDK)

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🏗️ MapAgri - APK de Demonstração${NC}\n"

cd MapAgriApp

# Criar bundle JavaScript
echo -e "${YELLOW}📦 Criando bundle JavaScript...${NC}"
npx react-native bundle \
    --platform android \
    --dev false \
    --entry-file index.js \
    --bundle-output android/app/src/main/assets/index.android.bundle \
    --assets-dest android/app/src/main/res

# Criar estrutura de APK simulado
echo -e "${YELLOW}📱 Criando estrutura de APK de demonstração...${NC}"

mkdir -p ../dist/demo
cd ../dist/demo

# Criar arquivo de informações do APK
cat > MapAgri-Demo-Info.txt << 'EOF'
🌾 MapAgri v1.0.0 - Informações de Build
=======================================

📱 ESTE É UM PROJETO DE DEMONSTRAÇÃO

⚠️  Para usar o app real no celular, você precisa:

1. 🏗️ BUILDAR O APK:
   - Instalar Android Studio
   - Configurar Android SDK
   - Executar: ./generate-apk.sh

2. 📱 OU USAR ALTERNATIVAS:
   - Expo Go (mais fácil para testar)
   - React Native CLI com emulador
   - Simulador web: node scripts/web-simulator.js

3. 🌐 FUNCIONALIDADES JÁ PRONTAS:
   ✅ 6 telas completas (Home, Mapa, Coleta, etc)
   ✅ 5 serviços (GPS, Storage, Supabase, etc)
   ✅ TypeScript sem erros
   ✅ React Navigation funcionando
   ✅ Supabase integrado e testado
   ✅ Todos os recursos implementados

📋 ESTRUTURA DO PROJETO:
src/
├── screens/         # 6 telas do app
├── services/        # Lógica de negócio
├── navigation/      # Navegação
└── types/           # Tipos TypeScript

📖 DOCUMENTAÇÃO COMPLETA:
- BAIXAR_CELULAR.md  # Para usuário final
- EXECUTAR.md        # Para desenvolvedores
- COMO_USAR.md       # Guia completo
- docs/              # Documentação técnica

🚀 PARA TESTAR AGORA:
cd MapAgriApp
npm start            # Metro bundler
npm run android      # Se tiver Android Studio

🌐 SIMULADOR WEB:
node scripts/web-simulator.js

📞 SUPORTE:
GitHub: https://github.com/SauloRodrigues20/MapAgri
Issues: https://github.com/SauloRodrigues20/MapAgri/issues

🌾 MapAgri - Agricultura de precisão 100% funcional!
Apenas precisa de Android Studio para gerar APK final.
EOF

# Criar script de instalação para o usuário
cat > install-mapagri.sh << 'EOF'
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
EOF

chmod +x install-mapagri.sh

# Copiar bundle e assets para demonstração
echo -e "${BLUE}📦 Copiando arquivos de demonstração...${NC}"

if [ -f "../../MapAgriApp/android/app/src/main/assets/index.android.bundle" ]; then
    cp "../../MapAgriApp/android/app/src/main/assets/index.android.bundle" .
    echo -e "${GREEN}✅ Bundle JavaScript copiado${NC}"
fi

# Criar arquivo ZIP de demonstração
echo -e "${YELLOW}📦 Criando pacote de demonstração...${NC}"
zip -r "MapAgri-v1.0.0-Demo-Package.zip" . -x "*.DS_Store"

echo -e "\n${GREEN}🎉 Pacote de demonstração criado!${NC}\n"

echo -e "${BLUE}📋 Arquivos gerados em dist/demo/:${NC}"
ls -la

echo -e "\n${YELLOW}💡 Para usuários finais:${NC}"
echo -e "1. 📱 Precisam de APK real (Android Studio necessário)"
echo -e "2. 🌐 Podem testar no simulador web"
echo -e "3. 💻 Podem clonar e rodar localmente"

echo -e "\n${BLUE}🔗 Links funcionais:${NC}"
echo -e "- Projeto: https://github.com/SauloRodrigues20/MapAgri"
echo -e "- Instalação: curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.sh | bash"

echo -e "\n${GREEN}🌾 MapAgri demonstração pronta! 🚀${NC}"
EOF

chmod +x /workspaces/MapAgri/create-demo.sh