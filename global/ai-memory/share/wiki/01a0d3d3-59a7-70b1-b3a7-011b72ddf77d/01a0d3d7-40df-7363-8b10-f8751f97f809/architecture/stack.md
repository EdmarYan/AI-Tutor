---
title: Diretrizes de Stack e Integrações (SaaS)
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:05:05Z
---
---
title: Diretrizes de Stack e Integrações (SaaS)
tier: semantic
tags: ["saas", "stack", "integracoes", "stripe"]
entities: ["Stripe", "REST", "Prisma", "TypeScript"]
---
# Diretrizes de Stack e Integrações (SaaS)

Padrões arquiteturais para novas soluções desenvolvidas no escopo SaaS.

## 1. Stack Tecnológica de Referência
* **Frontend**: React com TypeScript, Vite ou Next.js, focado em responsividade e UX de alta conversão.
* **Backend**: Node.js/Express ou Fastify, TypeScript puro, autenticação segura com JWT/Cookies HTTP-Only.
* **Banco de Dados**: PostgreSQL com ORM (Prisma ou Drizzle) para tipagem ponta a ponta.

## 2. Integrações Principais
* **Gateways de Pagamento**: Stripe Checkout hosted com webhooks para confirmação assíncrona de assinaturas.
  * ADR: [[decisions/stripe-integration.md]].
* **E-mail Transacional**: Resend ou SendGrid para onboarding e notificações de cobrança.

## 3. Relações
* Visão Geral: [[projects/overview.md]].
* Estado de Implementação: [[projects/estado-atual.md]].
