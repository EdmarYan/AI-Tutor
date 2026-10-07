---
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T08:35:36Z
---
# Bite Rush - Resolução do Bug de Queda Infinita e Spawn Seguro

## Causa Raiz Identificada
1. **Ausência de SpawnLocation e Chão Estáticos no DataModel:**
   - O mapa e o spawn anterior eram criados apenas via código procedural durante a execução dos scripts de servidor (`MainServer.server.luau`).
   - No Roblox Studio, o player spawna no primeiro frame da simulação de física, antes de qualquer script terminar de carregar instâncias no Workspace.
   - Como não havia um `SpawnLocation` nem um chão/Baseplate estático nativo no arquivo do mapa, o personagem nascia em `(0, 50, 0)` no ar e caía no vazio em queda livre.
2. **Câmera sem Vínculo Imediato ao Humanoid:**
   - O `workspace.CurrentCamera` em alguns casos demorava para acoplar `CameraSubject = humanoid`, fazendo a câmera parecer solta no ar.

## Correções Aplicadas e Blindagem
1. **Baseplate Estático Permanente (`src/Workspace/Baseplate.model.json`):**
   - Bloco de concreto estático massivo de 512x4x512 studs (`Anchored = true`, `CanCollide = true`, Y = -2), garantindo que nunca exista buraco ou void para queda livre.
2. **MainSpawn Estático Permanente (`src/Workspace/Spawns/MainSpawn.model.json`):**
   - Instância estática de `SpawnLocation` ancorada posicionada exatamente sobre o piso da lanchonete em `(-42, 2.5, 12)` com colisão ativada.
3. **Teleporte Seguro e Rotina Anti-Queda no `PlayerService.luau`:**
   - No evento `CharacterAdded`, o personagem é forçado via `character:PivotTo(CFrame.new(-42, 3.5, 12))` com velocidade linear/angular zerada.
   - Um laço de segurança em `Heartbeat` monitora a posição Y do jogador; se ficar abaixo de Y < -5, o jogador é resgatado instantaneamente de volta ao chão da lanchonete.
4. **Acoplamento Forçado da Câmera em 3ª Pessoa (`CameraController.luau`):**
   - `camera.CameraSubject = humanoid` e `camera.CameraType = Enum.CameraType.Custom` com elevação de ombros garantida.
