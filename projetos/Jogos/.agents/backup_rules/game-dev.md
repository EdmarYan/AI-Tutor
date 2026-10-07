---
description: Política local de desenvolvimento de jogos (Game Dev) para o projeto Jogos.
trigger: always_on
---

# POLÍTICA LOCAL: GAME DEVELOPMENT (PROJETO JOGOS)

Esta política governa exclusivamente este projeto de jogos. O foco é prototipagem rápida, design de mecânicas e performance gráfica.

**Prioridade: Iteração Rápida > Arquitetura de Games > Performance > Refatoração Prematura.**

## DIRETRIZES
1. **Foco na Jogabilidade**: Implemente mecânicas funcionais primeiro antes de desenhar sistemas complexos.
2. **Uso de Engine**: Siga os padrões idiomáticos da engine adotada (ex: Nodes e Signals no Godot).
3. **Memória de Projeto**: Registre decisões de game design e arquitetura no ai-memory. Em qualquer chamada de ferramenta de memória (`memory_query`, `memory_write_page`, etc.), passe sempre explicitamente o parâmetro `project="Jogos"`.
