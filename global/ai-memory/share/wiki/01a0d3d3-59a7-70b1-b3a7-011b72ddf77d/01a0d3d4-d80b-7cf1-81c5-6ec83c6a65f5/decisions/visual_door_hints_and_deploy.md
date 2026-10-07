---
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T07:12:32Z
---
# Hollow Stalker: Decisões de Game Design, Visual da Cabana, Dicas Dinâmicas e Deploy

## 1. Melhorias Visuais da Cabana (Porta)
- **Problema anterior:** A porta da cabana utilizava o mesmo material marrom escuro das paredes e chão (`StandardMaterial3D_wood`), sem maçaneta ou moldura, dificultando a identificação imediata como porta pelos jogadores.
- **Solução implementada:**
  - Material diferenciado em tom de cedro/mogno avermelhado (`Color(0.56, 0.28, 0.16, 1)`).
  - Adição de traves/dobradiças de reforço em ferro escuro (`StandardMaterial3D_door_iron`).
  - Maçaneta e fechadura 3D em latão dourado reflexivo (`StandardMaterial3D_brass`, `Color(0.85, 0.72, 0.2)`), destacando visualmente o ponto de interação.
- **Validação:** Teste unitário e de colisão `tests/test_cabin.tscn` executado e aprovado com 100%.

## 2. Sistema de Dicas Dinâmicas e Contextuais (Hints HUD)
- Adicionado container `HintContainer` e label `HintLabel` no HUD (`scenes/ui.tscn`), abaixo dos objetivos principais.
- Notificações não invasivas e dinâmicas conectadas a cada fase de progressão em `scripts/world.gd`:
  - **Início:** Direcionamento até a cabana de guarda e aviso de stamina/Flash [Q].
  - **Próximo à Cabana:** Instrução para abrir a porta de madeira e localizar a chave sobre a mesa.
  - **Chave Coletada:** Localização do gerador nos fundos da cabana e aviso para poupar fôlego.
  - **Gerador Ligado:** Aviso de que o Stalker investiga o barulho e orientação rumo à luz da Torre de Sinal.
  - **Estabilizador Coletado:** Guia até o Portal de Evacuação no Norte e recomendação de uso do Flash [Q] em emergências.
  - **Portal Ativado:** Aviso urgente de fuga, quebra de linha de visão pelas árvores e vórtice de saída.
  - **Game Over:** Dica de sobrevivência lembrando o jogador de usar as árvores para quebrar a linha de visão do monstro.

## 3. Preparação de Deploy
- **Git Repo Local:**
  - Inicializado em `/home/edmar/projetos/Jogos/HollowStalker` com branch `main`.
  - Configurado `.gitignore` específico para Godot 4.x (ignorando `.godot/`, binários pesados de build e arquivos temporários).
  - Commit inicial limpo realizado com sucesso (`134837c`).
- **YouTube Playables Web Package:**
  - Compilado via Godot 4.3 Web export (`Compatibility` renderer, single-threaded).
  - Pacote completo zipado em `/home/edmar/projetos/Jogos/HollowStalker/build/web/hollow_stalker_playables.zip` (~8.2MB), pronto para upload no console de desenvolvedor do YouTube Playables.
