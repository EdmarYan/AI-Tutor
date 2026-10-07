---
name: visualizador-algoritmos
description: >-
  Gera representações visuais interativas e diagramas para estruturas de dados, algoritmos,
  árvores sintáticas (AST), autômatos de estados finitos (DFA/NFA) e execução passo a passo.
  Deve ser ativada autonomamente pelo agente quando um conceito abstrato ou estrutural for
  difícil de visualizar apenas em texto puro. Não requer comando explícito do usuário.
---

# Visualizador de Algoritmos e Modelos Computacionais

## Propósito
Traduzir conceitos abstratos em diagramas claros (Mermaid ou HTML interativo) para facilitar a compreensão visual, especialmente em disciplinas teóricas como:
- **Computabilidade e Complexidade:** Árvores de recursão (Merge Sort, Fibonacci), comparações de funções assintóticas, rastreamento de laços e contagem de operações.
- **Linguagens Formais e Compiladores:** Diagramas de transição de autômatos finitos (DFA / NFA), autômatos com pilha, grafos de sintaxe abstrata (AST), tabelas de transição e derivações de gramáticas livres de contexto.
- **Estruturas de Dados e Programação:** Ponteiros, nós encadeados, pilhas, filas e heap.

## Ativação Automática (Sem comando do usuário)
O agente deve acionar esta skill quando:
1. O usuário demonstrar dificuldade em enxergar o fluxo de execução de um algoritmo ou recursão.
2. A matéria envolver transições de estados, gramáticas ou expressões regulares (Regex $\to$ Autômato).
3. Uma imagem ou diagrama explicar melhor que múltiplos parágrafos de texto.

## Formatos de Saída
1. **Diagramas Mermaid (Padrão e Rápido):**
   - Renderizados diretamente no chat (`flowchart`, `graph TD`, `stateDiagram-v2`).
   - Excelente para autômatos, grafos e árvores sintáticas.
2. **HTML Interativo (Para simulações e passo a passo):**
   - Criado como arquivo na pasta da disciplina ou demonstrado via artefato visual quando for necessário um botão de "próximo passo" para simular a execução de um algoritmo ou fita de máquina de Turing / autômato.
