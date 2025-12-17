# 🚀 MapAgri - Como Usar (Guia Rápido)

## 📥 Instalação (1 Comando)

### Linux/macOS:
```bash
curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.sh | bash
```

### Windows:
```batch
curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.bat -o install.bat && install.bat
```

### Manual:
```bash
git clone https://github.com/SauloRodrigues20/MapAgri.git
cd MapAgri
./install.sh
```

## ⚡ Quick Start

```bash
# 1. Iniciar o app
./start.sh

# 2. Em outro terminal - Android
cd MapAgriApp
npm run android

# 3. Ou iOS (apenas macOS)
npm run ios
```

## 🌾 Como Usar o App

### 1. 🏠 Tela Home
- **Dashboard** com estatísticas das amostras
- **Botão "+" para nova coleta**
- **Acesso rápido a todas as funcionalidades**

### 2. 🗺️ Coleta no Mapa
1. Tocar no **botão GPS** para ativar localização
2. Aguardar **precisão <10m** (indicador verde)
3. Tocar no **mapa onde coletar** a amostra
4. Preencher **dados da amostra** no formulário

### 3. 🌾 Dados da Amostra
- **Tipo de Solo**: Escolher entre 10 tipos
- **Profundidade**: 0-30cm, 30-60cm, etc.
- **Observações**: Notas técnicas
- **Foto**: Opcional, upload automático

### 4. 📋 Lista de Amostras
- **Visualizar todas** as amostras coletadas
- **Filtrar por data**, tipo, etc.
- **Editar ou deletar** amostras
- **Status de sincronização** (nuvem/local)

### 5. 📂 Import/Export KML
- **Importar** arquivos KML do Google Earth
- **Exportar** dados para KML
- **Visualizar** pontos importados no mapa
- **Compatível** com software GIS

### 6. 👤 Perfil
- **Configurações** do usuário
- **Estatísticas** pessoais
- **Sincronização** manual
- **Sobre** o aplicativo

## 🔧 Configuração Inicial

### 1. Supabase (Backend)
1. Criar conta no [Supabase](https://app.supabase.com)
2. Criar novo projeto
3. Executar SQL: `database/supabase-setup.sql`
4. Copiar URL e API Key para `.env`

### 2. Arquivo .env
```bash
# Suas credenciais do Supabase
SUPABASE_URL=https://seu-projeto.supabase.co
SUPABASE_ANON_KEY=sua-chave-anonima

# Configurações do app
APP_NAME=MapAgri
DEBUG_MODE=true
GPS_ACCURACY_THRESHOLD=10
```

### 3. Permissões
- **📍 GPS/Localização**: Obrigatório
- **📸 Câmera**: Para fotos das amostras
- **💾 Armazenamento**: Para salvar dados offline
- **🌐 Internet**: Para sincronizar com a nuvem

## 📱 Funcionalidades Principais

### 🎯 GPS de Alta Precisão
- **Precisão submétrica** (< 10m)
- **Indicador visual** de qualidade do sinal
- **Aguarda automaticamente** GPS de qualidade
- **Funciona em campo aberto** e áreas rurais

### 🌾 10 Tipos de Solo
1. **Argiloso** - Solo pesado, alta retenção
2. **Arenoso** - Solo leve, boa drenagem  
3. **Franco** - Solo equilibrado
4. **Franco-Argiloso** - Mistura com argila
5. **Franco-Arenoso** - Mistura com areia
6. **Siltoso** - Partículas médias
7. **Orgânico** - Rico em matéria orgânica
8. **Calcário** - Alto teor de cálcio
9. **Laterítico** - Típico tropical
10. **Outro** - Tipo personalizado

### 📊 Dados Coletados
- **Coordenadas GPS** (lat/lng)
- **Tipo de solo** (classificação)
- **Profundidade** da coleta
- **Data/hora** automática
- **Foto** do local (opcional)
- **Observações** técnicas
- **Precisão GPS** no momento da coleta

### ☁️ Sincronização Inteligente
- **Offline-first**: Funciona sem internet
- **Sync automático** quando conecta
- **Queue de upload** para fotos/dados
- **Resolução de conflitos** automática
- **Backup em tempo real** no Supabase

## 🧪 Testes e Validação

### Testar Instalação
```bash
./test-install.sh
```

### Testar Funcionalidades
```bash
cd MapAgriApp
node scripts/web-simulator.js
```

### Verificar TypeScript
```bash
cd MapAgriApp
npx tsc --noEmit
```

### Testar Supabase
```bash
cd MapAgriApp
node scripts/test-supabase.js
```

## 🚀 Build para Produção

### Android APK
```bash
./build.sh
# Escolher opção 1 (Android)
# APK será gerado em: dist/MapAgri-v1.0.0-release.apk
```

### iOS Archive (macOS)
```bash
./build.sh
# Escolher opção 2 (iOS)
# Archive em: dist/MapAgriApp.xcarchive
```

### Build Completo
```bash
./build.sh
# Escolher opção 4 (All-in-one)
# Pacote ZIP com tudo: dist/MapAgri-v1.0.0-distribution.zip
```

## 🌾 Casos de Uso Práticos

### 👨‍🌾 Agricultor
1. **Coleta de amostras** para análise de solo
2. **Mapeamento de propriedade** rural  
3. **Histórico de coletas** por talhão
4. **Export para laboratório** (KML/dados)

### 🔬 Técnico Agrícola
1. **Coleta georeferenciada** precisa
2. **Classificação técnica** de solos
3. **Relatórios para clientes** (export)
4. **Integração com GIS** profissional

### 🏢 Consultoria
1. **Múltiplos projetos** (um app)
2. **Dados sincronizados** em equipe
3. **Backup automático** na nuvem
4. **Relatórios profissionais**

### 🎓 Pesquisa
1. **Dados científicos** georeferenciados
2. **Export para análise** estatística
3. **Compatibilidade** com software científico
4. **Histórico completo** de coletas

## 🔧 Troubleshooting

### GPS não funciona
- Verificar **permissões** de localização
- Usar em **área aberta** (não indoor)
- Aguardar **indicador verde** (precisão OK)
- **Reiniciar** GPS se necessário

### Fotos não sobem
- Verificar **conexão** com internet
- Verificar **espaço** no dispositivo  
- Verificar **configuração** Supabase
- **Tentar novamente** depois

### App não conecta Supabase
- Verificar **credenciais** no .env
- Verificar **conexão** com internet
- Verificar **URL** do projeto Supabase
- **Executar SQL** do setup se necessário

### Build falha
- **Limpar cache**: `npx react-native start --reset-cache`
- **Reinstalar** dependências: `rm -rf node_modules && npm install`
- **Verificar** Android SDK/Xcode
- **Executar** script de limpeza

## 📞 Suporte

- **🐛 Bugs**: [GitHub Issues](https://github.com/SauloRodrigues20/MapAgri/issues)
- **💡 Sugestões**: [Discussions](https://github.com/SauloRodrigues20/MapAgri/discussions)
- **📚 Docs**: [Documentação](docs/)
- **📧 Email**: suporte@mapagri.com.br

---

## 🎯 Em Resumo

1. **Baixar**: `curl -L https://...install.sh | bash`
2. **Configurar**: Credenciais Supabase no .env
3. **Executar**: `./start.sh` e `npm run android`
4. **Usar**: Tocar no mapa, coletar amostras, sincronizar

**🌾 Simples assim! MapAgri pronto para revolucionar sua coleta de solo! 🚀**