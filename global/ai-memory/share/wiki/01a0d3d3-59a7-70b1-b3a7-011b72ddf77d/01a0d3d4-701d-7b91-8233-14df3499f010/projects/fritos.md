---
title: Projeto Fritos — Sistema de Pedidos e Delivery
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:38:04Z
---
---
title: Projeto Fritos — Sistema de Pedidos e Delivery
tier: semantic
tags: ["estudos", "fritos", "pedidos", "arquitetura"]
entities: ["Fritos", "OrderService", "Spring"]
---
# Projeto Fritos — Sistema de Pedidos e Delivery

Aplicação de estudo para gestão de pedidos, pagamentos e fluxo de entrega da rede Fritos.

## 1. Visão Geral
* **Propósito**: Simulação de backend transacional para delivery de alta concorrência.
* **Stack**: Java 21, Spring Boot 3.x, Spring Data JPA, PostgreSQL.
* **Módulos Centrais**:
  * [[modules/fritos-pedidos.md]]: Fluxo de criação, cancelamento e transições de pedidos.
* **Decisões Fundacionais**:
  * [[decisions/fritos-pagamentos.md]]: Arquitetura de processamento de pagamentos.
* **Conceitos de Aprendizagem Vinculados**:
  * [[concepts/java/maquina-estados.md]]: Máquina de estados finita e validação de invariantes.
