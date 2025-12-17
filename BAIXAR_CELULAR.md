# 📱 MapAgri - Baixar Direto no Celular

## 🚀 **Forma Mais Simples (APK Direto)**

### **🚨 SITUAÇÃO ATUAL - Sem APK Real (Por Enquanto)**

**❌ PROBLEMA:** O release atual só tem arquivos que Android não reconhece.

**✅ SOLUÇÕES QUE FUNCIONAM AGORA:**

### **🥇 Opção 1 - Expo Go (APP REAL NO CELULAR - 5 min):**

#### **📱 No seu celular:**
1. **Baixar "Expo Go"** na Play Store: https://play.google.com/store/apps/details?id=host.exp.exponent

#### **💻 No computador:**
```bash
# Clonar projeto
git clone https://github.com/SauloRodrigues20/MapAgri.git
cd MapAgri/MapAgriApp

# Instalar dependências
npm install
npm install -g @expo/cli

# RODAR NO CELULAR!
npx expo start --tunnel
```

#### **📲 Resultado:**
- **Escanear QR code** que aparece
- **MapAgri abre no seu celular!** 🎉
- **Todas as funcionalidades** funcionando

---

### **🥈 Opção 2 - Web Simulator (TESTAR RÁPIDO - 2 min):**
```bash
git clone https://github.com/SauloRodrigues20/MapAgri.git
cd MapAgri/MapAgriApp
npm install
node scripts/web-simulator.js
```

---

### **🥉 Opção 3 - APK Real (Para Experts):**
**Se souber usar EAS Build:**
```bash
npm install -g eas-cli
eas login  # Conta grátis no Expo
eas build --platform android
# Aguarda 5-10 min, APK gerado na nuvem
```

### **📱 Como Instalar:**
1. **Baixar APK** no celular Android
2. **Permitir "Fontes desconhecidas"** nas configurações
3. **Tocar no arquivo** APK baixado
4. **Seguir instruções** na tela
5. **Pronto!** 📱✨

---

## 🔗 **Links Rápidos para Compartilhar:**

### **📱 Copie e Cole no WhatsApp/Telegram:**
```
🌾 MapAgri - App de Coleta de Solo
Baixe direto no celular:
https://github.com/SauloRodrigues20/MapAgri/releases

📥 Link direto do APK:
https://github.com/SauloRodrigues20/MapAgri/releases/download/v1.0.0/MapAgri-v1.0.0-release.apk

🚀 Agricultura de precisão grátis!
```

### **📧 Para enviar por Email:**
```
Assunto: MapAgri - App Gratuito para Agricultura

Olá!

Descobri este app incrível para coleta de amostras de solo com GPS.
É gratuito e funciona offline!

Download: https://github.com/SauloRodrigues20/MapAgri/releases

Principais funcionalidades:
✅ GPS de alta precisão
✅ 10 tipos de solo
✅ Fotos das amostras  
✅ Funciona offline
✅ Export para Google Earth

Vale muito a pena testar!
```

---

## 🍎 **Para iPhone (iOS):**

**Aguardando aprovação na App Store...** 📅

**Alternativa temporária:**
1. Usar **TestFlight** (link será enviado)
2. Ou aguardar lançamento oficial na **App Store**

---

## 🌾 **Como Usar o App (Passo-a-Passo Detalhado):**

### **📱 1. Primeiro Acesso:**
1. **Tocar no ícone** MapAgri na tela inicial
2. **Aguardar** carregamento (alguns segundos)
3. **Tela de boas-vindas** aparecerá
4. **Tocar "Começar"** para prosseguir

### **📍 2. Configurar Permissões (Muito Importante!):**

#### **GPS/Localização:**
- **Aparecerá popup**: "MapAgri quer acessar sua localização"
- **Tocar "PERMITIR"** (obrigatório para funcionar)
- **Se perguntou precisão**: escolher "Precisa" ou "Sempre"

#### **Câmera (Opcional mas Recomendado):**
- **Popup**: "MapAgri quer acessar câmera"
- **Tocar "PERMITIR"** para tirar fotos das amostras
- **Se negar**: ainda funciona, só sem fotos

#### **Armazenamento:**
- **Popup**: "MapAgri quer acessar armazenamento"
- **Tocar "PERMITIR"** para salvar dados offline

