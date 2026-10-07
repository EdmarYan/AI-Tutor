---
tags:
- blockrunner
- implementation
- godot4
- copyright-safe
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T05:54:41Z
---
# BlockRunner - Implementação Concluída

## Status
Jogo completo implementado e validado na Godot 4.3 em `/home/edmar/projetos/Jogos/BlockRunner/`.

## Arquivos Criados
- `project.godot`: Configurações de display (320x180 base pixel art, escala 1280x720), input mappings (jump, move_left, move_right, restart) e autoload `ScoreManager`.
- `scenes/main.tscn`: Cena principal com todos os nós integrados (Player, ShadowChaser, GameCamera, Spawners, HUD, Background).
- `scenes/player.tscn`: Cena do personagem jogável.
- `scenes/shadow.tscn`: Cena do perseguidor sombrio.
- `scripts/player.gd`: Mecânicas de corrida contínua, pulo simples, pulo duplo, aceleração horizontal e proteção por escudo.
- `scripts/shadow_chaser.gd`: IA de perseguição com aceleração progressiva, fumaça/aura e olhos rubros.
- `scripts/obstacle_spawner.gd`: Gerador dinâmico de espinhos e muros com dificuldade gradual.
- `scripts/ground_generator.gd`: Gerador procedural de terreno e abismos/buracos mortais.
- `scripts/powerup_spawner.gd`: Coletáveis (Escudo e Estrela de velocidade).
- `scripts/camera_controller.gd`: Câmera com lead frontal e screen shake.
- `scripts/hud.gd`: Interface com pontuação, recorde persistido, telas de início e game over.
- `scripts/score_manager.gd`: Autoload de cálculo e persistência de High Score.
- `scripts/background.gd`: Parallax procedimental com montanhas, estrelas e névoa.
- `README.md`: Documentação de gameplay, instruções da Godot e estratégia de direitos autorais para YouTube.

## Decisão de Design e Copyright
Para evitar problemas com a Mojang/Microsoft no YouTube e em plataformas de monetização, o protagonista "Bloco" e a entidade "Sombra" usam estética voxel original programada sem violar propriedade intelectual.