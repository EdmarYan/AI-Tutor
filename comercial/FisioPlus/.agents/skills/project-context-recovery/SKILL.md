---
name: project-context-recovery
description: Recupera contexto técnico e arquitetural do projeto através da documentação existente em docs/ e do código real sempre que o contexto da conversa for insuficiente, houver mudança de módulo, conversas longas ou retomada de tarefas.
---

# PROJECT CONTEXT RECOVERY — MEMÓRIA TÉCNICA DO PROJETO

## PROPÓSITO DA SKILL

Esta Skill atua como a **memória técnica externa de longo prazo** da plataforma **Fisio+**.

Ela deve ser acionada sempre que for necessário entender ou manter o sistema, impedindo que o assistente dependa exclusivamente de:
- Histórico volátil da conversa;
- Suposições ou palpites (*"acredito que fica em..."*);
- Conhecimento genérico descontextualizado de frameworks;
- Respostas dadas em turnos anteriores que possam ter sofrido compactação.

A documentação mantida em `docs/` constitui a **base de conhecimento arquitetural** do projeto, enquanto o código-fonte em `frontend/src/` e `backend/src/` constitui a **fonte definitiva da verdade**.

---

## 1. HIERARQUIA DE VERDADE

Ao analisar qualquer aspecto do sistema, respeite rigorosamente esta precedência:

```text
CÓDIGO ATUAL (frontend/src, backend/src)
      ↓
CONFIGURAÇÃO REAL (.env, package.json, vite.config.ts)
      ↓
BANCO / SCHEMA (backend/prisma/schema.prisma)
      ↓
TESTES AUTOMATIZADOS (backend/tests/**/*.test.ts)
      ↓
DOCUMENTAÇÃO TÉCNICA (docs/)
      ↓
HISTÓRICO DA CONVERSA
      ↓
CONHECIMENTO GENÉRICO
```

### Regra de Divergência:
Se a documentação indicar uma abordagem (ex: *Service X*) e o código atual utilizar outra (ex: *Service Y*):
1. **Não escolha arbitrariamente** nem ignore o código.
2. **Aponte a divergência explicitamente**: *"A documentação em docs/... indica X, mas o código atual em ... utiliza Y. Assumindo o código como fonte da verdade."*
3. Execute a tarefa baseando-se no código real.
4. Quando apropriado, proponha a atualização do documento em `docs/`.

---

## 2. QUANDO ESTA SKILL DEVE SER UTILIZADA

A ativação desta Skill é mandatória nas seguintes situações:

1. **Contexto Insuficiente ou Dúvida de Implementação**:
   - Ao não ter certeza de qual tabela, rota, API, service, hook ou componente governa a funcionalidade solicitada.
2. **Mudança de Módulo**:
   - Transição entre áreas do sistema (ex: de *Financeiro* para *Pacientes* ou *Agenda*). Não assuma premissas de um módulo no outro.
3. **Conversas Longas e Compactadas**:
   - Quando o contexto foi resumido ou compactado, utilize a documentação para recuperar o estado real antes de sugerir ou executar mudanças.
4. **Retomada de Tarefas**:
   - Pedidos como *"Vamos continuar aquela alteração"*, *"Continue"* ou *"O que falta fazer?"*.
5. **Antes de Qualquer Manutenção, Refatoração ou Correção de Bug**:
   - Consultar o fluxo documentado e o mapa de dependências antes de alterar arquivos.

---

## 3. PROCESSO OBRIGATÓRIO DE RECUPERAÇÃO EM CAMADAS

Siga esta sequência progressiva para recuperar contexto sem ler arquivos desnecessários:

```text
SOLICITAÇÃO DO USUÁRIO
         │
         ▼
[ 1. IDENTIFICAR O MÓDULO & DOMÍNIO ]
         │
         ▼
[ 2. CONSULTAR O MAPA / ÍNDICE ] ─── docs/README.md ou docs/08_GUIA_DE_MANUTENCAO.md
         │
         ▼
[ 3. CONSULTAR A DOCUMENTAÇÃO ESPECÍFICA ]
         │
         ├── Camada 1: Arquitetura & Stack ── docs/00_ARQUITETURA_GERAL.md, docs/02_STACK_TECNOLOGICA.md
         ├── Camada 2: Módulo de Negócio ──── docs/modulos/<modulo>.md
         ├── Camada 3: Telas & UI ─────────── docs/frontend/00_ROTAS_FRONTEND.md, 01_COMPONENTES.md, 02_ESTADO_E_HOOKS.md
         ├── Camada 4: APIs & Endpoints ───── docs/backend/00_MAPA_DE_APIS.md, 03_SERVICES.md, 04_TIPOS_E_MODELOS.md
         ├── Camada 5: Banco de Dados ─────── docs/backend/01_BANCO_DE_DADOS.md, schema.prisma
         ├── Camada 6: Permissões & RBAC ──── docs/backend/02_AUTENTICACAO_E_PERMISSOES.md
         └── Camada 7: Impacto & Riscos ───── docs/09_MAPA_DE_DEPENDENCIAS.md
         │
         ▼
[ 4. INSPECIONAR O CÓDIGO REAL ] ─── Abrir e ler os arquivos identificados
         │
         ▼
[ 5. EXECUTAR A ALTERAÇÃO COM SEGURANÇA ]
```

---

