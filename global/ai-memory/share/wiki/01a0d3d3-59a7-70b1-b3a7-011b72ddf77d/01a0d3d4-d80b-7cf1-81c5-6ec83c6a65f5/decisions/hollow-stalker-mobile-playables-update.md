---
tags:
- hollow-stalker
- bugfix-cabin
- mobile-touch
- youtube-playables
- webgl
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T06:29:37Z
---
# Hollow Stalker - Correção da Cabana, Mobile Touch e YouTube Playables

## Resumo das Entregas
1. **Bug da Cabana Corrigido:**
   - Causa raiz: `WallFrontLeft` e `WallFrontRight` compartilhavam colisão genérica de 6m sem escala, lacrando o vão de 1.4m da porta com paredes invisíveis.
   - Correção: Formas de colisão dedicadas de 2.3m alinhadas às laterais, porta convertida em `AnimatableBody3D`, piso nivelado ao solo.
   - Teste: Validado via `tests/test_cabin.tscn` (entrada, coleta da chave na mesa e saída suave sem obstrução).
2. **Controles Mobile Touchscreen:**
   - Joystick virtual no canto inferior esquerdo com suporte a gestos de arrasto e multi-touch.
   - Touchpad de câmera na metade direita da tela (swipe 360° com rotação de cabeça e corpo).
   - Botões na tela: Pulo, Corrida/Sprint, Interação (Ação [E]), Lanterna (Luz [F]) e Pausa.
   - Coexistência com controles físicos de PC (WASD, mouse, Shift, Space, E, F, Esc).
   - Teste: Validado via `tests/test_touch.tscn`.
3. **Integração YouTube Playables SDK & Build Web:**
   - Export Web sem threads (`variant/thread_support=false`) e renderizador Compatibility (WebGL 2.0).
   - Shell HTML customizado (`playables_template.html`) com `<script src="https://www.youtube.com/game_api/v1"></script>` e fallback offline stub.
   - Wrapper Godot (`scripts/yt_game_wrapper.gd`):
     - `firstFrameReady()` no primeiro frame de renderização.
     - `gameReady()` no menu principal interativo.
     - `onPause` e `onResume` pausando física, IA e silenciando o Master bus de áudio.
     - `isAudioEnabled()` e `onAudioEnabledChange()`.
     - `saveData()` e `loadData()` integrados à nuvem do YouTube.
   - Saída de build isolada em `/home/edmar/projetos/Jogos/HollowStalker/build/web/playables/` (PCK com apenas 114 KB).
   - Teste: Validado via `tests/test_flow.tscn` e servidor HTTP local.