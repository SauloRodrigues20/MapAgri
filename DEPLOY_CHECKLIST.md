# 📋 MapAgri - Checklist de Deploy

## ✅ Pré-Deploy

### Código
- [ ] Todos os arquivos TypeScript compilam sem erro (`npx tsc --noEmit`)
- [ ] Testes passando (`npm test`)
- [ ] Lint limpo (`npm run lint`)
- [ ] Build local funcionando (`npm run android/ios`)

### Configuração
- [ ] Arquivo `.env` configurado corretamente
- [ ] Credenciais do Supabase válidas
- [ ] Permissões de GPS configuradas (Android/iOS)
- [ ] Ícones e splash screens prontos
- [ ] Versões atualizadas no `package.json`

### Banco de Dados
- [ ] Schema do Supabase executado (`database/supabase-setup.sql`)
- [ ] RLS policies configuradas
- [ ] Storage buckets criados
- [ ] Testes de conexão passando

## 🚀 Deploy Process

### 1. Android (Google Play Store)

#### Preparação
- [ ] Keystore criado e configurado
- [ ] `android/app/build.gradle` com versão correta
- [ ] Permissões necessárias no `AndroidManifest.xml`
- [ ] Ícones adaptáveis configurados

#### Build
```bash
cd android
./gradlew clean
./gradlew assembleRelease
```

#### Verificação
- [ ] APK gerado em `android/app/build/outputs/apk/release/`
- [ ] APK testado em dispositivo real
- [ ] Tamanho do APK aceitável (<50MB)
- [ ] Performance satisfatória

#### Upload
- [ ] APK uploaded no Google Play Console
- [ ] Screenshots e descrições atualizadas
- [ ] Política de privacidade publicada
- [ ] Teste interno realizado

### 2. iOS (App Store)

#### Preparação (apenas macOS)
- [ ] Certificados iOS válidos
- [ ] Provisioning profiles atualizados
- [ ] `Info.plist` com permissões corretas
- [ ] Bundle ID único configurado

#### Build
```bash
cd ios
pod install
xcodebuild -workspace MapAgriApp.xcworkspace -scheme MapAgriApp -configuration Release archive
```

#### Verificação
- [ ] Archive criado com sucesso
- [ ] Testado no simulador iOS
- [ ] Testado em dispositivo físico
- [ ] Performance iOS satisfatória

#### Upload
- [ ] Archive enviado via Xcode Organizer
- [ ] App Store Connect configurado
- [ ] Metadata e screenshots iOS
- [ ] TestFlight configurado

### 3. Distribuição Alternativa

#### APK Direto
- [ ] APK assinado disponível
- [ ] Documentação de instalação manual
- [ ] QR code para download
- [ ] Instruções de "Fontes desconhecidas"

#### Distribuição Interna
- [ ] Servidor de distribuição configurado
- [ ] Links de download seguros
- [ ] Sistema de versionamento
- [ ] Notificações de atualizações

## 🔧 Configuração de Produção

### Environment Variables
```bash
# Production .env
SUPABASE_URL=https://your-prod-project.supabase.co
SUPABASE_ANON_KEY=your-prod-anon-key
APP_NAME=MapAgri
APP_VERSION=1.0.0
DEBUG_MODE=false
GPS_ACCURACY_THRESHOLD=5
SYNC_INTERVAL=60000
```

### Supabase Production
- [ ] Projeto de produção criado
- [ ] Database migrated
- [ ] Storage configurado
- [ ] API keys rotacionadas
- [ ] Backup automático configurado

### Monitoramento
- [ ] Crash reporting (Crashlytics/Sentry)
- [ ] Analytics (Firebase/Mixpanel)
- [ ] Error tracking configurado
- [ ] Performance monitoring

## 📖 Documentação para Usuários

### README Atualizado
- [ ] Instruções de instalação claras
- [ ] Screenshots da aplicação
- [ ] FAQ com problemas comuns
- [ ] Links para suporte

### Documentação Técnica
- [ ] API documentation
- [ ] Setup guide para desenvolvedores
- [ ] Contribution guidelines
- [ ] Changelog atualizado

### Tutoriais
- [ ] Video walkthrough
- [ ] Guia passo-a-passo
- [ ] Casos de uso práticos
- [ ] Troubleshooting guide

## 🧪 Testes Finais

### Funcionalidades Core
- [ ] GPS tracking funcionando
- [ ] Coleta de amostras completa
- [ ] Upload de fotos
- [ ] Sync com Supabase
- [ ] Export/Import KML
- [ ] Offline mode

### Compatibilidade
- [ ] Android 8+ (API 26+)
- [ ] iOS 13+
- [ ] Diferentes tamanhos de tela
- [ ] Orientação portrait/landscape
- [ ] Performance em dispositivos low-end

### Rede
- [ ] Funciona offline
- [ ] Sync quando volta conexão
- [ ] Timeout handling
- [ ] Retry logic implementado
- [ ] Compressão de imagens

## 📞 Suporte Pós-Deploy

### Canais de Suporte
- [ ] GitHub Issues configurado
- [ ] Documentação de FAQ
- [ ] Email de suporte
- [ ] Discord/Telegram community

### Atualizações
- [ ] Processo de release definido
- [ ] CI/CD pipeline configurado
- [ ] Testing automático
- [ ] Rollback strategy

### Métricas
- [ ] Downloads tracking
- [ ] User engagement
- [ ] Crash rates
- [ ] Performance metrics

---

## ✅ Checklist Final

Antes de marcar como "Pronto para Produção":

- [ ] Todos os itens acima verificados
- [ ] Testes em múltiplos dispositivos
- [ ] Performance satisfatória
- [ ] Documentação completa
- [ ] Suporte configurado
- [ ] Monitoramento ativo

**Data do Deploy**: _______________
**Versão**: 1.0.0
**Responsável**: Saulo Rodrigues

---

🌾 **MapAgri pronto para transformar a agricultura!** 🚀