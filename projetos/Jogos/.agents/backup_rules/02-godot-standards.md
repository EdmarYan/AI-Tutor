# Godot Standards

## Engine and language

O projeto utiliza Godot 4.x e GDScript como padrão, salvo decisão explícita do projeto.

Priorize recursos nativos da Godot antes de introduzir soluções externas.

Não adicione plugins ou dependências externas sem justificativa e aprovação quando exigida pelo workflow.

## Scenes

Use cenas reutilizáveis quando houver benefício real.

Exemplos de unidades comuns:
- Player.tscn
- Enemy.tscn
- NPC.tscn
- Door.tscn
- Chest.tscn
- Projectile.tscn

Evite cenas gigantes com responsabilidades não relacionadas.

## Scripts

Organize scripts por responsabilidade e mantenha nomes descritivos.

Exemplos:
- PlayerController
- PlayerCombat
- HealthComponent
- EnemyController
- EnemyAI
- InventorySystem

Não crie componentes artificiais apenas para seguir um padrão.

## Nodes and built-in systems

Quando adequado, prefira recursos da engine como:
- CharacterBody2D;
- Area2D;
- CollisionShape2D;
- AnimatedSprite2D;
- AnimationPlayer;
- TileMap/TileSet;
- Navigation;
- Resources;
- Signals.

Não replique manualmente uma funcionalidade que a Godot já oferece adequadamente.

## Input

Use Input Map e ações nomeadas.

Evite teclas hardcoded espalhadas pelo código.

## Signals and coupling

Use signals quando ajudarem a reduzir acoplamento e tornar a comunicação entre sistemas clara.

Evite referências diretas desnecessárias entre objetos.

## Assets: organização técnica

Mantenha assets organizados e com nomenclatura consistente.

Não sobrescreva assets originais sem necessidade.

Para direção artística, especificações visuais, estilo e geração de assets, consulte `04-assets-and-art.md`.

## Compatibilidade

Antes de usar uma API específica, verifique se ela é compatível com a versão Godot usada no projeto.
