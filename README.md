# AI-Tutor & AI Memory Ecosystem

Este repositório contém as **Configurações, Rules, Skills e o Esquema do Tutor** utilizados no meu ambiente pessoal de inteligência artificial. 

> **Aviso de Créditos:** Toda essa estrutura e o conceito base de workflow com inteligências artificiais agenticas (uso de memória, regras, habilidades modulares, etc.) foi originalmente idealizado e inspirado no trabalho do **Fábio Akita**. O que você encontra neste repositório é uma **modificação/adaptação** minha desse conceito, ajustado para o meu uso pessoal e estudos.

---

## 1. O que tem neste repositório?

Se você está clonando isso agora, saiba que **este repositório NÃO contém o código fonte do sistema em Rust (`ai-memory`)**. Ele contém apenas a **inteligência estrutural** (os arquivos markdown de instrução) que o sistema consome. 

O repositório é dividido nas seguintes partes:

### 🧠 AI Memory (O Motor de Busca e Memória)
- Localizado em: `global/ai-memory/share/`
- **O que é?** O `ai-memory` é um utilitário robusto feito em **Rust**. Ele funciona como o "cérebro de longo prazo" da IA. Ele lê arquivos Markdown, converte os textos em vetores de significado (Embeddings locais via modelos HuggingFace) e salva num banco SQLite.
- **Por que está vazio aqui?** Por questões de privacidade, o banco de dados e as minhas anotações pessoais foram removidos. Aqui fica apenas o *esquema de pastas* (`db/`, `wiki/`, `logs/`, `models/`) para que, ao instalar, o sistema saiba onde criar os arquivos do zero.

### 📜 Rules (Regras)
- Localizadas em: `global/config/rules/` e dentro de `.agents/rules/` em projetos específicos.
- **O que são?** Diretrizes que dizem para a IA *como* ela deve se comportar em determinadas situações de forma passiva. Elas servem para moldar a "personalidade" ou as restrições da inteligência artificial.

### 🛠️ Skills (Habilidades)
- Localizadas em: `global/config/skills/` e dentro de `.agents/skills/` em projetos específicos.
- **O que são?** São "ferramentas" ensinadas para a IA. Uma Skill é um arquivo `.md` ensinando o agente a realizar uma tarefa passo a passo (ex: gerar flashcards do Anki, curar referências, etc.).

### 👨‍🏫 Esquema de Tutor (Tutor Schema)
- Localizado em: `projetos/Estudos/.agents/rules/mentor-programacao.md` (e outros projetos de estudos).
- **O que é?** É uma Rule altamente customizada que transforma a IA num **Mentor Rigoroso**. Em vez de apenas dar a resposta em código, o Tutor foi configurado para questionar, exigir boas práticas, fazer code reviews rígidos e aplicar o que chamamos de *Segurança Defensiva/AppSec* antes de aprovar uma solução.

### 🔄 Perfil Entre Projetos (Cross-project Profile)
- **Novidade (a partir do ai-memory >= 2.6.0):** O sistema agora conta com uma funcionalidade avançada onde a própria inteligência artificial age como "observadora dos seus hábitos". Se você tem padrões recorrentes (como preferir usar determinado framework de testes ou gerenciador de pacotes), o `ai-memory` identifica, salva essas preferências como um "Perfil Global" privado no seu banco SQLite e **injeta essas preferências como base padrão sempre que você abrir um projeto novo**.
- Isso poupa o retrabalho de ter que ditar suas preferências básicas para o agente o tempo todo, funcionando de forma complementar e não-conflitante com o rigor do **Tutor de Programação**.

---

## 2. Como usar este repositório? (Instalação)

Para facilitar a vida de quem quer usar este modelo, criei um script instalador.

### Pré-requisitos:
1. Você precisa ter o binário do **AI Memory (Rust)** instalado no seu PATH. Recomenda-se a versão mais atualizada (`>= 2.6.0`) para suporte ao Perfil Global. (Consulte o repositório oficial do Fábio Akita `akitaonrails/ai-memory` para obter o binário compilado).
2. Estar utilizando um ambiente Linux ou WSL.
3. Certifique-se de que o **serviço do ai-memory esteja rodando via systemd** (isso garante que ele inicie com o seu SO e fique disponível para o Antigravity).

### Instalação Passo a Passo:

Abra o seu terminal, clone o repositório e rode o script de instalação:

```bash
git clone git@github.com:EdmarYan/AI-Tutor.git
cd AI-Tutor
./install.sh
```

**O que o instalador faz?**
Ele vai copiar as `rules` e `skills` da pasta `global` para o seu diretório `~/.gemini/config/` e copiar as pastas vazias do AI Memory para `~/.local/share/ai-memory/`, preparando o terreno para o binário em Rust funcionar de imediato.

### Configurando seus Projetos
O script não instala os arquivos das pastas `projetos/` e `comercial/` automaticamente, pois eles são de uso por projeto.
Se você quer usar o **Tutor de Programação** no seu projeto pessoal, você deve copiar a pasta `.agents` para a raiz do seu projeto manualmente.

**Exemplo:**
```bash
# Copiando as regras e skills do Tutor para o seu projeto atual:
cp -r projetos/Estudos/.agents /caminho/para/seu/projeto/.agents
```
Sempre que a sua IA for invocada dentro daquele diretório, ela irá carregar o `mentor-programacao.md` e assumir a persona do Tutor!
