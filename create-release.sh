#!/bin/bash

# 🚀 MapAgri - Criar Release no GitHub com APK

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🚀 MapAgri - Publicar Release no GitHub${NC}\n"

# Verificar se estamos na pasta correta
if [ ! -f "MapAgriApp/package.json" ]; then
    echo -e "${RED}❌ Execute este script na pasta raiz do MapAgri${NC}"
    exit 1
fi

# Verificar se gh (GitHub CLI) está instalado
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI não encontrado!${NC}"
    echo -e "${YELLOW}📥 Instale: https://cli.github.com/${NC}"
    exit 1
fi

# Verificar se está logado no GitHub
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}🔐 Fazendo login no GitHub...${NC}"
    gh auth login
fi

# Obter versão do package.json
VERSION=$(cd MapAgriApp && node -p "require('./package.json').version")
TAG="v$VERSION"

echo -e "${BLUE}📋 Criando release $TAG...${NC}"

# Verificar se APK existe
APK_PATH="dist/release/MapAgri-v$VERSION-release.apk"
if [ ! -f "$APK_PATH" ]; then
    echo -e "${YELLOW}📱 APK não encontrado. Gerando...${NC}"
    ./generate-apk.sh
    
    # Verificar novamente
    if [ ! -f "$APK_PATH" ]; then
        echo -e "${RED}❌ Falha ao gerar APK${NC}"
        exit 1
    fi
fi

# Verificar se release já existe
if gh release view "$TAG" &> /dev/null; then
    echo -e "${YELLOW}⚠️  Release $TAG já existe${NC}"
    echo -e "${BLUE}Deseja atualizar? (y/n):${NC}"
    read -r response
    
    if [[ "$response" == "y" || "$response" == "Y" ]]; then
        echo -e "${YELLOW}🗑️ Deletando release existente...${NC}"
        gh release delete "$TAG" --yes
    else
        echo -e "${YELLOW}Cancelado pelo usuário${NC}"
        exit 0
    fi
fi

# Criar release notes
cat > release_notes.md << EOF
# 🌾 MapAgri v$VERSION - Sistema de Coleta de Amostras de Solo

## 📱 Download Direto
Baixe o APK e instale no seu celular Android:

## ✨ Funcionalidades

### 🎯 GPS de Alta Precisão
- Coleta submétrica (precisão <10m)
- Funciona em áreas rurais abertas
- Indicador visual de qualidade do sinal

### 🌾 10 Tipos de Solo
- Argiloso, Arenoso, Franco, Siltoso
- Franco-Argiloso, Franco-Arenoso
- Orgânico, Calcário, Laterítico, Outro

### 📸 Upload de Fotos
- Fotos das amostras coletadas
- Sincronização automática na nuvem
- Compressão inteligente

### 📊 Dados Coletados
- Coordenadas GPS precisas
- Data/hora automática
- Classificação técnica do solo
- Profundidade da coleta
- Observações de campo

### ☁️ Sincronização Inteligente
- **Funciona 100% offline**
- Sincroniza automaticamente quando tem internet
- Backup na nuvem via Supabase
- Queue de upload para fotos

### 📂 Import/Export
- Export para KML (Google Earth)
- Compatível com software GIS
- Relatórios em CSV/Excel

## 📱 Instalação

### Android
1. Baixar o APK acima
2. Permitir "Fontes desconhecidas" nas configurações
3. Instalar tocando no arquivo
4. Permitir permissões de GPS e câmera

## 🔧 Compatibilidade
- **Android**: 5.0+ (API 21+)
- **RAM**: 2GB mínimo, 4GB recomendado
- **Armazenamento**: 100MB livres
- **GPS**: Obrigatório
- **Câmera**: Recomendada

## 📖 Documentação
- [Como Baixar e Instalar](BAIXAR_CELULAR.md)
- [Como Executar Código](EXECUTAR.md)
- [Como Usar Completo](COMO_USAR.md)
- [Setup Supabase](docs/SUPABASE_SETUP.md)

## 🆘 Suporte
- **Issues**: [Reportar problemas](https://github.com/SauloRodrigues20/MapAgri/issues)
- **Discussions**: [Perguntas e sugestões](https://github.com/SauloRodrigues20/MapAgri/discussions)
- **Email**: suporte@mapagri.com.br

## 🌾 Para Quem é?
- **👨‍🌾 Agricultores** - Coleta precisa de amostras
- **🔬 Técnicos Agrícolas** - Análise georeferenciada
- **🏢 Consultorias** - Relatórios profissionais
- **🎓 Pesquisadores** - Dados científicos

---

**🇧🇷 Desenvolvido com ❤️ para a agricultura brasileira**

**Agricultura de precisão acessível para todos!**
EOF

# Criar release
echo -e "${YELLOW}📤 Criando release no GitHub...${NC}"

gh release create "$TAG" \
    --title "🌾 MapAgri v$VERSION" \
    --notes-file release_notes.md \
    --latest \
    "$APK_PATH#MapAgri-v$VERSION-release.apk"

# Verificar se foi criado
if gh release view "$TAG" &> /dev/null; then
    echo -e "${GREEN}✅ Release criado com sucesso!${NC}\n"
    
    # Mostrar informações
    echo -e "${BLUE}📋 Informações do Release:${NC}"
    echo -e "Tag: $TAG"
    echo -e "APK: MapAgri-v$VERSION-release.apk"
    echo -e "Size: $(du -h "$APK_PATH" | cut -f1)"
    
    echo -e "\n${BLUE}🔗 Links:${NC}"
    echo -e "Release: https://github.com/SauloRodrigues20/MapAgri/releases/tag/$TAG"
    echo -e "APK Direto: https://github.com/SauloRodrigues20/MapAgri/releases/download/$TAG/MapAgri-v$VERSION-release.apk"
    
    echo -e "\n${GREEN}🎉 Agora os usuários podem baixar o APK diretamente!${NC}"
    
    # Testar links
    echo -e "\n${YELLOW}🧪 Testando links...${NC}"
    if curl -I "https://github.com/SauloRodrigues20/MapAgri/releases/download/$TAG/MapAgri-v$VERSION-release.apk" 2>/dev/null | grep -q "200 OK"; then
        echo -e "${GREEN}✅ Link do APK funcionando${NC}"
    else
        echo -e "${YELLOW}⚠️ Link pode demorar alguns minutos para ficar disponível${NC}"
    fi
    
else
    echo -e "${RED}❌ Erro ao criar release${NC}"
    exit 1
fi

# Limpar arquivo temporário
rm -f release_notes.md

echo -e "\n${GREEN}🌾 Release publicado! MapAgri disponível para download! 🚀${NC}"