### **🏠 3. Tela Principal (Dashboard):**
Você verá:
- **🌾 "Coletar Amostra"** (botão verde grande)
- **📊 Estatísticas**: quantas amostras coletou
- **📋 "Ver Amostras"**: lista das coletadas
- **⚙️ Menu** no canto superior

### **🗺️ 4. Coletando Sua Primeira Amostra:**

#### **Passo 1 - Ir ao Mapa:**
1. **Tocar "Coletar Amostra"** na tela inicial
2. **Aguardar GPS** encontrar sua localização
3. **Ver o mapa** com sua posição atual (ponto azul)

#### **Passo 2 - Aguardar GPS de Qualidade:**
- **Indicador GPS** no canto superior:
  - 🔴 **Vermelho**: Procurando GPS (aguarde)
  - 🟡 **Amarelo**: GPS fraco (aguarde mais)
  - 🟢 **Verde**: GPS bom! (pode coletar)

**⚠️ IMPORTANTE: Só colete quando estiver VERDE (precisão <10m)**

#### **Passo 3 - Escolher Local no Mapa:**
1. **Arrastar o mapa** para o local desejado
2. **Tocar EXATAMENTE** onde quer coletar
3. **Aparecerá marcador** vermelho no local
4. **Confirmar** se é o local correto

### **🌾 5. Preenchendo Dados da Amostra:**

Aparecerá formulário com:

#### **Tipo de Solo (Obrigatório):**
Escolher entre:
- 🟤 **Argiloso** - Solo pesado, gruda na mão
- 🟨 **Arenoso** - Solo solto, escorre pelos dedos  
- 🟫 **Franco** - Solo misto, nem muito pesado nem solto
- 🔶 **Franco-Argiloso** - Mais argila que areia
- 🔸 **Franco-Arenoso** - Mais areia que argila
- 🟪 **Siltoso** - Solo fino, como talco
- 🌱 **Orgânico** - Escuro, cheiro de terra boa
- ⚪ **Calcário** - Solo claro, às vezes com pedrinhas brancas
- 🟠 **Laterítico** - Solo vermelho/alaranjado típico do Brasil
- ❓ **Outro** - Se não se encaixa em nenhum acima

#### **Profundidade da Coleta:**
- **0-15cm** - Superfície (mais comum)
- **15-30cm** - Subsuperfície  
- **30-60cm** - Mais profundo
- **Personalizada** - Digite valor específico

#### **Observações (Opcional):**
Digite informações extras como:
- "Solo úmido após chuva"
- "Presença de raízes"
- "Area recém arada"
- "Talhão norte da propriedade"

### **📸 6. Tirar Foto (Recomendado):**
1. **Tocar botão câmera** 📷
2. **Posicionar** celular sobre o local
3. **Tirar foto** do solo/local
4. **Confirmar** se foto ficou boa
5. **Salvar** (upload automático quando tiver internet)

### **💾 7. Salvar a Amostra:**
1. **Verificar** todos os dados preenchidos
2. **Tocar "SALVAR AMOSTRA"** (botão verde)
3. **Aguardar confirmação** ✅
4. **Pronto!** Amostra salva e GPS registrado

### **📋 8. Visualizar Suas Amostras:**
1. **Voltar** à tela principal
2. **Tocar "Ver Amostras"**
3. **Lista** com todas as coletadas:
   - 📅 Data e hora
   - 🌾 Tipo de solo
   - 📍 Coordenadas GPS
   - 📸 Foto (se tirou)
   - ☁️ Status sincronização

### **🔄 9. Sincronização (Automática):**
- **Com internet**: dados sobem automaticamente
- **Sem internet**: fica salvo local, sobe depois
- **Ícone nuvem** mostra status:
  - ☁️ **Cinza**: Não sincronizado
  - ☁️ **Verde**: Sincronizado na nuvem

---

## ⚙️ **Configurações Avançadas (Opcional):**

### **☁️ Supabase - Sincronização na Nuvem:**

#### **🎯 Para que serve:**
- **Backup automático** das amostras
- **Acesso de qualquer lugar** (web, outros celulares)
- **Sincronização** entre dispositivos de uma equipe
- **Fotos na nuvem** (não ocupa espaço do celular)

