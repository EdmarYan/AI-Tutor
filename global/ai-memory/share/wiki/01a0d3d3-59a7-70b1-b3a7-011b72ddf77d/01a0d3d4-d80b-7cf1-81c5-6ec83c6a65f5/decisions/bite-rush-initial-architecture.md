---
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T07:57:06Z
---
# Bite Rush - Arquitetura Inicial e Conexão Rojo

## Visão do Projeto
Bite Rush é um jogo 3D multiplayer cooperativo (1-4 jogadores) de fast-food sandbox no Roblox, focado em minijogos de cozinha em tempo real, qualidade de comida (0-100), satisfação de clientes com preferências, progressão e automação.

## Estrutura do Projeto
- **Localização:** `/home/edmar/projetos/Jogos/BiteRush/`
- **Sincronização:** Rojo 7.7.0 standalone (`rojo serve` na porta 34872) + plugin local `C:\Users\edmar\AppData\Local\Roblox\Plugins\Rojo.rbxm`.
- **Mapeamento:** `default.project.json` mapeando:
  - `ReplicatedStorage/BiteRush`: Configurações data-driven (`GameConfig.luau`, `Ingredients.luau`, `Recipes.luau`), `Network/NetworkRemotes.luau` e fórmulas (`QualityFormula.luau`, `MathUtil.luau`).
  - `ServerScriptService/BiteRush`: Entrypoint `MainServer.server.luau` e serviços modulares (`PlayerService.luau`, `InteractionService.luau`).
  - `StarterPlayer/StarterPlayerScripts/BiteRush`: Entrypoint `MainClient.client.luau` e controladores (`PlayerController.luau`, `InteractionController.luau`).
  - `ServerStorage/BiteRush`: Pasta protegida `Assets`.
  - `StarterGui/BiteRush`: Componentes `HUD`.
  - `Workspace/BiteRush`: Pastas organizacionais semânticas (`Map`, `Stations`, `Vehicles`, `NPCs`, `Spawns`).

## Decisões Técnicas
- **Data-Driven Recipes & Ingredients:** Ingredientes e receitas são estruturados como tabelas tipadas em Luau (`--!strict`) em `ReplicatedStorage` para fácil balanceamento e expansão sem hardcoding.
- **Fórmula Ponderada de Qualidade:** Cada minijogo contribui com um score de 0 a 100 ponderado por etapa, evitando que um único erro destrua completamente o item.
- **Sprint e Interação Desacoplados:** Sprint do jogador é gerenciado via `NetworkRemotes` com detecção de `LeftShift`/`RightShift` e sincronização no `Humanoid.WalkSpeed`.
