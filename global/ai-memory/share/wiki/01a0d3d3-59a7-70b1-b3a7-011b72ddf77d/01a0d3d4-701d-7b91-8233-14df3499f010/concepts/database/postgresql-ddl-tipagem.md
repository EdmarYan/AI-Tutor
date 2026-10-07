---
tier: semantic
type: Concept
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-25T18:05:42Z
---
---
title: Sintaxe DDL PostgreSQL e Tipos Numéricos
tier: semantic
tags: ["postgresql", "sql", "ddl", "tipos-de-dados"]
entities: ["SERIAL", "INTEGER", "NUMERIC", "DECIMAL", "FOREIGN KEY"]
mastery:
  compreensao: 5
  aplicacao: 3
  autonomia: 2
  transferencia: 2
  status: em_aprendizagem
---

# Sintaxe DDL PostgreSQL e Tipos Numéricos

## Gotchas Comuns
1. `int(255)`: sintaxe herdada do MySQL (onde indica display width). No PostgreSQL não existe `int(255)` — usa-se `INTEGER` ou `INT`.
2. Moeda/Valores Monetários: JAMAIS usar `FLOAT` ou `DOUBLE` para dinheiro por conta de imprecisão de ponto flutuante. Usar `NUMERIC(10, 2)` ou `DECIMAL(10, 2)`.
3. Chaves Estrangeiras na declaração de coluna: `venda_id INTEGER REFERENCES vendas(id)`.

## Registro de Evidências
- [2026-09-25] Aluno identificou os relacionamentos conceituais (`itens e venda`).
- [2026-09-25] Rascunho inicial do DDL: identificou os campos corretos (`quantidade`, `preco_unitario`, `custo_unitario`), mas omitiu as colunas de FK e usou sintaxe de tipos pendente de ajuste (`int(255)`).