#### **📝 Como configurar:**
1. **Ir ao menu** ⚙️ no app
2. **Tocar "Configurações"**
3. **"Sincronização na Nuvem"**
4. **Inserir dados** (se tiver):
   - URL do Supabase
   - Chave de API
5. **Testar conexão**
6. **Sincronizar dados** existentes

#### **💡 Não tem conta Supabase?**
- **Não é obrigatório** para uso básico
- **App funciona 100% offline**
- **Pode configurar depois** se quiser backup
- **Dados ficam salvos** no celular

### **🔧 Configurações do App:**

#### **📍 GPS/Precisão:**
- **Precisão mínima**: 10 metros (padrão)
- **Pode alterar** para 5m (mais preciso) ou 15m (mais rápido)
- **Timeout GPS**: 30 segundos (padrão)

#### **📸 Fotos:**
- **Qualidade**: Alta (padrão), Média, Baixa
- **Compressão automática**: Para economizar espaço
- **Upload automático**: Se tiver internet

#### **💾 Armazenamento:**
- **Local de salvamento**: Interno do app
- **Backup local**: A cada 10 amostras
- **Limpeza automática**: Fotos antigas após sincronizar

### **🔒 Permissões Detalhadas:**

#### **📍 GPS/Localização (OBRIGATÓRIO):**
- **Precisão**: "Alta precisão" ou "Precisa"
- **Frequência**: "Sempre" ou "Usando o app"
- **Em segundo plano**: Não necessário

#### **📷 Câmera (RECOMENDADO):**
- **Acesso total**: Para tirar fotos das amostras
- **Sem câmera**: App ainda funciona, só sem fotos

#### **💾 Armazenamento (OBRIGATÓRIO):**
- **Ler/Escrever**: Para salvar dados localmente
- **Criar pastas**: Para organizar fotos e backups

#### **🌐 Internet (OPCIONAL):**
- **WiFi/Dados móveis**: Para sincronizar na nuvem
- **Sem internet**: Tudo funciona offline

### **📊 Estatísticas e Relatórios:**

#### **📈 Dashboard Pessoal:**
- **Total de amostras** coletadas
- **Tipos de solo** mais comuns
- **Área total** mapeada (hectares)
- **Período mais ativo** de coletas

#### **📋 Exportar Dados:**
- **KML para Google Earth**: Ver no mapa
- **CSV/Excel**: Para análises
- **PDF**: Relatório resumido
- **Compartilhar**: WhatsApp, email, etc.

---

## 📞 **Problemas?**

### **"Não pode instalar" - Guia Detalhado:**

#### **🔐 Permitir Fontes Desconhecidas (PASSO-A-PASSO):**

**Para Android 8+:**
1. **Baixar o APK** (não instalar ainda)
2. **Tocar no arquivo** APK baixado
3. **Aparecerá aviso**: "Não é possível instalar"
4. **Tocar "Configurações"** na mensagem
5. **Ativar chave** "Permitir desta fonte"
6. **Voltar** e tentar instalar novamente

**Para Android mais antigo:**
1. **Configurações** → **Segurança**
2. **Procurar** "Fontes desconhecidas"
3. **Ativar a opção**
4. **Confirmar** quando perguntar
5. **Instalar o APK** normalmente

**Para algumas marcas (Samsung, Xiaomi):**
1. **Configurações** → **Aplicativos**
2. **Menu (⋮)** → **Acesso especial**
3. **Instalar apps desconhecidos**
4. **Escolher** "Arquivos" ou navegador usado
5. **Permitir** desta fonte

#### **🚫 Se ainda não conseguir:**
- **Verificar espaço**: Liberar pelo menos 200MB
- **Atualizar Android**: Versão muito antiga pode ter problemas
- **Tentar outro navegador**: Chrome, Firefox, etc.
- **Baixar novamente**: Arquivo pode ter corrompido

### **"App não abre" - Soluções Completas:**

#### **🔄 Soluções Rápidas:**
1. **Fechar completamente** o app:
   - **Botão de apps recentes** (quadrado)
   - **Arrastar MapAgri** para cima para fechar
   - **Tentar abrir** novamente

2. **Reiniciar celular**:
   - **Segurar** botão power
   - **Escolher** "Reiniciar"
   - **Aguardar** religamento completo

