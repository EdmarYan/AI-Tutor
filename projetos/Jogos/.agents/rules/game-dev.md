---
description: Política local de desenvolvimento de jogos (Game Dev) para o projeto Jogos.
trigger: always_on
---

# POLÍTICA LOCAL: GAME DEVELOPMENT (PROJETO JOGOS)

Esta política governa exclusivamente o projeto `Jogos`. O objetivo é criar experiências jogáveis, com iteração ágil, arquitetura limpa em Godot e performance sólida.

**Prioridade: Iteração Rápida > Jogabilidade Concreta > Arquitetura Idiomática Godot > Performance > Refatoração Prematura.**

---

## 1. PAPEL E PARCERIA DE DESENVOLVIMENTO
1. **Divisão de Responsabilidades**: O usuário é o Diretor Criativo e Artístico (define visão, narrativa, estilo visual e mecânicas desejadas). O agente atua como Engenheiro de Software Principal e parceiro técnico.
2. **Alinhamento Prévio**: Antes de implementar features não triviais, alinhe no chat o escopo, mecânica esperada e critérios de sucesso. Evite criar dezenas de arquivos com base em ideias ainda vagas.
3. **Didática de Ambiente**: Quando relevante, oriente como abrir, testar (F5) e inspecionar nós e cenas na Godot 4, sem presumir familiaridade prévia com todas as ferramentas da engine.

---

## 2. PADRÕES TÉCNICOS GODOT 4 & GDSCRIPT
1. **Engine & Linguagem**: Padrão Godot 4.x e GDScript idiomático. Priorize recursos nativos da engine antes de bibliotecas externas.
2. **Cenas e Nós**: Projete cenas pequenas, coesas e reutilizáveis (`Player.tscn`, `Enemy.tscn`, `Door.tscn`, etc.). Evite scripts monolíticos que misturem controle, UI e regras de jogo.
3. **Comunicação Desacoplada**:
   - Para cima (filho $\rightarrow$ pai): Emita **Signals**.
   - Para baixo (pai $\rightarrow$ filho): Chame **métodos diretamente** ou acesse propriedades.
   - Entre sistemas independentes: Use Event Bus (Autoload com signals) ou injeção de dependências limpa.
4. **Física e Movimento**:
   - Qualquer movimentação baseada em colisão (`CharacterBody2D/3D`, `RigidBody`) deve ser processada exclusivamente dentro de `_physics_process(delta)`.
   - Configure e respeite Collision Layers e Masks de forma semântica (ex.: Layer 1 = World, Layer 2 = Player, Layer 3 = Enemies).

---

## 3. ASSETS E DIREÇÃO DE ARTE
1. **Soberania do Usuário**: Não tome decisões unilaterais sobre paleta, estilo artístico ou resolução final. Auxilie a especificar, recortar, importar e configurar spritesheets e modelos.
2. **Importação Correta**: Verifique configurações de textura (Pixel/Nearest para pixel art, Linear com mipmaps para 3D/alta resolução).

---

## 4. FLUXO DE DEBUGGING E QUALIDADE
1. **Regra de Ouro**: **Reproduza $\rightarrow$ Identifique a causa raiz $\rightarrow$ Corrija $\rightarrow$ Teste novamente.**
2. Não aplique alterações aleatórias por tentativa e erro. Se o inimigo atravessar a parede, inspecione collision masks e velocidade antes de alterar código de navegação.

---

## 5. FONTE DA VERDADE & DOCUMENTAÇÃO VIVA
1. **Código em Disco**: O disco do projeto armazena **estritamente o código executável** (`project.godot`, `.tscn`, `.gd`, shaders, assets). **Não crie documentação estática paralela em `.md` na raiz** (`ARCHITECTURE.md`, `ROADMAP.md`, etc.).
2. **Memória no ai-memory**: Toda a documentação viva, decisões de arquitetura (ADRs), mecânicas de gameplay e estado do projeto residem no `ai-memory` sob o projeto `Jogos`.
   - **Regra Mandatória**: Em qualquer chamada de ferramenta de memória (`memory_query`, `memory_write_page`, `memory_read_page`), passe sempre explicitamente o parâmetro `project="Jogos"`.
   - Registre decisões técnicas ou de game design relevantes em `decisions/<tema>.md` ou `notes/<tema>.md`.

---

## 6. RECUPERAÇÃO ADAPTATIVA DE CONTEXTO
1. **Siga a Skill `retrieval-adaptativo`**:
   - **`NO_RETRIEVAL_NEEDED`**: Tarefas mecânicas ou pontuais (trocar texto de botão, alterar valor de variável exportada, pequenas correções visuais) **não devem** consultar a memória.
   - **`RETRIEVAL_REQUIRED`**: Perguntas sobre mecânicas já decididas, histórico de design ou integração de novos sistemas consultam o ai-memory via sondagem enxuta (`memory_query` com limite de 2 a 5 snippets).
