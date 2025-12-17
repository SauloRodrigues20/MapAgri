# ⚡ GitHub Actions - Guia Rápido

## ✅ Status
- **Workflow configurado**: `.github/workflows/build-apk.yml` ✅
- **Próximo passo**: Configurar `EXPO_TOKEN` no GitHub

---

## 🚀 Como Ativar (3 passos)

### 1️⃣ Criar conta Expo
```bash
# Acesse: https://expo.dev/signup
# Ou via CLI: npx expo register
```

### 2️⃣ Gerar token
1. 🌐 **Login**: https://expo.dev/login
2. 🔑 **Token**: https://expo.dev/settings/access-tokens  
3. 📋 **Criar**: "Create token" > Nome: `GitHub MapAgri`
4. ⏰ **Validade**: `No expiration`
5. 📄 **COPIAR TOKEN** (só aparece uma vez!)

### 3️⃣ Configurar no GitHub
1. 🌐 **Secrets**: https://github.com/SauloRodrigues20/MapAgri/settings/secrets/actions
2. ➕ **Novo**: "New repository secret"  
3. 📝 **Nome**: `EXPO_TOKEN`
4. 📋 **Valor**: Cole o token
5. ✅ **Salvar**: "Add secret"

---

## 🏷️ Disparar Build

### Método 1: Via Tag (Automático)
```bash
git tag v1.0.0
git push origin v1.0.0
# APK será gerado automaticamente!
```

### Método 2: Via GitHub Web
1. **Actions**: https://github.com/SauloRodrigues20/MapAgri/actions
2. **Workflow**: "🏗️ Build APK Tradicional"
3. **Executar**: "Run workflow"

---

## 📱 Resultado

**Em 10-15 minutos você terá**:
- 📦 **MapAgri-v1.0.0.apk** (50-100MB)
- 📍 **Download**: https://github.com/SauloRodrigues20/MapAgri/releases
- ✅ **Instalável** em qualquer Android
- 🔒 **Assinado** digitalmente

---

## 🔧 Links Úteis

| Função | Link |
|--------|------|
| 🔐 **Criar conta Expo** | https://expo.dev/signup |
| 🔑 **Gerar token** | https://expo.dev/settings/access-tokens |
| ⚙️ **Configurar secret** | https://github.com/SauloRodrigues20/MapAgri/settings/secrets/actions |
| 🤖 **Ver builds** | https://github.com/SauloRodrigues20/MapAgri/actions |
| 📱 **Download APK** | https://github.com/SauloRodrigues20/MapAgri/releases |

---

## 🎯 Teste Rápido

Depois de configurar o `EXPO_TOKEN`:

```bash
# 1. Criar tag
git tag v1.0.0

# 2. Enviar para GitHub  
git push origin v1.0.0

# 3. Verificar build
echo "🔗 Acompanhar: https://github.com/SauloRodrigues20/MapAgri/actions"

# 4. APK em ~15 minutos
echo "📱 Download: https://github.com/SauloRodrigues20/MapAgri/releases"
```

---

**🌾 GitHub Actions configurado! Só falta o EXPO_TOKEN! 🚀**