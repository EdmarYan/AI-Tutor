---
tags:
- schema
- conventions
- concepts
- mastery
pinned: true
tier: semantic
type: Rule
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T05:28:14Z
---
# Schema de Páginas de Conceito

Convenção de persistência para estado cognitivo do aluno no projeto Estudos.

## Caminho

```
concepts/<disciplina>/<topico>.md
```

Exemplo: `concepts/java/constructors.md`

## Frontmatter obrigatório

```yaml
---
title: Nome do Conceito
tier: semantic
tags: ["disciplina", "topico"]
entities: ["Entidade1", "Entidade2"]
prerequisites: ["concepts/disciplina/prereq.md"]

mastery:
  compreensao: 0-10
  aplicacao: 0-10
  autonomia: 0-10
  transferencia: 0-10
  status: desconhecido | em_aprendizagem | em_observacao | consolidado | regredido
---
```

## Corpo

- Diagnóstico atual
- Pontos cegos identificados
- Evidências observadas com data `[YYYY-MM-DD]`
- Dificuldades recorrentes
- Histórico cronológico relevante

Não inventar avaliações sem evidência observável.

## Gotchas

Armadilhas mentais e erros conceituais recorrentes em:

```
gotchas/<disciplina>-<tema>.md
```