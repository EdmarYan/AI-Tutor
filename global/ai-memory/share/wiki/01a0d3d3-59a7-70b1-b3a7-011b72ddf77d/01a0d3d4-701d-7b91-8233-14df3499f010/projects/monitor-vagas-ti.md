---
tags:
- estudos
- monitor-vagas-ti
- local-first
- arquitetura
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-25T05:20:43Z
---
# Projeto Monitor de Vagas de TI — Sistema Local de Monitoramento

Sistema local-first para monitoramento automatizado de oportunidades de estágio e entrada em TI, sem banco de dados externo e com persistência em arquivos JSON estruturados.

## 1. Visão Geral
* **Propósito**: Reduzir a busca manual por vagas em diversas plataformas, consolidando dados localmente com deduplicação, regras temporais rígidas e relatórios por e-mail.
* **Paradigma**: Local-first, leve, determinístico, incremental e com persistência segura em arquivos JSON.
* **Localização**: `/home/edmar/projetos/Estudos/monitor-vagas-ti`
* **Especificação**: `README.md` no diretório do projeto.

## 2. Invariantes e Regras Não Negociáveis
1. Armazenamento puramente local via JSON (`vagas.json`, `configuracao.json`, `historico-execucoes.json`, `fontes.json`, `historico-alteracoes.json`).
2. Data real de publicação != Data de descoberta.
3. Janela de recência padrão de 7 dias. Prioridade máxima para vagas publicadas hoje.
4. Desacoplamento estrito entre coletores por fonte.
5. Separação entre status da vaga (`OPEN`, `CLOSED`, etc.) e status pessoal do usuário (`INTERESSANTE`, `FAVORITA`, `CANDIDATURA_REALIZADA`, etc.).
6. Agendador local com suporte a execução manual sob demanda.
