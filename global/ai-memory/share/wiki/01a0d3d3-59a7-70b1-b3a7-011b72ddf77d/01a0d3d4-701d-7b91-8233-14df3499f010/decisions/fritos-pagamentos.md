---
title: ADR-002 — Processamento Assíncrono de Pagamentos (Fritos)
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:38:18Z
---
---
title: ADR-002 — Processamento Assíncrono de Pagamentos (Fritos)
tier: semantic
tags: ["estudos", "fritos", "decisoes", "pagamentos"]
entities: ["PaymentGateway", "RabbitMQ", "OrderService"]
---
# ADR-002 — Processamento Assíncrono de Pagamentos

* **Data**: 20/09/2026
* **Status**: Aprovado
* **Contexto**: Picos de pedidos no almoço causavam timeout no checkout síncrono.
* **Decisão**: Desacoplar a confirmação do pedido do gateway financeiro via mensageria/filas assíncronas.
* **Consequências**: O pedido é salvo com status `AGUARDANDO_PAGAMENTO` e confirmado via webhook/evento.
* **Módulo Associado**: [[modules/fritos-pedidos.md]].
