# 🚀 Como Rodar o MapAgri - Super Simples!

## 📥 **1. Baixar (1 comando)**

### **Copie e cole este comando:**

**Linux/macOS:**
```bash
curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.sh | bash
```

**Windows:**
```cmd
curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.bat -o install.bat && install.bat
```

**Ou baixe manual:**
```bash
git clone https://github.com/SauloRodrigues20/MapAgri.git
cd MapAgri
```

---

## ⚡ **2. Executar (2 comandos)**

```bash
# 1. Entrar na pasta
cd MapAgri

# 2. Rodar automaticamente
./start.sh
```

**OU executar manual:**
```bash
# 1. Entrar na pasta do app
cd MapAgri/MapAgriApp

# 2. Rodar no celular
npm run android
```

**Pronto! O app abre no seu celular! 📱**

---

## 🔧 **Se der erro:**

### **Erro: "comando não encontrado"**
```bash
# Instalar Node.js primeiro
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### **Erro: "Android SDK"**
1. Baixar [Android Studio](https://developer.android.com/studio)
2. Instalar
3. Abrir AVD Manager
4. Criar um emulador
5. Tentar novamente: `npm run android`

### **Erro: "device not found"**
- Conectar celular Android via USB
- Ativar "Depuração USB" nas configurações do celular
- Ou usar emulador do Android Studio

---

## 📱 **Outras formas de rodar:**

### **No emulador iOS (só macOS):**
```bash
npm run ios
```

### **Só iniciar Metro Bundler:**
```bash
npm start
```

### **Rodar rápido (script automático):**
```bash
./start.sh
```

---

## 🌾 **Usar o App:**

1. **📍 Permitir GPS** quando solicitar
2. **🗺️ Tocar no mapa** onde quer coletar solo  
3. **🌾 Escolher tipo de solo** (10 tipos disponíveis)
4. **📸 Tirar foto** (opcional)
5. **💾 Salvar amostra**
6. **☁️ Sincronizar** automaticamente

**Simples assim! Coleta de solo profissional! 🚀**

---

## 🆘 **Precisa de ajuda?**

**Erro comum? Tente:**
```bash
# Limpar e reinstalar
rm -rf node_modules
npm install
npm run android
```

**Ainda não funciona?**
- [📧 Abrir issue no GitHub](https://github.com/SauloRodrigues20/MapAgri/issues)
- [💬 Discussões](https://github.com/SauloRodrigues20/MapAgri/discussions)

---

## ✅ **Resumo Ultra-Rápido:**

```bash
# Baixar
curl -L https://raw.githubusercontent.com/SauloRodrigues20/MapAgri/main/install.sh | bash

# Rodar  
cd MapAgri/MapAgriApp
npm run android
```

**🌾 Feito! MapAgri rodando! 📱✨**