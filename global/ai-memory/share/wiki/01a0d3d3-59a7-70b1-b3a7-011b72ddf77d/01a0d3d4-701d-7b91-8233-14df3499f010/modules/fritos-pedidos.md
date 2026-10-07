---
title: Módulo Pedidos — Fritos
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:38:10Z
---
---
title: Módulo Pedidos — Fritos
tier: semantic
tags: ["estudos", "fritos", "pedidos", "regras"]
entities: ["Order", "Customer", "Payment", "OrderService"]
---
# Módulo: Pedidos (Fritos)

## 1. Responsabilidade
Gerenciar o ciclo de vida completo de pedidos: criação, validação de itens, cálculo de taxa de entrega, transições de status e cancelamento.

## 2. Entidades Principais
* `Order`: Identificador, cliente, lista de itens, status, valor total, timestamp de criação.
* `Customer`: Dados cadastrais e endereço de entrega.
* `Payment`: Forma de pagamento, status da transação e comprovante.

## 3. Dependências
* `PaymentService`: Notificação de cobrança e autorização.
* `DeliveryService`: Cálculo de rota e atribuição de entregador.

## 4. Regras de Negócio Invioláveis
* **REG-PED-001 (Imutabilidade de Cancelamento)**: Um pedido com status `CANCELADO` não pode receber pagamento, não pode ter itens alterados e jamais pode ser reativado.
* **REG-PED-002 (Estorno Imediato)**: Se o cancelamento ocorrer após a confirmação do pagamento, um evento de estorno assíncrono deve ser disparado imediatamente para o `PaymentService`.
* **REG-PED-003 (Limite Temporal de Cancelamento)**: O cliente só pode cancelar o pedido se o status for `CRIADO` ou `AGUARDANDO_PREPARO`. A partir de `EM_ROTA`, o cancelamento exige intervenção do suporte.

## 5. Arquivos-Chave
* `src/main/java/com/fritos/pedidos/service/OrderService.java`
* `src/main/java/com/fritos/pedidos/controller/OrderController.java`
* `src/main/java/com/fritos/pedidos/model/Order.java`

## 6. Decisões Arquiteturais e Conceitos
* Decisão: [[decisions/fritos-pagamentos.md]]
* Conceito do Aluno: [[concepts/java/maquina-estados.md]]
