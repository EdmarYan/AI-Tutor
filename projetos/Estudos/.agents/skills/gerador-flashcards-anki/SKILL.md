---
name: gerador-flashcards-anki
description: >-
  Gera proativamente arquivos de flashcards (CSV/TSV) prontos para importação no Anki e AnkiDroid.
  Deve ser ativada automaticamente pelo agente ao final de discussões conceituais, correções de raciocínio,
  detecção de fragilidades (faixa amarela/vermelha) ou quando o usuário aprender algo novo em programação
  ou matérias teóricas que precise de repetição espaçada. Não requer comando explícito do usuário.
---

# Gerador de Flashcards para o Anki

## Propósito
Auxiliar na retenção de longo prazo criando cartões atômicos e eficazes para importação no Anki / AnkiDroid, tanto para conceitos de programação (Java, TypeScript, arquitetura) quanto disciplinas teóricas da faculdade (Complexidade, Autômatos, Compiladores).

## Ativação Automática (Sem necessidade de comando do usuário)
O agente deve acionar esta skill quando:
1. Uma dúvida conceitual importante for sanada (ex.: diferença entre sobrecarga e sobreescrita, significado intuitivo de $O(\log n)$).
2. Um erro recorrente de raciocínio for corrigido e exigir fixação.
3. Ao final de um bloco de estudo ou diagnóstico.

## Regras para Cartões Eficazes (Anki Best Practices)
1. **Princípio do Mínimo Detalhe:** Cada cartão deve testar exatamente **um** conceito ou ideia (evite cartões que exigem parágrafos como resposta).
2. **Pergunta Direta e Ativa:** Em vez de pedir definições vagas, pergunte:
   - *"O que acontece quando...?"*
   - *"Qual a diferença entre X e Y?"*
   - *"Por que a busca binária é $O(\log n)$?"*
3. **Formato Compatível com Anki:**
   - Separador por ponto e vírgula (`;`) ou Tabulação.
   - Colunas: `Frente;Verso;Tags`
   - Use formatação HTML básica se necessário (`<b>`, `<code>`, `<br>`).

## Onde Salvar
- Salve SEMPRE na pasta centralizada: `/home/edmar/flashcards/` (acessível pelo Windows em `\\wsl.localhost\Ubuntu\home\edmar\flashcards`).
- Nomeie os arquivos por assunto/projeto (ex.: `/home/edmar/flashcards/flashcards_gestao_documentos.csv` ou agregando em `/home/edmar/flashcards/flashcards_anki.csv`).
- Se o arquivo já existir, anexe novos cartões sem apagar os anteriores.
- Avise o usuário brevemente que os cartões foram adicionados e mostre uma prévia de 2 ou 3 cartões gerados.
