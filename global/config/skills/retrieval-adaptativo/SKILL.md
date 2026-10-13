---
name: retrieval-adaptativo
description: Especificação operacional do Decision Engine para recuperação progressiva de Documentação Viva, código real e decisões no ai-memory. Use quando precisar consultar contexto, regras de negócio ou decisões arquiteturais no ai-memory.
---

# SKILL: RETRIEVAL ADAPTATIVO & DECISION ENGINE

Esta skill codifica o contrato operacional universal do **Decision Engine** nos projetos (`Estudos`, `Jogos`, `SaaS`). Ela governa como o assistente navega entre a **Documentação Viva** (no `ai-memory`), o **Código Real** (no disco) e a **Memória Histórica**, maximizando a informação útil por token e impedindo leituras desnecessárias de repositório.

---

## 1. GATE DE ENTRADA (QUANDO BUSCAR CONTEXTO)

Antes de invocar qualquer ferramenta de memória ou de leitura de arquivos, o Decision Engine avalia a pergunta:

### NÃO consultar memória ou código (`NO_RETRIEVAL_NEEDED`):
* Dúvida puramente teórica, sintática ou de programação geral (ex: "Como funciona switch expression em Java?", "Como declarar array em GDScript?").
* Contexto já completamente evidente no histórico imediato da sessão.
* Operações mecânicas simples sem dependência de regras de negócio ou de decisões anteriores (ex: trocar texto de botão, alterar valor de variável).

### CONSULTAR memória (`RETRIEVAL_REQUIRED`):
* Perguntas sobre regras, entidades, arquitetura ou decisões de projetos (ex: Fritos, Gestão de Documentos, Hollow Stalker).
* Perguntas sobre o progresso, histórico, dificuldades ou próximo passo de desenvolvimento ou estudo.
* Diagnóstico de bugs ou comportamentos em endpoints ou nós existentes com regras específicas.
* Retomada de sessão anterior (handoff).

---

## 2. ORÇAMENTO ADAPTATIVO E LIMITES ESTRITOS (ANTI-LOOP)

O Decision Engine opera com um orçamento adaptativo e tetos inegociáveis por interação:

| Parâmetro | Orçamento Inicial | Limite Máximo | Descrição |
| :--- | :--- | :--- | :--- |
| `initial_probe_limit` | **2 a 5 hits** | `5` | Sondagem inicial configurável no `memory_query`. |
| `max_expansions` | **0** | `1` | No máximo uma única rodada de expansão por turno. |
| `max_full_page_reads`| **0** | `2` | No máximo 2 leituras de páginas completas via `memory_read_page`. |
| `max_code_file_reads`| **0** | `1` | No máximo 1 inspeção cirúrgica de trecho de código (`view_file`). |

Atingido o teto sem confirmação: **STOP IMEDIATO** com `stop_reason: "BUDGET_EXCEEDED"`.

---

## 3. PROTOCOLO DE RETRIEVAL PROGRESSIVO (4 ESTÁGIOS)

```text
Estágio 0: Gate ──(SIM)──► Estágio 1: Sondagem Enxuta
                                     │
                             ¿Suficiente?
                              ├── SIM ──► STOP (SUFFICIENT_INITIAL)
                              └── NÃO ──► Estágio 2: Expansão de Documentação
                                                │
                                        ¿Suficiente?
                                         ├── SIM ──► STOP (SUFFICIENT_AFTER_EXPANSION)
                                         └── NÃO ──► Estágio 3: Incursão no Código
                                                           │
                                                      STOP (CODE_VALIDATED)
```

### Estágio 1: Sondagem Enxuta no `ai-memory`
* Ferramenta: `memory_query(query="...", project="<ProjetoAtual>", limit=<orçamento_inicial>)`
* O `ai-memory` aplica FTS5 + entidades + vetores + RRF com vizinhança de links.
* Retorna snippets de texto concisos (~24 palavras contextuais).

### Estágio 2: Avaliação Determinística e Expansão
O Decision Engine analisa os snippets pelos seguintes critérios determinísticos:
1. **Suficiência Imediata**: Se a regra, metadado de mastery ou decisão procurada já estiver explícita no snippet:
   * $\rightarrow$ **STOP**. Razão: `SUFFICIENT_INITIAL`.
2. **Falta de Profundidade**: O snippet confirma a existência da página relevante, mas a evidência específica está truncada:
   * $\rightarrow$ Ação: `memory_read_page(project="<ProjetoAtual>", path="...")`.
   * $\rightarrow$ **STOP**. Razão: `SUFFICIENT_AFTER_EXPANSION`.
3. **Falta de Relações**: O snippet aponta uma dependência em `[[wikilink]]` necessária para a decisão:
   * $\rightarrow$ Ação: Consulta direcionada da página referenciada no wikilink (`memory_read_page` ou `memory_query` com o slug exato).
   * $\rightarrow$ **STOP**. Razão: `SUFFICIENT_AFTER_EXPANSION`.

### Estágio 3: Incursão Cirúrgica no Código Real
A documentação viva é o mapa; o código é a verdade executável. O código é consultado **apenas quando**:
* A documentação indica a regra, mas a pergunta exige depurar a implementação exata de um método/algoritmo/nó.
* Há indício de divergência entre a documentação e o comportamento em tempo de execução.
* A documentação viva cita os **Arquivos-Chave** específicos a inspecionar.
* Ação: `view_file(AbsolutePath="/caminho/do/arquivo", StartLine=..., EndLine=...)`.
* $\rightarrow$ **STOP**. Razão: `CODE_VALIDATED`.

---

## 4. POLÍTICA DE SINCRONIZAÇÃO E ESCRITA SEGURA

A documentação viva é conhecimento durável e **nunca deve ser sobrescrita de forma caótica ou silenciosa**:

1. **Alterações Internas**: Mudanças de implementação dentro de métodos/funções **NÃO** disparam atualização de documentação.
2. **Alterações Estruturais**: Mudanças de contratos públicos, novas entidades, novos nós de cena essenciais, novos endpoints REST ou alteração de regras de negócio disparam o fluxo seguro:
   $$\text{Detecção Estrutural} \longrightarrow \text{Identificação de Páginas Afetadas} \longrightarrow \text{Preparação do Conteúdo} \longrightarrow \text{Gravação Controlada}$$
3. **Escrita via Ferramenta**: Utiliza `memory_write_page` explicitamente no escopo do projeto (`project="<ProjetoAtual>"`), preservando frontmatter e links `[[wikilinks]]`.
4. **Estado Transitório**: O que está quebrado hoje ou o próximo passo imediato deve ser gravado via `memory_handoff_begin`, **nunca** como regra arquitetural permanente.

---

## 5. OBSERVABILIDADE DO DECISION ENGINE

Toda interação que utilize retrieval deve registrar internamente a telemetria do processo:

```text
[RETRIEVAL LOG]
• Query: "<query>" (scope=<projeto>, budget=<limit>)
• Estágio Alcançado: SONDAGEM | EXPANSÃO_DOCS | CODIGO_REAL
• Páginas Consultadas: [<caminhos>]
• Código Consultado: SIM (<arquivo>:<linhas>) | NÃO
• Volume Estimado de Contexto: ~<n> palavras/chars
• Stop Reason: NO_RETRIEVAL_NEEDED | SUFFICIENT_INITIAL | SUFFICIENT_AFTER_EXPANSION | CODE_VALIDATED | BUDGET_EXCEEDED
```
