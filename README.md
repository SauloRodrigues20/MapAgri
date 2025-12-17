# 🌾 MapAgri - Sistema de Coleta de Amostras de Solo

[![React Native](https://img.shields.io/badge/React%20Native-0.83-blue.svg)](https://reactnative.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue.svg)](https://www.typescriptlang.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Ready-green.svg)](https://supabase.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Sistema completo para coleta georeferenciada de amostras de solo com GPS de alta precisão e sincronização em nuvem.

## 🚀 Instalação Rápida (1 Comando)

### **💻 Para Desenvolvedores/Testes:**
```bash
# Instalar automaticamente  
curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.sh | bash
```

### **📱 Para Usuários Finais:**
```bash
# EXPO GO (app real no celular):
# 1. Baixar "Expo Go" na Play Store
# 2. git clone + npx expo start --tunnel  
# 3. Escanear QR code

# WEB SIMULATOR (testar rápido):
node scripts/web-simulator.js
```

### Ou manualmente:

```bash
# 1. Clonar projeto
git clone https://github.com/SauloRodrigues20/MapAgri.git
cd MapAgri/MapAgriApp

# 2. Instalar dependências
npm install

# 3. Executar
npm run android  # ou npm run ios
```

## 📱 Funcionalidades

- **🗺️ GPS de Alta Precisão**: Coleta submétrica para agricultura
- **🌾 10 Tipos de Solo**: Classificação técnica completa  
- **📸 Upload Automático**: Fotos sincronizadas na nuvem
- **📂 Import/Export KML**: Compatível com Google Earth
- **☁️ Supabase Backend**: PostgreSQL + Storage + Real-time
- **📱 Offline-First**: Funciona sem internet, sincroniza depois

## 🛠️ Pré-requisitos

- **Node.js** 18+ ([Download](https://nodejs.org/))
- **Android Studio** (para Android)
- **Xcode** (para iOS - apenas macOS)

## ⚡ Quick Start

### 1. Configurar Backend (Opcional)
```bash
# Criar projeto no Supabase (https://app.supabase.com)
# Executar SQL: database/supabase-setup.sql  
# Configurar .env com suas credenciais
```

### 2. Executar App
```bash
npm run android  # Android
npm run ios      # iOS  
npm start        # Metro bundler
```

## 📊 Tecnologias

| Categoria | Tecnologia |
|-----------|------------|
| **Framework** | React Native 0.83 + TypeScript |
| **Navegação** | React Navigation 6 |
| **Mapas** | react-native-maps + GPS nativo |
| **Backend** | Supabase (PostgreSQL + Storage) |
| **Storage** | AsyncStorage + Sync inteligente |
| **Camera** | react-native-image-picker |

## 🗂️ Estrutura

```
MapAgriApp/
├── src/
│   ├── screens/          # 6 telas principais
│   ├── services/         # Lógica de negócio
│   ├── navigation/       # React Navigation
│   └── types/           # TypeScript definitions
├── database/            # Scripts SQL Supabase
├── scripts/            # Utilitários e testes
└── docs/               # Documentação completa
```

## 📱 Telas

| Tela | Função |
|------|---------|
| **🏠 Home** | Dashboard com estatísticas |
| **🗺️ Mapa** | Visualização GPS + coleta |
| **🌾 Coleta** | Formulário de amostras |
| **📋 Amostras** | Lista de dados coletados |
| **📂 KML** | Import/Export de arquivos |
| **👤 Perfil** | Configurações do usuário |

## 🧪 Testes

```bash
# Testar conexão Supabase
node scripts/test-supabase.js

# Verificar TypeScript
npx tsc --noEmit

# Executar testes unitários
npm test

# Limpar cache
./scripts/clean.sh
```

## 📖 Documentação

- [📱 Baixar no Celular](BAIXAR_CELULAR.md) - **APK DIRETO**
- [🚫 SEM Android Studio](SEM_ANDROID_STUDIO.md) - **EXPO GO + OUTRAS**  
- [📤 Como Distribuir](DISTRIBUICAO.md) - **GERAR APK NA NUVEM**
- [⚡ Como Executar](EXECUTAR.md) - **GUIA RÁPIDO**  
- [📋 Como Usar Completo](COMO_USAR.md) - Guia detalhado
- [📘 Setup Supabase](docs/SUPABASE_SETUP.md)
- [🔧 API Reference](docs/API.md)
- [👨‍💻 Dev Guide](docs/DEVELOPMENT.md)

## 🌾 Para Quem é?

- **👨‍🌾 Agricultores** - Coleta precisa de amostras
- **🔬 Técnicos** - Análise georeferenciada
- **🏢 Consultores** - Relatórios profissionais
- **🎓 Pesquisadores** - Dados científicos

## 📞 Suporte

- **🐛 Issues**: [GitHub Issues](https://github.com/SauloRodrigues20/MapAgri/issues)
- **📚 Docs**: [Documentação](docs/)
- **💬 Discussões**: [GitHub Discussions](https://github.com/SauloRodrigues20/MapAgri/discussions)

## 🚀 Deploy & Distribuição

### Build de Produção

```bash
# Android APK
cd android && ./gradlew assembleRelease

# iOS Archive
cd ios && xcodebuild archive -workspace MapAgriApp.xcworkspace
```

### Distribuição
- **Play Store**: `android/app/build/outputs/apk/release/`
- **App Store**: Via Xcode Organizer
- **APK Direto**: Distribuição interna

## 🔐 Segurança

- ✅ **RLS Configurado** no Supabase
- ✅ **Dados por usuário** isolados
- ✅ **HTTPS/SSL** em todas as comunicações
- ✅ **Validação** client + server

## 📈 Roadmap

- [ ] **Autenticação** com login/senha
- [ ] **Relatórios PDF** automáticos
- [ ] **Dashboard Web** para análise
- [ ] **API REST** pública
- [ ] **Machine Learning** para classificação

## 📄 Licença

MIT License - veja [LICENSE](LICENSE) para detalhes.

---

**Desenvolvido com ❤️ para a agricultura brasileira** 🇧🇷

**Versão**: 1.0.0 | **React Native**: 0.83 | **TypeScript**: 5.0