## 4. MAPA DE ATALHOS: "QUERO ENTENDER / ALTERAR X"

Utilize esta tabela de despacho rápido para carregar o contexto exato:

| O que preciso entender/alterar? | Documento Primário em `docs/` | Arquivo Real no Código |
| :--- | :--- | :--- |
| **Prontuário, Anamnese, Sessão ao Vivo** | `docs/modulos/prontuario_clinico.md` | `frontend/src/features/clinical-record/*` e `backend/src/modules/clinical-records/*` |
| **Cronogramas e Modelos de Tratamento** | `docs/modulos/prontuario_clinico.md` | `TreatmentScheduleTab.tsx` e `clinical-record.service.ts` |
| **Boletos FEBRABAN, Pix, Cobranças** | `docs/modulos/financeiro.md` | `frontend/src/features/financial/*` e `backend/src/modules/financial/*` |
| **Agenda, Conflitos de Grade, Kanban** | `docs/modulos/agenda.md` | `frontend/src/features/agenda/*` e `backend/src/modules/agenda/*` |
| **WhatsApp, Disparo, Automações** | `docs/modulos/comunicacao_whatsapp.md` | `frontend/src/features/communication/*` e `backend/src/modules/communication/*` |
| **Pacientes, Validação de CPF** | `docs/modulos/pacientes.md` | `frontend/src/features/patients/*` e `backend/src/modules/patients/*` |
| **Nova Rota ou Endpoint REST** | `docs/backend/00_MAPA_DE_APIS.md` | `backend/src/modules/*/*.routes.ts` |
| **Tabelas, Chaves Estrangeiras, Índices** | `docs/backend/01_BANCO_DE_DADOS.md` | `backend/prisma/schema.prisma` |
| **Permissões de Usuário, RBAC, Login** | `docs/backend/02_AUTENTICACAO_E_PERMISSOES.md` | `backend/src/shared/middleware/auth.middleware.ts` e `seed.ts` |
| **Estado Global, TanStack Query, Temas** | `docs/frontend/02_ESTADO_E_HOOKS.md` | `AuthContext.tsx`, `useClinicTheme.ts`, `api.ts` |
| **Variáveis de Ambiente e Portas** | `docs/05_VARIAVEIS_DE_AMBIENTE.md` | `backend/.env` |
| **Como Iniciar ou Rodar Testes** | `docs/06_CONFIGURACAO_LOCAL.md` | `package.json` |
| **Build, Docker e Deploy** | `docs/07_BUILD_DEPLOY.md` | `backend/Dockerfile`, `docker-compose.yml` |
| **Investigação de Erros e Logs** | `docs/10_DEBUG_E_TROUBLESHOOTING.md` | Terminal do backend / Console F12 |
| **Passo a Passo Rápido de Alteração** | `docs/08_GUIA_DE_MANUTENCAO.md` | Guia prático mestre |

---

## 5. PROTOCOLO ANTES DE CODIFICAR

Antes de aplicar qualquer modificação que envolva lógica de negócio, APIs ou banco, valide mentalmente este checklist interno:

```text
[ ] Módulo e funcionalidade identificados?
[ ] Documentação consultada para entender o comportamento esperado?
[ ] Arquivos reais de código lidos (não apenas presumidos)?
[ ] Endpoints de API e contratos de tipo (frontend/src/types/index.ts) verificados?
[ ] Tabelas envolvidas e integridade referencial checadas?
[ ] Mapa de impacto avaliado ("Quem mais consome essa tabela ou API?")?
```

---

## 6. PROTOCOLO DE INVESTIGAÇÃO DE BUGS (DEBUGGING)

Ao receber o relato de um erro ou bug:
1. **Consulte o Módulo na Documentação**: Entenda qual é o fluxo de dados desenhado (`Usuário -> Componente -> Hook -> API -> Controller -> Service -> Banco`).
2. **Localize o Ponto da Quebra**: Verifique se o erro ocorre na validação Zod (HTTP 400), na autorização (HTTP 401/403), em regra de negócio (HTTP 400/404 via `AppError`) ou em banco (Prisma).
3. **Consulte `docs/10_DEBUG_E_TROUBLESHOOTING.md`**: Siga as diretrizes de logs, chamadas via cURL e inspeção via Prisma Studio (`npx prisma studio`).
4. **Verifique Efeitos Colaterais em `docs/09_MAPA_DE_DEPENDENCIAS.md`**: Assegure que o conserto não afete outros módulos integrados.

---

## 7. ATUALIZAÇÃO DA BASE DE CONHECIMENTO (`docs/`)

Sempre que uma alteração estrutural for concluída e testada, verifique se a documentação precisa ser atualizada para preservar a memória técnica:
- **Alteração de API/Endpoint**: Atualizar `docs/backend/00_MAPA_DE_APIS.md` e o módulo em `docs/modulos/`.
- **Alteração de Schema/Tabela**: Atualizar `docs/backend/01_BANCO_DE_DADOS.md`.
- **Alteração de Rotas SPA**: Atualizar `docs/frontend/00_ROTAS_FRONTEND.md`.
- **Nova Permissão**: Atualizar `docs/backend/02_AUTENTICACAO_E_PERMISSOES.md`.

> **Segurança**: Nunca persista credenciais, senhas, chaves privadas ou tokens no repositório ou na documentação. Utilize sempre o marcador `<SECRET>`.
