---
title: Estado Atual de Implementação — ETB & Águas Claras
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:04:41Z
---
---
title: Estado Atual de Implementação — ETB & Águas Claras
tier: semantic
tags: ["jogos", "godot", "status", "roadmap"]
entities: ["ETBAguasClaras", "Godot4"]
---
# Estado Atual de Implementação — ETB & Águas Claras

Auditoria direta realizada em 24/09/2026.

## 1. O Que Realmente Existe (Implementado)
* **Geração de Mapa Métrico**: Script `scripts/map_generator.gd` completo (238 linhas) capaz de ler `campus_geo_data.json` e construir chão, ruas, calçadas, quadras, paredes com colisão e telhados com transparência tween.
* **Cena de Mapa**: `scenes/campus_map.tscn` configurada com `TileMapLayer` triplo, câmera suavizada e sprite de referência.
* **TileSet Métrico**: `assets/tilesets/campus_tileset.tres` configurado.
* **Configuração de Engine**: `project.godot` ajustado para viewport 480x270, GL Compatibility e snap de pixel art.

## 2. O Que Está Pendente / Ausente
* **Player**: Nó `CharacterBody2D` do jogador ainda NÃO foi criado na cena `scenes/main.tscn` nem em cena separada. Controles (WASD, Sprint com estamina, E para interagir) estão especificados no README mas ainda não codificados.
* **Inimigos / Chefes**: Nenhuma máquina de estados (FSM) ou cena de Boss implementada.
* **Interface / HUD**: Nenhuma barra de estamina, vida ou inventário criada.
* **Autoloads**: Nenhum Singleton (GameManager, AudioMaster, EventBus) registrado no `project.godot`.
* **Cena Principal (`res://scenes/main.tscn`)**: Encontra-se como um nó raiz `Node2D` vazio, necessitando instanciar a cena do mapa e do player.

## 3. Relações
* Visão Geral: [[projects/overview.md]].
* Sistema de Mapa: [[systems/map-generation.md]].
