# 📱 MapAgri - Gerar APK Tradicional

Múltiplas opções para gerar um **APK tradicional instalável**:

## 🚀 Opção 1: EAS Build (Recomendado)

```bash
# Execute o script automatizado
./build-apk-real.sh
```

### Vantagens:
- ✅ Não precisa instalar Android Studio (500MB+)
- ✅ Build na nuvem (mais rápido)
- ✅ APK assinado e otimizado
- ✅ Funciona em qualquer sistema

### Passos:
1. **Criar conta**: https://expo.dev (grátis)
2. **Executar script**: `./build-apk-real.sh`
3. **Aguardar**: 5-15 minutos 
4. **Download**: APK será baixado automaticamente

---

## 🛠️ Opção 2: Android Studio Local

Se preferir controle total:

### 1. Instalar Android Studio
```bash
# Ubuntu/Debian
sudo snap install android-studio --classic

# Ou baixar: https://developer.android.com/studio
```

### 2. Configurar SDK
```bash
# No Android Studio:
# - Tools > SDK Manager
# - Install Android SDK 34
# - Install Android SDK Build-Tools
```

### 3. Gerar APK
```bash
cd MapAgriApp

# Criar bundle para Android
npx expo run:android --variant release

# Ou build direto
npx expo build:android
```

---

## 🤖 Opção 3: GitHub Actions (Automático)

**Já configurado!** Workflow em [`.github/workflows/build-apk.yml`](.github/workflows/build-apk.yml)

### Para usar:
```bash
# 1. Configurar token do Expo
# GitHub > Settings > Secrets > New secret
# Nome: EXPO_TOKEN
# Valor: (pegar em https://expo.dev/settings/access-tokens)

# 2. Criar release
git tag v1.0.0
git push origin v1.0.0

# 3. APK será gerado automaticamente
# Download em: GitHub > Releases
```

---

## 📥 Resultado Final

Qualquer opção gerará:

```
📱 MapAgri-v1.0.0.apk
├── 📦 Tamanho: ~50-100MB
├── 🔒 Assinado digitalmente
├── 📱 Instalável em qualquer Android
├── 🌐 Funciona offline
└── 🌾 Pronto para agricultura!
```

---

## 🎯 Distribuição

### Para usuários finais:
```bash
# Método 1: WhatsApp/Telegram
"Baixe o MapAgri: [link-do-apk]"

# Método 2: Site/Google Drive
"APK disponível em: drive.google.com/..."

# Método 3: GitHub Releases
"Download: github.com/seu-usuario/mapagri/releases"
```

### Instalação no celular:
1. 📱 Baixar APK
2. ⚙️ Configurações > Segurança > "Fontes desconhecidas"
3. 📂 Abrir APK baixado
4. ✅ Instalar
5. 🌾 Usar para agricultura!

---

## 🔧 Troubleshooting

### EAS Build falhou?
```bash
# Verificar logs
eas build:list
eas build:view BUILD_ID
```

### APK não instala?
- ✅ Ativar "Fontes desconhecidas" 
- ✅ Verificar espaço (100MB livre)
- ✅ Android 5.0+ (API 21+)

### Erro de permissões?
```bash
# Primeiro build precisa de setup
eas build:configure
```

---

## 💡 Próximos Passos

1. **Gerar APK**: Use opção 1 (EAS) ou 2 (Android Studio)
2. **Testar**: Instalar no seu celular primeiro
3. **Distribuir**: Compartilhar APK com agricultores
4. **Automatizar**: Configurar GitHub Actions para builds automáticos

---

**🌾 Seu APK tradicional será instalável em qualquer Android! 📱**