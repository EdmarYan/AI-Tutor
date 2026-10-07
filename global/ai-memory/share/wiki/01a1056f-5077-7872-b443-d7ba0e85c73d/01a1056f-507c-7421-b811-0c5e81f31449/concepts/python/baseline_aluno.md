---
pinned: true
tier: semantic
type: Concept
generated:
  by: process:ai-memory/2.4.0
  at: 2026-10-04T05:42:23Z
---
# Baseline Cognitivo do Aluno - Python 3 e Arquitetura

## Perfil e Carreira
- **Objetivo Profissional:** Ciência de Dados (Data Science).
- **Nível em Python:** Partindo do zero na sintaxe prática de Python 3 e Orientação a Objetos (POO).
- **Pontos Fortes Demonstrados:** Alta capacidade analítica de modelagem relacional (PostgreSQL), raciocínio arquitetural sobre isolamento de projetos/pastas e rigor ativo de segurança (AppSec / .env / .gitignore).

## Marcos Concluídos (Projeto Fritoz)
1. **Banco de Dados:** Schema relacional criado no PostgreSQL (com snapshot de preços e ficha técnica N:M).
2. **Ambiente:** Python 3.14 isolado no WSL via `venv` com `fastapi`, `uvicorn`, `sqlalchemy`, `psycopg2-binary` e `python-dotenv`.
3. **Segurança:** Configuração defensiva ativa com `.gitignore`, `.env` e `.env.example`.
4. **Camada de Dados:** `database.py` operacional e testado com sucesso conectando ao PostgreSQL via pool do SQLAlchemy.

## Diretriz Pedagógica para as Próximas Sessões
- Desafiar o aluno na criação dos Modelos OO (`models.py`), explicando o funcionamento de classes, atributos e herança da `Base` do SQLAlchemy.
- Testar ativamente a retenção dos conceitos já vistos (ex: por que usamos o .env, por que a conexão precisa do get_db) para acompanhar a evolução real.