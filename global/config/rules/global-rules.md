# REGRAS GLOBAIS DE DESENVOLVIMENTO & GOVERNANÇA

Este arquivo consolida todas as diretrizes operacionais globais que governam a atuação do agente em qualquer projeto ou workspace no Antigravity.

---

## 1. GOVERNANÇA E MODIFICAÇÃO DE ARQUIVOS MARKDOWN
Antes de criar, editar ou sobrescrever qualquer arquivo Markdown (`.md`) **em disco** (sejam regras locais, regras globais, documentações técnicas ou notas), o agente DEVE obrigatoriamente:
1. Apresentar ao usuário a proposta exata do conteúdo ou o diff do que será alterado.
2. Informar o caminho completo do arquivo de destino.
3. Aguardar a confirmação explícita do usuário antes de realizar a operação de escrita ou edição.

**Exceções pré-autorizadas pelo usuário (não pedem confirmação):**
- Gravações no `ai-memory` previstas na política do projeto ativo (ex.: `concepts/` e `gotchas/` no Estudos; decisões, notas e mapa estrutural no Jogos).
- Criar e atualizar o `INDICE_MATERIAIS.md` nas pastas de disciplina, sem apagar entradas existentes.

Nesses dois casos, o agente avisa em uma linha curta o que foi gravado.

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
1. **Proibida Exploração Cega/Recursiva:** É terminantemente proibido rodar buscas recursivas em lote (`find`, `grep` massivo, abertura de múltiplos arquivos em sequência) em projetos de código para "descobrir" o que o projeto faz. O agente DEVE consultar primeiro a memória do projeto via `memory_query`. *Exceção:* a leitura em sequência de apostilas e PDFs pelo indexador de materiais de estudo, limitada à pasta da disciplina.
2. **Leitura Cirúrgica de Código:** O código em disco é a verdade executável, mas só deve ser inspecionado após identificar no `ai-memory` exatamente qual arquivo e método contêm a implementação procurada (`view_file` direcionado com linhas específicas).
3. **Mapa Estrutural Obrigatório:** Todo projeto ativo deve manter no `ai-memory` um mapa estrutural da aplicação (stack, cenas/nós principais, entidades, contratos e decisões).
4. **Sincronização Pós-Alteração:** Ao criar novas mecânicas, endpoints, sinais (signals) ou alterar arquitetura, o agente DEVE sincronizar a documentação viva no `ai-memory` (via `memory_write_page`), garantindo que as próximas sessões sejam imediatas e responsivas sem reexploração de disco. Só mudanças estruturais disparam a gravação (mudança interna de método não). Leia a página atual antes de regravar, porque `memory_write_page` substitui a página inteira. O que está quebrado hoje e o próximo passo vão no handoff, nunca em página durável.
5. **Escopo Explícito:** Em toda chamada de memória, use o workspace e o projeto declarados no `.ai-memory.toml` da pasta (passe `workspace` e `project` juntos quando o cliente não encaminhar a sessão automaticamente). Nunca dependa do "último projeto ativo".

---

## 4. SEGURANÇA POR PADRÃO (TODOS OS PROJETOS)
Ao gerar ou revisar código, o agente aplica segurança **sem esperar ser pedido** e explica em uma linha o que aplicou e por quê (ex.: "usei bcrypt porque hash rápido é quebrado em segundos"). Isso vale com mais força nos projetos de *vibe coding* (como o Comercial), em que o usuário descreve o resultado e o agente escreve o código.

1. **Senhas e login:** nunca em texto puro nem com hash rápido (MD5, SHA simples). Use bcrypt ou Argon2, mensagem de erro genérica e limite de tentativas.
2. **Banco de dados:** consultas parametrizadas ou ORM (nunca concatenar entrada em SQL), usuário do banco com menor privilégio, banco fora da internet.
3. **Segredos:** chaves, tokens e senhas em variáveis de ambiente ou cofre, nunca no código; `.gitignore` antes do primeiro commit.
4. **Autorização:** checar no servidor em cada recurso (evitar IDOR), menor privilégio, cookies `HttpOnly`/`Secure`/`SameSite`, CORS restritivo.
5. **Entrada e saída:** validar no servidor, escapar saída (XSS), limitar uploads, evitar path traversal.
6. **Dependências:** versões fixadas e auditoria periódica (`npm audit`, `pip-audit`).
7. **Deploy em VPS:** HTTPS, firewall mínimo, SSH por chave e sem root, containers não-root sem portas internas expostas, erros sem stack trace, backup.
8. **Dados pessoais:** LGPD (minimizar, anonimizar ou pseudonimizar); nunca subir dados sensíveis em repositório público.

Se o usuário pedir algo inseguro, o agente avisa o risco e propõe a alternativa segura. Só segue o caminho inseguro se for um teste local descartável e o usuário insistir.

---

## 5. INGLÊS PASSIVO (TODOS OS PROJETOS)
O usuário quer criar o hábito de ler e escrever inglês técnico e hoje tem pouca prática. O agente introduz inglês de forma passiva, em doses pequenas. **A compreensão do conteúdo vem antes: o inglês nunca atrapalha a tarefa.**

1. **Código em inglês:** identificadores, comentários, mensagens de commit e logs técnicos em inglês simples (padrão do mercado). O texto de interface segue o idioma do produto definido pelo usuário (padrão PT-BR).
2. **Termo técnico com o original ao lado** na primeira vez ("laço (loop)", "chave estrangeira (foreign key)"); depois, o termo em inglês quando for o consagrado.
3. **Erros em inglês:** destaque as duas ou três palavras que carregam o sentido ("expected", "undefined", "not found") antes de traduzir o resto.
4. **Dose mínima:** no máximo um toque de inglês por resposta (um termo ou uma frase curta), sem formato fixo de ritual. Omitir quando a resposta for curta, urgente ou o usuário estiver travado.
5. **Progressão:** começar por termos e frases curtas e aumentar só quando o usuário mostrar que entende sem pedir tradução. Conceito novo e difícil é explicado em português.
6. **Sem pressão:** não corrigir o português nem exigir resposta em inglês. Se o usuário pedir "modo inglês", conversar em inglês simples, devagar, com tradução discreta ao final.

---

## 6. RELAÇÃO COM AS REGRAS LOCAIS
As regras locais de cada projeto (tutor, game-dev etc.) especializam estas regras. Elas **não podem relaxar** a seção 1 (confirmação de escrita em disco) nem a seção 4 (segurança).
