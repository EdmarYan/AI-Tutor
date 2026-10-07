---
tags:
- game-design
- godot
- hollow-stalker
- 3acts
- ai-navigation
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T07:04:14Z
---
# Hollow Stalker - Reformulação da Gameplay em 3 Atos, IA Orgânica e Portal de Evacuação

Registro de decisões de arquitetura e game design para o projeto Hollow Stalker:

## 1. Eliminação de Mecânicas Injustas
- **Porta da cabana & Chave:** Removido o fechamento abrupto da porta e o spawn da criatura logo na frente do jogador. Ao pegar a chave, o Stalker aparece em um ponto distante nos bosques orientais e inicia uma patrulha orgânica (`start_patrol`).
- **Gerador:** Removido o teleporte imediato do Stalker para trás do jogador. Ao ligar o gerador, ele emite um evento de áudio e investigação (`stalker.investigate_location`). O Stalker se desloca a pé pelo mapa para investigar o ruído mecânico.

## 2. Estrutura dos 3 Atos Narrativos
- **Ato 1 (Exploração & Descoberta):** O jogador acorda na floresta, descobre a cabana de guarda e coleta a chave de ignição.
- **Ato 2 (O Gerador & A Investigação Orgânica):** O jogador ativa o gerador. A energia acende o farol da Torre de Sinal no leste da floresta. O portal ao norte precisa de um estabilizador.
- **Ato 3 (A Torre de Sinal, Estabilizador & O Portal de Evacuação):** O jogador navega até a Torre de Sinal (`scenes/signal_tower.tscn`), obtém o Estabilizador de Emergência (`scripts/stabilizer_item.gd`), e ruma até a borda norte extrema do mapa onde se encontra o Portal de Evacuação (`scenes/portal.tscn`). Ao ativar o portal com o estabilizador, a criatura é alertada e inicia a caçada final. O jogador adentra o vórtice do portal e escapa.

## 3. Comportamento da IA do Stalker
- Implementados estados `PATROLLING` e `INVESTIGATING`.
- Rede de 10 waypoints espalhados pela floresta com detecção de travamento (stuck detection) e intervalos de observação e rotação.
- Se o Stalker perde o jogador de vista (LoS quebrado atrás de árvores/rochedos) e encerra a busca, ele não desaparece: volta a patrulhar os arredores.
- Na caçada final, persegue a partir da sua posição real.

## 4. Validação e Testes
- Adicionado `tests/test_fairness.tscn` validando todos os 8 critérios de justiça e design (A a H).
- Teste de fluxo completo `tests/test_flow.tscn` atualizado para validar a narrativa dos 3 atos de ponta a ponta.
- Build Web para YouTube Playables reexportada com sucesso em `build/web/playables/`.
