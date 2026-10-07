---
title: Máquina de Estados e Invariantes de Negócio
tier: semantic
type: Concept
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:45:31Z
---
---
title: Máquina de Estados e Invariantes de Negócio
tier: semantic
tags: ["java", "poo", "design-patterns", "state-machine"]
entities: ["StateMachine", "Enum", "Invariants"]
prerequisites: ["concepts/java/constructors.md", "concepts/java/encapsulamento.md"]
mastery:
  compreensao: 7
  aplicacao: 7
  autonomia: 6
  transferencia: 3
  status: em_observacao
---
# Máquina de Estados e Invariantes de Negócio

## 1. Modelo Cognitivo do Aluno
* **Compreensão (7/10)**: Evoluiu após a discussão socrática. Entendeu que entidades ricas devem ser as guardiãs dos próprios invariantes.
* **Aplicação (7/10)**: Implementou com sucesso método `cancelar()` que lança `IllegalStateException` quando o pedido já está cancelado.
* **Autonomia (6/10)**: Escreveu teste de unidade autônomo validando a recusa de pagamento para pedidos cancelados.
* **Transferência (3/10)**: Em observação para verificar se aplicará a mesma disciplina ao modelar o fluxo de protocolo de documentos.

## 2. Evidências Acumuladas
* `[2026-09-22]`: Aluno tentou alterar status de documento diretamente pelo controller sem passar pelo método de transição do service.
* `[2026-09-24]`: Questionou se um pedido cancelado poderia ter data de entrega alterada.
* `[2026-09-24]`: Implementou verificação de invariante de cancelamento com teste unitário validando a recusa de transição ilegal. Status alterado de `em_aprendizagem` para `em_observacao`.
