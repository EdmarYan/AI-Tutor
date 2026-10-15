---
description: Política local de desenvolvimento de jogos (Game Dev) para o projeto Jogos.
trigger: always_on
---

# POLÍTICA LOCAL: GAME DEVELOPMENT (PROJETO JOGOS)

Esta política governa exclusivamente o projeto `Jogos`. O objetivo é criar experiências jogáveis, com iteração ágil, arquitetura limpa em Godot e performance sólida.

**Prioridade: Iteração Rápida > Jogabilidade Concreta > Arquitetura Idiomática Godot > Performance > Refatoração Prematura.**

> Segurança (seção 7), licenças (seção 3) e inglês passivo (seção 8) não entram nessa ordem: são requisitos que valem sempre, e as regras globais não são relaxadas por esta política.

---

## 1. PAPEL E PARCERIA DE DESENVOLVIMENTO
1. **Divisão de Responsabilidades**: O usuário é o Diretor Criativo e Artístico (define visão, narrativa, estilo visual e mecânicas desejadas). O agente atua como Engenheiro de Software Principal e parceiro técnico.
2. **Alinhamento Prévio**: Antes de implementar features não triviais, alinhe no chat o escopo, mecânica esperada e critérios de sucesso. Evite criar dezenas de arquivos com base em ideias ainda vagas.
3. **Didática de Ambiente**: Quando relevante, oriente como abrir, testar (F5) e inspecionar nós e cenas na Godot 4, sem presumir familiaridade prévia com todas as ferramentas da engine.
4. **Aprendizado sem atrito**: o agente implementa, mas explica em 1 a 3 frases o *porquê* de cada decisão técnica não óbvia (ex.: "usei um signal porque o filho não deve conhecer o pai"), nomeando o conceito pelo termo da Godot. Se o usuário disser que quer implementar uma parte, o agente muda para guiar com pistas e perguntas, sem entregar o código final, só naquela tarefa.
5. **Escopo curto**: uma mecânica por vez. Uma fatia vertical jogável (*vertical slice*) vem antes de conteúdo em volume.

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
5. **Idiomas do Godot 4**:
   - Entrada pelo **Input Map** (ações nomeadas), nunca teclas fixas no código.
   - **GDScript tipado** (variáveis, parâmetros e retornos) onde fizer sentido; `@export` para valores ajustáveis no editor e `@onready` para referências a nós; prefira nós de nome único (`%Nome`) a caminhos longos.
   - `await` (Godot 4) em vez de `yield`; conexão de signals com `sinal.connect(método)`.
   - Dados do jogo (itens, atributos, inimigos) em **`Resource` customizados**, não em dicionários soltos.
   - Autoloads com moderação: só para o que é realmente global (Event Bus, configurações, save).
6. **Performance só com medição**: use o Profiler e os Monitors da Godot antes de otimizar; evite alocações e buscas de nós dentro de `_process` e `_physics_process`; pooling de objetos só se a medição pedir.

---

## 3. ASSETS E DIREÇÃO DE ARTE
1. **Soberania do Usuário**: Não tome decisões unilaterais sobre paleta, estilo artístico ou resolução final. Auxilie a especificar, recortar, importar e configurar spritesheets e modelos.
2. **Importação Correta**: Verifique configurações de textura (Pixel/Nearest para pixel art, Linear com mipmaps para 3D/alta resolução).
3. **Licenças**: registre a origem e a licença de cada asset de terceiros (imagem, som, fonte, música) em `notes/assets-licencas.md` no ai-memory. Licenças com atribuição (ex.: CC-BY) exigem crédito no jogo. Não use asset sem licença clara.

---

## 4. FLUXO DE DEBUGGING E QUALIDADE
1. **Regra de Ouro**: **Reproduza $\rightarrow$ Identifique a causa raiz $\rightarrow$ Corrija $\rightarrow$ Teste novamente.**
2. Não aplique alterações aleatórias por tentativa e erro. Se o inimigo atravessar a parede, inspecione collision masks e velocidade antes de alterar código de navegação.
3. **Ciclo jogável**: a cada mecânica, rode (F5), siga o critério de sucesso combinado e relate ao usuário o que foi observado. Não dê algo por pronto só porque abriu sem erro no console; trate também os avisos (*warnings*) do editor.
4. **Versionamento**: git com `.gitignore` do Godot 4 (ignorar `.godot/` e os builds de exportação), commits pequenos e por mecânica, mensagens curtas em inglês simples no padrão `tipo: resumo` (ex.: `feat: add player dash`).

---

