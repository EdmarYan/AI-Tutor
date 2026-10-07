---
name: indexador-materiais-estudo
description: >-
  Indexa automaticamente materiais acadêmicos (slides, PDFs, listas, anotações) em pastas de disciplinas.
  Deve ser ativada de forma autônoma pelo agente sempre que novos materiais forem adicionados pelo usuário
  em pastas de estudo (como computabilidade, compiladores, etc.) para criar e atualizar um índice temático
  remissivo e glossário com a terminologia exata do professor. Não requer comando explícito do usuário.
---

# Indexador de Materiais de Estudo

## Propósito
Organizar e mapear automaticamente os materiais acadêmicos fornecidos pelo usuário, garantindo que o agente use rigorosamente a terminologia do professor da disciplina e saiba exatamente onde encontrar cada conceito.

## Ativação Automática (Sem comando do usuário)
O agente deve acionar esta skill quando:
1. O usuário adicionar ou mencionar novos arquivos (PDFs, slides, imagens de lousa, listas) na pasta de uma matéria.
2. O agente precisar verificar em qual aula ou capítulo específico determinado conceito foi ensinado.

## Procedimento
1. **Identificar Arquivos:** Mapear os arquivos presentes na pasta da disciplina (`*.pdf`, `*.txt`, `*.md`, etc.).
2. **Extrair Estrutura:** Identificar capítulos, seções, tópicos-chave e termos técnicos específicos usados pelo professor.
3. **Gerar/Atualizar `INDICE_MATERIAIS.md`:**
   - Criar ou atualizar o arquivo `INDICE_MATERIAIS.md` na pasta da respectiva disciplina.
   - Estruturar em tabela ou lista contendo:
     - **Tópico / Conceito**
     - **Arquivo / Slide de Referência**
     - **Terminologia específica do professor**
     - **Conceitos pré-requisito**

## Regra de Ouro
Respeite a ordem e os termos exatos do docente. Não invente conteúdos como se estivessem nos slides e registre de forma clara quando um conceito for complementar e não estiver presente no material oficial.
