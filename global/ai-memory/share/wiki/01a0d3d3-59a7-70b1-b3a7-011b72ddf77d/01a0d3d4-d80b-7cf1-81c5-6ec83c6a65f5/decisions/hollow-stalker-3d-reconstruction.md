---
tags:
- hollow-stalker
- game-dev
- godot4
- horror-3d
- reconstruction
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T06:06:08Z
---
# Hollow Stalker - Reconstrução 3D Completa (Jogo de Terror Voxel)

## Visão Geral
O jogo anterior 2D (BlockRunner) foi totalmente removido com segurança, sem afetar outros projetos em `/home/edmar/projetos/Jogos`.
Foi construído do zero o jogo **Hollow Stalker**, um survival horror em primeira pessoa 100% 3D nativo em Godot 4.3 com estilo Voxel/Low-Poly.

## Especificações Técnicas e Arquitetura
- **Localização:** `/home/edmar/projetos/Jogos/HollowStalker/`
- **Engine:** Godot 4.3 (GL Compatibility)
- **Protagonista:** Primeira pessoa (`CharacterBody3D`), câmera com headbob, lanterna `SpotLight3D` com interferência/flicker, sprint com estamina, raycast de interação (`E`).
- **Entidade (The Hollow Stalker):** Modelo 3D voxel original, olhos incandescentes, máquina de estados (`IDLE`, `OBSERVING`, `STALKING`, `SEARCHING`, `CHASING`, `ATTACKING`, `VANISHING`).
- **Progressão Narrativa:**
  - Fase 1: Exploração da floresta e aparição distante da entidade.
  - Fase 2: Entrada no posto florestal e coleta da chave de ignição (porta bate, luzes falham).
  - Fase 3: Acionamento do gerador diesel (destrava o portão de evacuação).
  - Fase 4: Caçada final implacável pela floresta até a fuga ou morte.
- **Sons:** 100% sintetizados procedimentalmente em runtime via PCM mono 16-bit (passos, portas, gerador, grito assustador, batimento cardíaco, vento). Livre de copyright.
- **Testes:** Validado via execução headless de 60 e 120 frames sem erros de engine nem vazamento de scripts.