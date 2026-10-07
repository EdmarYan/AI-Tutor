---
name: system-maintenance-documentation
description: Analisa, documenta e orienta a manutenção de sistemas existentes por código. Deve ser utilizada para entender arquitetura, módulos, frontend, backend, APIs, banco de dados, rotas, dependências, regras de negócio e impactos de alterações.
---

# SYSTEM MAINTENANCE DOCUMENTATION

## PROPÓSITO

Esta Skill existe para garantir que o sistema seja compreendido e mantido através de documentação técnica baseada no código real.

Seu objetivo é permitir que um desenvolvedor consiga responder rapidamente:

* Onde está essa funcionalidade?
* Qual arquivo controla isso?
* Qual componente renderiza isso?
* Qual API é chamada?
* Qual service processa?
* Qual tabela é utilizada?
* Quais permissões estão envolvidas?
* O que acontece se eu alterar isso?
* Quais arquivos precisam ser modificados?
* O que pode quebrar?
* Como testar a alteração?

---

# PRINCÍPIO FUNDAMENTAL

## O CÓDIGO É A FONTE DA VERDADE.

Nunca assuma que a documentação existente está correta.

Quando houver conflito:

```text
Código
>
Configuração real
>
Banco/schema
>
Testes
>
Documentação
```

A documentação deve ser atualizada para refletir o código.

---

# PROIBIÇÕES

Nunca:

* inventar arquivos;
* inventar APIs;
* inventar tabelas;
* inventar relacionamentos;
* inventar permissões;
* inventar regras de negócio;
* assumir que dois módulos estão relacionados sem evidência;
* afirmar que uma funcionalidade existe sem localizar sua implementação.

Quando algo não puder ser confirmado:

```text
NÃO IDENTIFICADO NO CÓDIGO
```

---

# COMO ANALISAR UMA FUNCIONALIDADE

Sempre siga esta sequência:

## 1. Identificar a entrada

Descubra onde o usuário inicia a ação.

Exemplos:

* botão;
* página;
* formulário;
* menu;
* modal;
* evento.

## 2. Identificar o componente

Descubra qual componente executa a ação.

## 3. Identificar estado

Descubra:

* useState;
* hooks;
* context;
* store;
* cache;
* query;
* mutation.

## 4. Identificar chamada

Descubra qual função é executada.

## 5. Identificar API

Descubra:

* método;
* endpoint;
* payload;
* resposta.

## 6. Identificar backend

Descubra:

```text
route
→ controller
→ service
→ repository
```

ou o equivalente utilizado pelo projeto.

## 7. Identificar banco

Descubra:

* tabela;
* entidade;
* query;
* ORM;
* relacionamento.

## 8. Identificar retorno

Descubra como os dados retornam para o frontend.

---

# MODELO DE FLUXO

Sempre que possível documente:

```text
USUÁRIO
 ↓
PÁGINA
 ↓
COMPONENTE
 ↓
HOOK / STATE
 ↓
SERVICE FRONTEND
 ↓
API
 ↓
ROTA
 ↓
CONTROLLER
 ↓
SERVICE BACKEND
 ↓
REPOSITORY / ORM
 ↓
BANCO
```

Se a arquitetura real for diferente, utilize a arquitetura encontrada.

---

# MANUTENÇÃO

Quando o usuário pedir:

> "Quero alterar X"

primeiro descubra:

1. onde X está implementado;
2. quem chama X;
3. de quem X depende;
4. quais APIs estão envolvidas;
5. quais tabelas estão envolvidas;
6. quais permissões estão envolvidas;
7. quais outras funcionalidades dependem de X.

Depois apresente:

```text
ARQUIVOS A ALTERAR

ARQUIVOS RELACIONADOS

DEPENDÊNCIAS

IMPACTOS

PASSO A PASSO

COMO TESTAR
```

---

# ALTERAÇÃO DE FRONTEND

Antes de alterar:

* localizar página;
* localizar componente;
* localizar props;
* localizar estado;
* localizar hooks;
* localizar chamadas de API;
* localizar tipos;
* localizar validações.

Depois explicar quais arquivos precisam ser alterados.

---

# ALTERAÇÃO DE BACKEND

Antes de alterar:

