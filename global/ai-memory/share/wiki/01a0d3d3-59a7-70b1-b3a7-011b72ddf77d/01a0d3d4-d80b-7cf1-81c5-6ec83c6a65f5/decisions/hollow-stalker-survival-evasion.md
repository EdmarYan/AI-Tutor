---
tags:
- game-design
- godot
- hollow-stalker
- youtube-playables
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T06:45:57Z
---
# Hollow Stalker - Evasão, Linha de Visão e Sobrevivência Flash

Decisões de Game Design e Arquitetura implementadas no projeto Hollow Stalker:

## 1. Balanceamento de Velocidade
- Jogador Correndo: 7.0 m/s
- Stalker Perseguindo: 5.2 m/s (rebalanceado de 6.2 m/s)
- Jogador Andando: 4.0 m/s
O Stalker corre mais rápido que a caminhada do jogador, mas mais devagar que o sprint, garantindo que o jogador consiga colocar distância tática para quebrar a linha de visão.

## 2. Linha de Visão (LoS) e Modo de Busca (Search)
- Verificação física de oclusão via raycast no espaço 3D (camada 1 de colisão de ambiente).
- Quando o jogador se esconde atrás de árvores, cabana ou rochas e perde linha de visão por mais de 1.2s, o Stalker transiciona de CHASING para SEARCHING.
- No modo SEARCHING, a entidade investiga a última posição conhecida (`last_known_pos`) por 5 segundos. Se o jogador continuar oculto, a entidade desiste da perseguição e o sinal `player_lost` é emitido com aviso em tela ("O Stalker perdeu você de vista!").

## 3. Lanterna e Mecânica de Flash Stun
- Lanterna padrão aumentada para alcance de 30m e cone de 45 graus.
- Ação `flashlight_flash` (Q / Botão Direito do Mouse / Botão Touch):
  - Consome recarga de 8 segundos.
  - Emite pulso concentrado com energia 9.0 e alcance de 45m.
  - Atordoa o Stalker por 2.5s se atingido frontalmente a menos de 16m e desobstruído por paredes.
  - Durante o estado STUNNED, o Stalker para de se mover e vibra em glitch, dando tempo ao jogador para fugir.

## 4. Interface e Tutorial
- Atualização completa das descrições de controle: WASD, SHIFT, ESPAÇO, F, Q/Dir., E, ESC.
- Botão touch renomeado de "Pulou" para "PULAR".
- Adição do botão "FLASH [Q]" aos controles touchscreen móveis.
- Modal "COMO JOGAR" no Menu Principal com guia de sobrevivência detalhado.
- Build Web para YouTube Playables reexportada e validada em `build/web/playables/`.
