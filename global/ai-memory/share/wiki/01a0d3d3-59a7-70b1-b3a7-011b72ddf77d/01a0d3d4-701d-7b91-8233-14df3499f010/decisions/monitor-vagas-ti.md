---
tags:
- decisoes
- arquitetura
- monitor-vagas-ti
- python
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-10-02T05:32:03Z
---
# Registro de Decisões Arquiteturais (ADRs) — Monitor de Vagas de TI

## DEC-001 — Escolha da Stack: Python 3
- **Data:** 02/10/2026
- **Status:** Aprovado
- **Contexto:** Necessidade de construir um sistema local-first completo envolvendo web scraping com HTTPS/TLS, parsing de HTML/JSON, interface local, agendamento e envio de e-mails via SMTP autenticado. A opção inicial de C/C++ foi descartada por exigir gerência manual extrema de ponteiros e sockets de baixo nível.
- **Decisão:** Utilizar Python 3 como linguagem do núcleo da aplicação.
- **Motivo:** Ecossistema maduro para HTTP, parsing DOM e manipulação de arquivos, permitindo focar na arquitetura de dados e nas regras de negócio da aplicação.
- **Trade-offs:** Menor controle de memória de baixo nível em comparação ao C, mas redução drástica da complexidade acidental e velocidade de desenvolvimento incomparavelmente superior.

## DEC-002 — Persistência Atômica em Arquivos JSON
- **Data:** 02/10/2026
- **Status:** Aprovado
- **Contexto:** O sistema armazena seu estado em arquivos JSON locais e precisa sobreviver a quedas de energia e desligamentos repentinos sem corromper dados existentes.
- **Decisão:** Padrão *Atomic File Replacement* — escrita completa em arquivo temporário (`.tmp`), sincronização com o disco (`fsync`) e substituição atômica via syscall `rename` (`os.replace`).