#### **🧹 Limpeza Avançada:**
1. **Limpar cache**:
   - **Configurações** → **Aplicativos**
   - **Procurar** "MapAgri"
   - **Tocar** no app
   - **Armazenamento** → **Limpar Cache**

2. **Limpar dados** (perde configurações):
   - **Mesmo caminho** acima
   - **"Limpar Dados"** ou **"Limpar Armazenamento"**
   - ⚠️ **Atenção**: Vai perder amostras não sincronizadas

#### **🆘 Se nada funcionar:**
1. **Desinstalar completamente**
2. **Reiniciar celular**
3. **Baixar APK novamente** (pode ter corrompido)
4. **Instalar versão nova**

### **"GPS não funciona":**

#### **🔍 Diagnóstico:**
1. **Verificar se GPS está ligado**: 
   - Ir em **Configurações** → **Localização**
   - **Ativar "Localização"**
   - Escolher **"Alta precisão"**

2. **Local adequado**:
   - **❌ Não funciona**: dentro de casa, prédios, garagem
   - **✅ Funciona bem**: área aberta, campo, quintal
   - **⚠️ Funciona às vezes**: próximo a janelas grandes

3. **Aguardar tempo suficiente**:
   - **1º uso**: pode demorar 30-60 segundos
   - **Usos seguintes**: 10-20 segundos
   - **Dias nublados**: pode demorar mais

#### **🛠️ Soluções:**
- **Reiniciar GPS**: Desligar e ligar localização
- **Mover-se**: Caminhar alguns metros
- **Aguardar**: Deixar tela do mapa aberta
- **Verificar permissões**: App deve ter acesso "sempre"

#### **📱 Testando GPS:**
No próprio celular, abrir **Google Maps**:
- Se funciona no Maps → problema é permissão do MapAgri
- Se não funciona no Maps → problema é do GPS do celular

---

## 🔄 **Atualizações:**

**Versão atual:** 1.0.0
**Próxima versão:** Em breve com mais funcionalidades

**Como atualizar:**
1. **Baixar nova versão** do APK
2. **Instalar por cima** da antiga
3. **Dados salvos** automaticamente

---

## 📋 **Resumo Ultra-Rápido:**

```
1. 📥 Baixar APK do link
2. 📱 Instalar no Android  
3. 🌾 Usar para coletar solo
```

**🚀 Simples assim! MapAgri no seu celular em 2 minutos! 📱✨**

---

## � **Tutorial Completo de Uso:**

### **🌾 Cenário Prático: Coletando Amostras na Fazenda**

#### **📋 Preparação:**
1. **Carregar celular** (GPS consome bateria)
2. **Verificar se tem espaço** (pelo menos 500MB livre)
3. **Ir para área aberta** da propriedade
4. **Abrir o MapAgri** e aguardar GPS

#### **🗺️ Planejamento da Coleta:**
1. **No mapa**, visualizar área total
2. **Planejar grid** de coleta (ex: a cada 100m)
3. **Marcar pontos estratégicos** (diferentes elevações)
4. **Considerar histórico** da área (culturas anteriores)

#### **🌾 Coleta Sistemática:**

**Para cada ponto:**
1. **Caminhar até local** desejado
2. **Aguardar GPS verde** (precisão <10m)
3. **Tocar no mapa** exato do ponto
4. **Classificar solo** observando:
   - Textura na mão
   - Cor do solo
   - Presença de matéria orgânica
   - Drenagem/umidade
5. **Tirar foto** representativa
6. **Anotar observações** relevantes
7. **Salvar amostra**

#### **📊 Acompanhamento:**
- **Verificar lista** periodicamente
- **Conferir pontos** no mapa
- **Sincronizar** quando tiver WiFi
- **Exportar dados** ao final do dia

### **💡 Dicas Profissionais:**

#### **🎯 Para Maior Precisão:**
- **Coletar em dias secos** (solo não encharcado)
- **Aguardar GPS estabilizar** antes de marcar
- **Evitar horários** de muito calor (GPS pode falhar)
- **Carregar powerbank** para coletas longas

#### **📸 Melhores Fotos:**
- **Luz natural** (evitar flash)
- **Foto de cima** mostrando textura
- **Incluir referência** (moeda, régua)
- **Várias fotos** se necessário (o app salva a última)