* localizar rota;
* localizar controller;
* localizar service;
* localizar repository;
* localizar schema;
* localizar DTO;
* localizar entidade;
* localizar tabela.

Depois verificar impactos.

---

# ALTERAÇÃO DE API

Sempre documentar:

```text
Endpoint atual
Método
Request
Response
Autenticação
Autorização
Frontend consumidor
Backend responsável
Banco afetado
```

Se for criar uma API:

1. definir rota;
2. implementar handler/controller;
3. implementar service;
4. implementar acesso ao banco;
5. validar entrada;
6. tratar erros;
7. conectar frontend;
8. atualizar tipos;
9. testar.

Os passos devem ser adaptados à arquitetura real.

---

# ALTERAÇÃO DE BANCO

Antes de alterar banco:

1. localizar entidade;
2. localizar schema;
3. localizar migration;
4. localizar queries;
5. localizar services consumidores;
6. localizar APIs consumidoras;
7. localizar telas consumidoras.

Depois analisar impacto.

Nunca recomendar alteração direta no banco quando o projeto utiliza migrations sem verificar o padrão existente.

---

# NOVA FUNCIONALIDADE

Para adicionar uma nova funcionalidade, utilizar:

```text
1. Requisito
2. Modelo de dados
3. Backend
4. API
5. Frontend
6. Estado
7. Validação
8. Permissões
9. Testes
10. Documentação
```

Não assumir que todos os itens serão necessários. Verificar a arquitetura existente.

---

# DEBUG

Quando houver um bug:

## FRONTEND

Verificar:

* console;
* estado;
* props;
* hooks;
* network;
* payload;
* response.

## API

Verificar:

* endpoint;
* método;
* headers;
* autenticação;
* payload;
* response;
* status HTTP.

## BACKEND

Verificar:

* route;
* controller;
* service;
* validação;
* tratamento de erros;
* logs.

## BANCO

Verificar:

* conexão;
* query;
* schema;
* relacionamento;
* constraints;
* dados.

---

# MAPA DE IMPACTO

Antes de uma alteração significativa, produzir:

```text
ALTERAÇÃO
    ↓
ARQUIVO PRINCIPAL
    ↓
DEPENDÊNCIAS DIRETAS
    ↓
APIs
    ↓
SERVICES
    ↓
BANCO
    ↓
OUTRAS FUNCIONALIDADES
```

Classificar o impacto:

* BAIXO;
* MÉDIO;
* ALTO;
* CRÍTICO.

Justificar a classificação com base no código.

---

# DOCUMENTAÇÃO

A documentação deve permanecer dentro de:

```text
docs/
```

Organizar preferencialmente por:

```text
docs/
├── README.md
├── 00_ARQUITETURA_GERAL.md
├── 01_MAPA_DO_REPOSITORIO.md
├── 02_STACK_TECNOLOGICA.md
├── frontend/
├── backend/
└── modulos/
```

A estrutura pode ser adaptada conforme o tamanho real do sistema.

---

# ATUALIZAÇÃO DA DOCUMENTAÇÃO

Sempre que uma manutenção alterar:

* arquitetura;
* API;
* banco;
* rota;
* componente;
* regra de negócio;
* permissão;
* fluxo;

verificar se algum `.md` precisa ser atualizado.

A documentação não pode ficar deliberadamente desatualizada após uma alteração de código.

---

# REFERÊNCIA A ARQUIVOS

Sempre utilizar caminhos reais.

Exemplo:

```text
src/modules/financeiro/services/financeiro.service.ts
```

Quando possível, indicar:

```text
financeiro.service.ts
→ função buscarLancamentos()
```

Não utilizar caminhos genéricos se o arquivo real puder ser identificado.

---

# REGRA DE CONSERVAÇÃO

Nunca modificar código apenas para tornar a documentação mais fácil.

Nunca refatorar durante uma tarefa de documentação.

Nunca "melhorar" uma arquitetura existente sem solicitação explícita.

---

# OBJETIVO FINAL

A documentação deve permitir que um desenvolvedor faça manutenção sem precisar realizar uma nova engenharia reversa completa.

A pergunta que deve orientar toda análise é:

> "Se alguém precisar alterar essa funcionalidade daqui a seis meses, quais informações serão necessárias para fazer isso com segurança?"

Documente essas informações.