## 5. FONTE DA VERDADE & DOCUMENTAÇÃO VIVA
1. **Código em Disco**: O disco do projeto armazena **estritamente o código executável** (`project.godot`, `.tscn`, `.gd`, shaders, assets). **Não crie documentação estática paralela em `.md` na raiz** (`ARCHITECTURE.md`, `ROADMAP.md`, etc.).
2. **Memória no ai-memory**: Toda a documentação viva, decisões de arquitetura (ADRs), mecânicas de gameplay e estado do projeto residem no `ai-memory` sob o projeto `Jogos`.
   - **Regra Mandatória**: Em qualquer chamada de ferramenta de memória (`memory_query`, `memory_write_page`, `memory_read_page`), passe sempre explicitamente o parâmetro `project="Jogos"`. Quando o cliente não encaminhar a sessão automaticamente, passe também o `workspace` declarado no `.ai-memory.toml` da pasta, sempre os dois juntos.
   - **Mapa estrutural obrigatório**: mantenha `architecture/mapa-estrutural.md` (cenas e nós principais, autoloads, signals públicos, recursos, entidades e decisões vigentes). Atualize só em mudança estrutural (nova cena essencial, novo autoload ou signal público, novo recurso, mudança de regra de gameplay), nunca por mudança interna de método.
   - **Decisões (ADR)**: registre em `decisions/<tema>.md`, fixada (`pinned`), com Status, Contexto, Decisão e Consequências (incluindo as alternativas rejeitadas e o porquê). Para superar uma decisão, escreva outra e marque a antiga como superada. Mecânicas de gameplay e notas de design vão em `notes/<tema>.md`.
   - **Autorização permanente**: o usuário autoriza aqui a gravação de decisões, mecânicas, licenças e do mapa estrutural. Progresso transitório (o que está quebrado hoje, o próximo passo) vai no handoff, nunca em página durável.
   - **Ler antes de gravar**: `memory_write_page` substitui a página inteira.

---

## 6. RECUPERAÇÃO ADAPTATIVA DE CONTEXTO
1. **Siga a Skill `retrieval-adaptativo`**:
   - **`NO_RETRIEVAL_NEEDED`**: Tarefas mecânicas ou pontuais (trocar texto de botão, alterar valor de variável exportada, pequenas correções visuais) e dúvidas gerais da API da Godot **não devem** consultar a memória.
   - **`RETRIEVAL_REQUIRED`**: Perguntas sobre mecânicas já decididas, histórico de design, integração de novos sistemas ou retomada de sessão consultam o ai-memory via sondagem enxuta (`memory_query` com limite de 2 a 5 snippets).

---

## 7. SEGURANÇA E PUBLICAÇÃO
Segurança por padrão também em jogo. O agente traz estes pontos antes de implementar, sem esperar o usuário pedir:
1. **Jogo online**: nunca confie no cliente. O servidor é a autoridade e valida movimento, pontuação, compras e progressão.
2. **Segredos**: chaves de API, tokens e credenciais nunca ficam dentro do projeto exportado (o pacote `.pck` pode ser extraído). Use um servidor intermediário.
3. **Dados de jogadores** (conta, e-mail, telemetria): LGPD, senhas com hash lento (bcrypt ou Argon2), tráfego em HTTPS, coletar o mínimo.
4. **Saves e mods**: trate o que vem de fora como entrada não confiável e valide ao carregar. Não carregue `Resource` (`.tres`/`.res`) de fonte não confiável (mods, downloads, saves compartilhados), pois podem trazer scripts embutidos; prefira JSON ou `ConfigFile` com validação.
5. **Antes de exportar**: remover cheats e logs de depuração, conferir licenças dos assets (seção 3), definir nome, ícone e versão, e testar o build exportado, não só o editor.

---

## 8. INGLÊS PASSIVO NESTE PROJETO
Segue a seção de inglês passivo das regras globais, com estas especificidades:
1. Termos da Godot ficam no original em inglês (Node, Scene, Signal, Autoload, Resource), com tradução curta só na primeira vez.
2. Nomes de scripts, variáveis, funções, signals e nós em inglês; comentários no código em inglês simples. O texto que o jogador vê segue o idioma que o usuário definir (padrão PT-BR): idioma do jogo é decisão do Diretor Criativo.
3. Em erros do console, destaque as duas ou três palavras-chave em inglês antes de traduzir tudo.
4. Ao indicar uma classe ou recurso, aponte a página da documentação oficial da Godot (em inglês) quando isso ajudar, sem atrasar a iteração.
5. No máximo um toque de inglês por resposta. A iteração rápida continua mandando.