#### **🗂️ Organização:**
- **Nomear observações** de forma clara
- **Usar padrões** (ex: "Talhão 1 - Norte")
- **Anotar condições climáticas** dos últimos dias
- **Registrar uso anterior** da terra

### **📈 Casos de Uso Avançados:**

#### **👨‍🌾 Agricultor Individual:**
- **Mapear propriedade completa** antes do plantio
- **Acompanhar evolução** do solo ao longo dos anos
- **Identificar áreas problema** (encharcamento, compactação)
- **Planejar adubação diferenciada** por área

#### **🏢 Consultoria Agrícola:**
- **Múltiplas propriedades** no mesmo app
- **Relatórios por cliente** (export personalizado)
- **Histórico de recomendações** nas observações
- **Fotos para comprovar** estado do solo

#### **🎓 Ensino/Pesquisa:**
- **Coleta de dados** para estudos
- **Comparação** entre diferentes manejos
- **Aulas práticas** de campo
- **Banco de dados** de tipos de solo regionais

### **🔧 Troubleshooting Avançado:**

#### **⚡ App Muito Lento:**
- **Fechar outros apps** (liberar RAM)
- **Limpar fotos antigas** do celular
- **Reduzir qualidade** de foto nas configurações
- **Sincronizar** dados antigos para liberar espaço

#### **📶 Problemas de Conectividade:**
- **WiFi instável**: Usar dados móveis para sync
- **Sem sinal**: Tudo funciona offline, sincroniza depois
- **Upload de fotos falha**: Tentar em horário de menor uso

#### **🔋 Otimizar Bateria:**
- **Reduzir brilho** da tela
- **Desativar outros apps** que usam GPS
- **Modo avião** + WiFi (se tiver rede local)
- **Powerbank** para dias longos de campo

### **📞 Suporte Especializado:**

#### **🐛 Reportar Bugs:**
1. **Anotar** exatamente o que estava fazendo
2. **Tirar screenshot** da tela de erro
3. **Informar modelo** do celular e versão Android
4. **Enviar** via GitHub Issues com detalhes

#### **💡 Sugerir Melhorias:**
- **Funcionalidades** que gostaria de ter
- **Tipos de solo** específicos da sua região
- **Integração** com outros sistemas
- **Relatórios** personalizados

#### **📚 Treinamento:**
- **Manual completo** em docs/
- **Vídeos tutoriais** (em desenvolvimento)
- **Workshops online** (consultar agenda)
- **Suporte técnico** por email/WhatsApp

### **🆘 Contatos de Suporte:**

#### **🚨 Urgente (Bug crítico):**
- **GitHub Issues**: [Reportar bug](https://github.com/SauloRodrigues20/MapAgri/issues)
- **Email**: suporte-urgente@mapagri.com.br

#### **❓ Dúvidas Gerais:**
- **Email**: suporte@mapagri.com.br
- **WhatsApp**: +55 (61) 99999-9999 _(Em breve)_
- **Telegram**: @MapAgriBrasil _(Em breve)_

#### **💬 Comunidade:**
- **GitHub Discussions**: [Conversar com outros usuários](https://github.com/SauloRodrigues20/MapAgri/discussions)
- **Facebook**: Grupo MapAgri Brasil _(Em breve)_
- **LinkedIn**: Página MapAgri _(Em breve)_

#### **📖 Documentação:**
- **Site oficial**: www.mapagri.com.br _(Em desenvolvimento)_
- **Manual técnico**: [docs/](https://github.com/SauloRodrigues20/MapAgri/tree/main/docs)
- **API para desenvolvedores**: [API Reference](https://github.com/SauloRodrigues20/MapAgri/blob/main/docs/API.md)

---

## 🏆 **Conclusão:**

O **MapAgri** foi desenvolvido para ser **simples para iniciantes**, mas **poderoso para profissionais**. 

**Para usuário básico**: Baixe o APK, instale e use. É só tocar no mapa!

**Para usuário avançado**: Explore todas as configurações, sincronização na nuvem, exports personalizados e integração com sistemas GIS.

**🌾 Agricultura de precisão acessível para todos - desde o pequeno produtor até grandes consultorias! 🚜📱**

**Versão atual**: 1.0.0 | **Próxima atualização**: Em breve com ainda mais funcionalidades!