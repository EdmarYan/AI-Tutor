# Project Documentation Rules

## Objetivo

A documentação existe para preservar contexto, decisões e estado do projeto para o usuário e para agentes futuros.

Não crie documentação por obrigação mecânica. Crie quando ela reduzir ambiguidade ou perda de contexto.

## Documentos principais

Quando o projeto justificar, utilize:

- `ARCHITECTURE.md` — estrutura técnica e responsabilidades dos principais sistemas.
- `ROADMAP.md` — objetivos, marcos e próximas etapas.
- `CURRENT_STATE.md` — estado atual real do projeto.
- `DECISIONS.md` — decisões arquiteturais ou de produto que tenham impacto futuro.
- `KNOWN_BUGS.md` — bugs conhecidos que ainda não foram resolvidos.

Esses arquivos não precisam existir todos no primeiro dia.

## Quando criar

Crie um documento quando:
- o projeto atingir complexidade que justifique registro;
- uma decisão tiver impacto além da tarefa atual;
- o estado do projeto ficar difícil de inferir pelo código;
- o roadmap passar a ser relevante para várias etapas;
- existir contexto que um agente futuro não deveria precisar reconstruir do zero.

Não invente arquivos apenas porque o nome aparece nesta regra.

## Formato

Mantenha Markdown simples e hierárquico.

Use `#` para o título e `##` para seções. Evite separadores horizontais desnecessários.

Prefira listas e tabelas curtas a textos longos quando isso melhorar a consulta.

## Templates

### ARCHITECTURE.md

# Architecture

## Overview
Descrição curta da arquitetura.

## Main Systems
Lista dos principais sistemas e suas responsabilidades.

## Data Flow
Como informações importantes circulam pelo jogo.

## Dependencies
Dependências internas relevantes.

## Constraints
Restrições arquiteturais importantes.

### ROADMAP.md

# Roadmap

## Current Goal
Objetivo atual.

## Milestones
Marcos principais em ordem.

## Next
Próximas tarefas relevantes.

## Future Ideas
Ideias fora do escopo atual.

### CURRENT_STATE.md

# Current State

## Working
O que está funcionando.

## In Progress
O que está sendo desenvolvido.

## Blocked
O que está bloqueado e por quê.

## Known Issues
Problemas relevantes conhecidos.

## Last Major Change
Última alteração estrutural importante.

### DECISIONS.md

# Decisions

## YYYY-MM-DD — Decision Title

### Context
Por que a decisão foi necessária.

### Decision
O que foi decidido.

### Alternatives
Alternativas relevantes consideradas.

### Consequences
Impactos e limitações.

### KNOWN_BUGS.md

# Known Bugs

## BUG-001 — Title

**Status:** Open

**Impact:** descrição curta.

**Reproduction:** passos para reproduzir.

**Suspected Cause:** causa conhecida ou hipótese explicitamente marcada como hipótese.

**Workaround:** solução temporária, se existir.

## Atualização

Quando uma alteração tornar a documentação obsoleta, atualize-a como parte da mesma etapa ou registre explicitamente a necessidade de atualização.

Nunca mantenha uma documentação deliberadamente falsa sobre o estado atual do projeto.
