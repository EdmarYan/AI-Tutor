---
title: Cena CampusMap (scenes/campus_map.tscn)
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:04:35Z
---
---
title: Cena CampusMap (scenes/campus_map.tscn)
tier: semantic
tags: ["jogos", "godot", "cenas", "2d", "tilemap"]
entities: ["CampusMap", "TileMapLayer", "Camera2D", "Sprite2D"]
---
# Cena CampusMap (scenes/campus_map.tscn)

Cena 2D principal contendo a infraestrutura de renderização do campus.

## 1. Estrutura de Nós
```text
CampusMap (Node2D, unique_id=728546469)
├── MapVisual (Sprite2D, textura=campus_map_rendered.png, scale=8x8, pos=(1346, -2691))
├── GroundLayer (TileMapLayer, tileset=campus_tileset.tres)
├── WallsLayer (TileMapLayer, tileset=campus_tileset.tres, y_sort_enabled=true)
├── RoofsLayer (TileMapLayer, tileset=campus_tileset.tres, z_index=1)
└── Camera2D (pos=(5500, 5100), zoom=(1.2, 1.2), position_smoothing_enabled=true)
```

## 2. Dependências de Recursos
* **TileSet**: `res://assets/tilesets/campus_tileset.tres` (baseado em `campus_tileset.png`).
* **Visual de Referência**: `res://assets/maps/campus_map_rendered.png`.
* **Script Associado**: Deve ser acoplado ao gerador [[systems/map-generation.md]].
* **Relação com Arquitetura**: [[projects/overview.md]].
