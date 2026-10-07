---
tier: semantic
type: Concept
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T14:34:19Z
---
---
title: Spring @Transactional e Proxies AOP
tier: semantic
tags: ["spring", "transacoes", "aop"]
entities: ["Transactional", "AOP", "Proxies", "Rollback"]
prerequisites: ["concepts/spring/dependency-injection.md"]
mastery:
  compreensao: 2
  aplicacao: 8
  autonomia: 6
  transferencia: 1
  status: em_aprendizagem
---
# Spring @Transactional e Proxies AOP

## Diagnostico Atual
Aplicacao alta e compreensao baixa. O aluno anota @Transactional em todos os services por imitacao de padrao, mas desconhece que chamadas internas no mesmo bean contornam o proxy do Spring e nao abrem transacao.

## Acao Pedagogica Recomendada
Interrogar o modelo mental com perguntas socraticas sobre o ciclo de vida do proxy e tratamento de exceptions checked vs unchecked.
