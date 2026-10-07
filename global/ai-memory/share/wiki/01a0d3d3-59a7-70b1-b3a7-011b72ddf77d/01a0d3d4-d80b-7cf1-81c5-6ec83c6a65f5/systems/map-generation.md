---
title: Sistema de Geração de Mapa Métrico (OSM)
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T21:04:24Z
---
---
title: Sistema de Geração de Mapa Métrico (OSM)
tier: semantic
tags: ["jogos", "godot", "sistemas", "osm", "procedural"]
entities: ["MapGenerator", "TileMapLayer", "Geometry2D", "OpenStreetMap"]
---
# Sistema de Geração de Mapa Métrico (OSM)

Implementado no script `res://scripts/map_generator.gd` (Node2D).

## 1. Funcionamento
O sistema lê dados vetoriais convertidos do OpenStreetMap em `res://assets/maps/campus_geo_data.json` e monta o mundo métrico em tempo de execução (`_ready`), ignorando execução dentro do editor (`Engine.is_editor_hint()`).

* **Escala**: `TILE_SIZE = 16` (1 tile 16x16 px = 1 metro real).
* **Dimensões Padrão**: 700x700 tiles (metadados do JSON).

## 2. Etapas de Construção
1. **Terreno Base (`build_base_terrain`)**: Preenchimento do solo em blocos 2x2 com `TILE_GRASS` no `GroundLayer`.
2. **Vias e Calçadas (`build_highways` e `rasterize_road_segment`)**:
   - Vias secundárias/terciárias: raio da pista de 3 tiles + calçada de 2 tiles.
   - Vias residenciais: raio da pista de 2 tiles + calçada de 1 tile.
   - Faixa amarela central (`TILE_ROAD_YELLOW_H`) e asfalto (`TILE_ASPHALT`).
3. **Áreas de Lazer e Esporte (`build_leisures`)**:
   - Rasterização de polígonos usando `Geometry2D.is_point_in_polygon`.
   - Mapeamento de pista de atletismo (`TILE_TRACK`), quadras azuis (`TILE_COURT_BLUE`) e laranjas (`TILE_COURT_ORANGE`).
4. **Edificações e Interiores (`build_buildings`)**:
   - Telhados no `RoofsLayer` (`TILE_ROOF_SOLAR`, `TILE_ROOF_GYM`, `TILE_ROOF_TILE`).
   - Paredes perimetrais no `WallsLayer` (`TILE_WALL_FRONT`).
   - Colisões físicas: Criação dinâmica de `StaticBody2D` com nós filhos `CollisionPolygon2D` proporcionais ao polígono escalado por `TILE_SIZE`.
   - Transparência de Telhado: Criação de `Area2D` ("InteriorArea") conectada a sinais `body_entered` / `body_exited`. Se o corpo for do grupo `"Player"`, executa `create_tween()` alternando o `modulate:a` do `roofs_layer` entre `0.25` (transparente) e `1.0` (opaco).

## 3. Conexões
* Cena que hospeda o mapa: [[scenes/campus-map.md]].
* Visão geral da arquitetura: [[projects/overview.md]].
