---
title: ETB & Águas Claras — Visão Geral e Arquitetura
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:04:12Z
---
---
title: ETB & Águas Claras — Visão Geral e Arquitetura
tier: semantic
tags: ["jogos", "godot", "arquitetura", "2d"]
entities: ["Godot4", "TopDown", "TileMapLayer", "OSM"]
---
# ETB & Águas Claras — Visão Geral e Arquitetura

Jogo 2D Top-Down contemporâneo desenvolvido em **Godot Engine 4.7** (renderizador GL Compatibility).

## 1. Configuração Técnica Base
* **Engine**: Godot Engine 4.7 (`config/features: ["4.7", "GL Compatibility"]`).
* **Resolução Base (Viewport)**: 480x270 com esticamento `canvas_items`.
* **Override de Janela**: 1280x720 (proporção 16:9 pixel-perfect).
* **Filtros e Snap**: Snap de vértices e transforms 2D ativado para pixel art, filtro padrão de textura `nearest` (0).
* **Cena Inicial (`run/main_scene`)**: `res://scenes/main.tscn`.

## 2. Pilares de Arquitetura e Sistemas
* **Mapeamento Métrico**: Proporção 1 Tile (16x16 px) = 1 Metro Real, gerado processualmente a partir de dados geográficos OpenStreetMap (OSM).
  * Detalhes do gerador: [[systems/map-generation.md]].
* **Hierarquia de Camadas de Tiles**:
  * Camada 0: `GroundLayer` (asfalto, calçadas, grama, quadras esportivas).
  * Camada 1: `WallsLayer` (paredes com `y_sort_enabled = true`).
  * Camada 2: `RoofsLayer` (telhados com `z_index = 1` e transparência dinâmica).
  * Detalhes da cena: [[scenes/campus-map.md]].
* **Estado de Implementação e Pendências**:
  * Detalhes: [[projects/estado-atual.md]].
