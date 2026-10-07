# AI-Tutor & AI Memory Backup

Este repositório contém as configurações, regras (rules), habilidades (skills) e a estrutura base do **AI Memory** utilizados no meu ambiente de desenvolvimento. O objetivo é manter um backup versionado das diretrizes que orientam os agentes (como o tutor de programação) e a estrutura do banco de conhecimentos sem expor dados pessoais.

## Estrutura do Repositório

O repositório está organizado da seguinte forma:

- `global/config/rules/`: Regras globais aplicadas a todos os agentes.
- `global/config/skills/`: Skills globais disponíveis para os agentes.
- `global/ai-memory/`: Estrutura de dados do AI Memory (vazia de dados pessoais, mantendo apenas a organização de pastas como `db`, `logs`, `models` e `wiki`).
- `projetos/` e `comercial/`: Contêm as pastas `.agents/` de cada projeto com regras e skills específicas (ex: `mentor-programacao.md`, `curador-referencias`, etc).

## Como funciona o AI Memory (Arquitetura em Rust)

O **AI Memory** é um componente robusto construído em **Rust** que atua como um "cérebro" de longo prazo para os agentes. Sua arquitetura é baseada nos seguintes pilares:

1. **Armazenamento e Indexação (SQLite + Vector DB):**
   A memória utiliza o SQLite como mecanismo principal de persistência estruturada (armazenado na pasta `db/`). Para as buscas semânticas, ele gera embeddings (vetores de significado) de cada documento e anotação, permitindo que os agentes encontrem contexto relevante com base no significado, e não apenas em palavras-chave.

2. **Geração de Embeddings Local (HuggingFace):**
   O sistema baixa e gerencia modelos locais de embedding (como o `all-MiniLM-L6-v2`, armazenado na pasta `models/`). Ao processar arquivos markdown da pasta `wiki/`, o Rust utiliza esses modelos para transformar o texto em vetores localmente, garantindo privacidade (nenhum dado precisa ser enviado para APIs externas para indexação).

3. **Integração via MCP (Model Context Protocol):**
   O binário em Rust atua como um servidor MCP. Ele expõe ferramentas (tools) para os agentes, permitindo ações como `read_page`, `write_page`, `query`, e `search`. Quando um agente precisa lembrar de uma decisão de arquitetura passada, ele consulta o AI Memory via MCP, e o servidor Rust retorna os trechos mais relevantes do `wiki`.

4. **Wiki Baseado em Markdown:**
   A interface primária de conhecimento é a pasta `wiki/`. O AI Memory observa essas pastas (divididas por workspaces e sub-contextos) e mantém o banco de dados vetorial sincronizado. Todo o conhecimento é gravado em texto puro (Markdown), o que facilita a leitura humana e a edição manual quando necessário.

## Privacidade (Clean Backup)
Os diretórios do AI Memory (`db`, `logs`, `models`, `wiki`) foram limpos de quaisquer dados pessoais, arquivos de modelo pesados e logs sensíveis. Eles existem aqui apenas como *schema* (esqueleto) para garantir que a estrutura de pastas seja recriada corretamente ao clonar o repositório em um novo ambiente.
