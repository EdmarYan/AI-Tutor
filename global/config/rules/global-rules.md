# REGRAS GLOBAIS DE DESENVOLVIMENTO & GOVERNANÇA

Este arquivo consolida todas as diretrizes operacionais globais que governam a atuação do agente em qualquer projeto ou workspace no Antigravity.

---

## 1. GOVERNANÇA E MODIFICAÇÃO DE ARQUIVOS MARKDOWN
Antes de criar, editar ou sobrescrever qualquer arquivo Markdown (`.md`) no sistema (sejam regras locais, regras globais, documentações técnicas ou notas), o agente DEVE obrigatoriamente:
1. Apresentar ao usuário a proposta exata do conteúdo ou o diff do que será alterado.
2. Informar o caminho completo do arquivo de destino.
3. Aguardar a confirmação explícita do usuário antes de realizar a operação de escrita ou edição.

---

## 2. HIGIENE DE SISTEMA E CLEAN UP (PREVENÇÃO DE ACÚMULO DE DISCO)
Ao conduzir tarefas de compilação, testes, automações ou geração de builds, o agente DEVE seguir diretrizes rígidas de limpeza para não acumular lixo no disco:
1. **Rust (Cargo):** Não manter builds acumuladas desnecessariamente. Ao finalizar experimentos ou testes de pacotes pesados, utilize ou sugira `cargo clean`.
2. **Java / Maven / Gradle:** Evitar commitar pastas `build/` ou `target/`. Manter `.gitignore` rigoroso e executar `mvn clean` / `./gradlew clean` ao concluir testes.
3. **Docker:** Evitar deixar imagens intermediárias soltas ("dangling images"). Sugerir limpezas periódicas de cache e containers parados (`docker system prune`).
4. **Git Worktrees e Branches Temporárias:** Se criar worktrees ou branches temporárias para tarefas isoladas, garanta que foram removidas ao concluir a tarefa (`git worktree remove`).
5. **Node.js:** Nunca clonar múltiplos `node_modules` redundantes em projetos de teste sem limpar pastas de scratch antigas.

---

## 3. WORKFLOW MEMORY-FIRST & RECUPERAÇÃO ENXUTA (AI-MEMORY)
O agente DEVE priorizar o uso do ecossistema `ai-memory` como fonte primária de verdade e mapa mental antes de inspecionar arquivos físicos no disco:
1. **Proibida Exploração Cega/Recursiva:** É terminantemente proibido rodar buscas recursivas em lote (`find`, `grep` massivo, abertura de múltiplos arquivos em sequência) para "descobrir" o que o projeto faz. O agente DEVE consultar primeiro a memória do projeto via `memory_query`.
2. **Leitura Cirúrgica de Código:** O código em disco é a verdade executável, mas só deve ser inspecionado após identificar no `ai-memory` exatamente qual arquivo e método contêm a implementação procurada (`view_file` direcionado com linhas específicas).
3. **Mapa Estrutural Obrigatório:** Todo projeto ativo deve manter no `ai-memory` um mapa estrutural da aplicação (stack, cenas/nós principais, entidades, contratos e decisões).
4. **Sincronização Pós-Alteração:** Ao criar novas mecânicas, endpoints, sinais (signals) ou alterar arquitetura, o agente DEVE sincronizar a documentação viva no `ai-memory` (via `memory_write_page`), garantindo que as próximas sessões sejam imediatas e responsivas sem reexploração de disco.
