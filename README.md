# AI-Tutor & AI Memory Ecosystem

Este repositório contém as **Configurações, Rules, Skills, Hooks e o Esquema do Tutor** utilizados no meu ambiente pessoal de inteligência artificial. 

> **Aviso de Créditos:** Toda essa estrutura e o conceito base de workflow com inteligências artificiais agenticas (uso de memória, regras, habilidades modulares, etc.) foi originalmente idealizado e inspirado no trabalho do **Fábio Akita**. O que você encontra neste repositório é uma **modificação/adaptação** minha desse conceito, ajustado para o meu uso pessoal e estudos.

---

## 1. O que tem neste repositório?

Se você está clonando isso agora, saiba que **este repositório NÃO contém o código fonte do sistema em Rust (`ai-memory`)**. Ele contém apenas a **inteligência estrutural** (os arquivos markdown de instrução, hooks e esquemas de configuração) que o sistema consome. 

O repositório é dividido nas seguintes partes:

### 🧠 AI Memory (O Motor de Busca e Memória)
- Localizado em: `global/ai-memory/share/`
- **O que é?** O `ai-memory` é um utilitário robusto feito em **Rust**. Ele funciona como o "cérebro de longo prazo" da IA. Ele lê arquivos Markdown, converte os textos em vetores de significado (Embeddings locais via modelos HuggingFace) e salva num banco SQLite.
- **Por que está vazio aqui?** Por questões de privacidade, o banco de dados e as minhas anotações pessoais foram removidos. Aqui fica apenas o *esquema de pastas* (`db/`, `wiki/`, `logs/`, `models/`) para que, ao instalar, o sistema saiba onde criar os arquivos do zero.

### 🌐 Visualizador Web & Backlinks (Novidade Linha 3.x)
- O `ai-memory` agora conta com interface web nativa embutida rodando em `http://127.0.0.1:49374/web`.
- Permite navegar por todas as páginas da Wiki com:
  - **Backlinks ("Cited by"):** lista quais outras notas e decisões citam a página atual.
  - **Outgoing Links ("Cites"):** lista os links e wikilinks que a página aponta.
  - **Outline Lateral:** navegação rápida por seções e títulos `h2`/`h3`.

### 🪝 Hooks de Ciclo de Vida & Economia de Tokens (Antigravity CLI / IDE)
- Localizado em: `global/config/hooks.json`
- **O que faz?** Conecta o Antigravity ao `ai-memory` nos eventos do ciclo de vida:
  - `PreInvocation`: Injeta handoffs pendentes e o perfil de hábitos do usuário na primeira interação (`SessionStart`).
  - `PreToolUse` e `PostToolUse`: Capturam e registram observações sanitizadas do que o agente executa.
  - `Stop`: Dispara o encerramento do turno no motor de memória.
- **Economia de Tokens:** Impede que o agente precise ler múltiplos arquivos de código em disco para "entender a estrutura do projeto". A estrutura deve residir nas páginas do `ai-memory`, sendo recuperada de forma enxuta via `memory_query`.

### 📍 Marcadores de Projeto (`.ai-memory.toml`)
- Localizados na raiz de cada projeto (`projetos/Estudos/`, `projetos/Jogos/`, `projetos/SaaS/`).
- **Por que são essenciais?** O Antigravity opera como um *Static MCP Client*. Sem um `.ai-memory.toml` declarando `workspace` e `project`, o motor de memória não sabe a qual projeto o diretório pertence e cai no escopo vazio (`scratch`). O arquivo `.ai-memory.toml` garante roteamento determinístico.

### 📜 Rules (Regras Consolidadas)
- Localizadas em: `global/config/rules/global-rules.md` e dentro de `.agents/rules/` em projetos específicos.
- **O que são?** Diretrizes que dizem para a IA *como* ela deve se comportar. O arquivo global unifica:
  1. **Governança de Markdown:** Aprovação prévia antes de criar/editar documentação.
  2. **Higiene e Clean Up:** Prevenção ativa de acúmulo de disco (Rust target, Maven build, Docker dangling).
  3. **Workflow Memory-First:** Proibição de varredura cega/recursiva de arquivos, forçando a consulta ao `ai-memory` antes de qualquer inspeção cirúrgica de código.

### 🛠️ Skills (Habilidades)
- Localizadas em: `global/config/skills/` e dentro de `.agents/skills/` em projetos específicos.
- **O que são?** Ferramentas e runbooks ensinados para a IA. Contém:
  - As skills oficiais gerenciadas do `ai-memory` (atualizadas para a versão `3.1.1`, com suporte a recuperação após compactação de contexto).
  - A skill `retrieval-adaptativo` (Decision Engine com tetos estritos de orçamento anti-loop).
  - Habilidades de estudo (flashcards Anki, curadoria de referências, etc.).

### 👨‍🏫 Esquema de Tutor (Tutor Schema)
- Localizado em: `projetos/Estudos/.agents/rules/mentor-programacao.md` (e outros projetos de estudos).
- **O que é?** É uma Rule altamente customizada que transforma a IA num **Mentor Rigoroso**. Em vez de apenas dar a resposta em código, o Tutor foi configurado para questionar, exigir boas práticas, fazer code reviews rígidos e aplicar o que chamamos de *Segurança Defensiva/AppSec* antes de aprovar uma solução.

### 🔄 Perfil Entre Projetos (Cross-project Profile)
- Funcionalidade onde a inteligência artificial observa padrões e preferências recorrentes do usuário, salvando-os em `profile/` e injetando-os automaticamente como base padrão em novos projetos.

---

## 2. Como usar este repositório? (Instalação)

Para facilitar a vida de quem quer usar este modelo, criei um script instalador.

### Pré-requisitos:
1. Você precisa ter o binário do **AI Memory (Rust)** instalado no seu PATH. Recomenda-se a versão mais atualizada (`>= 3.1.1`). (Consulte o repositório oficial do Fábio Akita `akitaonrails/ai-memory` para obter o binário compilado).
2. Estar utilizando um ambiente Linux ou WSL.
3. Certifique-se de que o **serviço do ai-memory esteja rodando via systemd com `--enable-web` ativo** (isso garante que ele inicie com o seu SO e exponha o MCP e a interface Web).

### Instalação Passo a Passo:

Abra o seu terminal, clone o repositório e rode o script de instalação:

```bash
git clone git@github.com:EdmarYan/AI-Tutor.git
cd AI-Tutor
./install.sh
```

**O que o instalador faz?**
1. Copia as `rules` e `skills` globais (incluindo as skills oficiais do ai-memory) para `~/.gemini/config/`.
2. Instala e configura os hooks do Antigravity em `~/.gemini/config/hooks.json`.
3. Prepara a estrutura do AI Memory em `~/.local/share/ai-memory/`.
4. Se o comando `ai-memory` estiver no PATH, executa a amarração de hooks e skills oficiais automaticamente.

### Configurando seus Projetos
Ao configurar um projeto pessoal (como `Estudos`, `Jogos` ou `SaaS`), **copie tanto a pasta `.agents` quanto o marcador `.ai-memory.toml` para a raiz do seu projeto**:

**Exemplo:**
```bash
# Copiando as regras, skills do Tutor E o marcador de memória para o seu projeto:
cp -r projetos/Estudos/.agents /caminho/para/seu/projeto/.agents
cp projetos/Estudos/.ai-memory.toml /caminho/para/seu/projeto/.ai-memory.toml
```
