---
name: indexador-materiais-estudo
description: >-
  Indexa automaticamente materiais acadêmicos (slides, PDFs, listas, anotações) em pastas de disciplinas.
  Deve ser ativada de forma autônoma pelo agente sempre que novos materiais forem adicionados pelo usuário
  em pastas de estudo (como computabilidade, compiladores, etc.) para criar e atualizar um índice temático
  remissivo e glossário com a terminologia exata do professor. Não requer comando explícito do usuário.
---

# Indexador de Materiais de Estudo

## Propósito
Organizar e mapear automaticamente os materiais acadêmicos fornecidos pelo usuário, garantindo que o agente use rigorosamente a terminologia do professor da disciplina e saiba exatamente onde encontrar cada conceito.

## Ativação Automática e Permissões
1. **Ativação Autônoma:** O agente deve acionar esta skill quando novos arquivos forem adicionados ou mencionados na pasta de uma matéria, ou quando for necessário localizar em qual aula/slide determinado tópico foi abordado.
2. **Criação e Atualização de `INDICE_MATERIAIS.md`:** Pré-autorizada pelo usuário para criação e atualização automática sem necessidade de confirmação prévia em cada arquivo indexado.
3. **Exceção de Leitura em Lote:** A leitura sequencial de materiais de estudo (PDFs, slides, textos acadêmicos) por esta skill é uma exceção explícita autorizada à regra de restrição de varreduras em lote do `global-rules.md`.

## Procedimento
1. **Identificar Arquivos:** Mapear os arquivos didáticos presentes na pasta da disciplina (`*.pdf`, `*.txt`, `*.md`, etc.).
2. **Extrair Estrutura:** Identificar capítulos, seções, tópicos-chave e termos técnicos específicos usados pelo professor.
3. **Gerar/Atualizar `INDICE_MATERIAIS.md`:**
   - Criar ou atualizar o arquivo `INDICE_MATERIAIS.md` na pasta da respectiva disciplina.
   - Estruturar em tabela ou lista contendo:
     - **Tópico / Conceito**
     - **Arquivo / Slide de Referência**
     - **Terminologia específica do professor**
     - **Conceitos pré-requisito**

## Integração com o Mentor Pedagógico
O Tutor Socrático (`mentor-programacao.md`, Seção 7) consulta o `INDICE_MATERIAIS.md` da respectiva disciplina ao conduzir sessões de tutoria para adotar a terminologia do docente e manter consistência com o cronograma acadêmico.

## Regra de Ouro
Respeite a ordem e os termos exatos do docente. Não invente conteúdos como se estivessem nos slides e registre de forma clara quando um conceito for complementar e não estiver presente no material oficial.
