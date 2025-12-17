@echo off
REM 🌾 MapAgri - Script de Instalação para Windows v1.0

echo.
echo 🌾 MapAgri - Instalador para Windows
echo =================================

REM Verificar Node.js
echo.
echo 📦 Verificando Node.js...
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js não encontrado!
    echo 📥 Por favor, instale o Node.js: https://nodejs.org/
    echo    Recomendado: versão 18 LTS ou superior
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
    echo ✅ Node.js %NODE_VERSION% encontrado
)

REM Verificar Git
echo.
echo 📦 Verificando Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git não encontrado!
    echo 📥 Por favor, instale o Git: https://git-scm.com/download/win
    pause
    exit /b 1
) else (
    echo ✅ Git encontrado
)

REM Clonar repositório
echo.
echo 📥 Clonando MapAgri...
if exist "MapAgri" (
    echo ⚠️  Diretório MapAgri já existe. Atualizando...
    cd MapAgri
    git pull origin main
    cd ..
) else (
    git clone https://github.com/SauloRodrigues20/MapAgri.git
)
echo ✅ Repositório clonado/atualizado

REM Instalar dependências
echo.
echo 📦 Instalando dependências...
cd MapAgri\MapAgriApp

if not exist "package.json" (
    echo ❌ package.json não encontrado!
    pause
    exit /b 1
)

call npm install
if errorlevel 1 (
    echo ❌ Erro ao instalar dependências!
    pause
    exit /b 1
)
echo ✅ Dependências instaladas

REM Configurar ambiente
echo.
echo ⚙️  Configurando ambiente...
if not exist ".env" (
    echo 📝 Criando arquivo .env...
    (
        echo # Supabase Configuration
        echo SUPABASE_URL=https://your-project.supabase.co
        echo SUPABASE_ANON_KEY=your-anon-key
        echo.
        echo # App Configuration
        echo APP_NAME=MapAgri
        echo APP_VERSION=1.0.0
        echo DEBUG_MODE=true
        echo.
        echo # GPS Configuration
        echo GPS_ACCURACY_THRESHOLD=10
        echo SYNC_INTERVAL=30000
    ) > .env
    echo ⚠️  Configure suas credenciais do Supabase no arquivo .env
)

REM Verificar TypeScript
echo.
echo 🔍 Verificando TypeScript...
call npx tsc --noEmit --skipLibCheck
if errorlevel 1 (
    echo ⚠️  Avisos de TypeScript encontrados
) else (
    echo ✅ TypeScript: OK
)

REM Verificar Android SDK (opcional)
echo.
echo 📱 Verificando Android SDK...
adb version >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Android SDK não encontrado
    echo    Instale o Android Studio para desenvolvimento Android
) else (
    echo ✅ Android SDK encontrado
    for /f "skip=1" %%i in ('adb devices') do (
        echo 📱 Dispositivos Android conectados
        goto :android_done
    )
    echo 📱 Nenhum dispositivo Android conectado
    :android_done
)

REM Instruções finais
echo.
echo 🎉 MapAgri instalado com sucesso!
echo.
echo 📋 Próximos passos:
echo 1. Configure o arquivo .env com suas credenciais do Supabase
echo 2. npm run android (para Android)
echo 3. npm start (para iniciar o Metro bundler)
echo.
echo 📖 Documentação:
echo - README.md
echo - docs\SUPABASE_SETUP.md
echo - docs\API.md
echo.
echo 🧪 Testes disponíveis:
echo - npm test
echo - node scripts\test-supabase.js
echo - npx tsc --noEmit
echo.
echo 🌾 MapAgri pronto para uso!
echo Desenvolvido com ❤️  para a agricultura brasileira 🇧🇷
echo.
pause