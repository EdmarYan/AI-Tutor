---
name: gerador-flashcards-anki
description: >-
  Gera proativamente arquivos de flashcards (CSV/TSV) prontos para importação no Anki e AnkiDroid.
  Deve ser ativada automaticamente pelo agente ao final de discussões conceituais, correções de raciocínio,
  detecção de fragilidades cognitivas (compreensão baixa/média) ou quando o usuário aprender algo novo em programação,
  matemática, estatística ou segurança que precise de repetição espaçada. Não requer comando explícito do usuário.
---

# Gerador de Flashcards para o Anki

## Propósito
Auxiliar na retenção de longo prazo criando cartões atômicos e eficazes para importação no Anki / AnkiDroid, abrangendo:
- **Programação & Engenharia:** Java, TypeScript, C, concorrência, estruturas de dados fundamentais.
- **Matemática & Estatística:** Álgebra linear, cálculo, probabilidade, distribuições, intuição estatística.
- **Segurança da Informação:** Boas práticas defensivas (ex.: "Por que usar bcrypt em vez de MD5 para senhas?").
- **Disciplinas Teóricas:** Complexidade computacional, autômatos, compiladores, redes e sistemas operacionais.

## Ativação Automática (Sem necessidade de comando do usuário)
O agente deve acionar esta skill quando:
1. Uma dúvida conceitual importante for sanada.
2. O estado cognitivo do aluno indicar **compreensão ou aplicação baixa/média** exigindo fixação e ancoragem.
3. Um erro recorrente de raciocínio ou pegadinha conceitual for superado.
4. Ao final de um bloco de estudo ou encerramento de sessão pedagógica.

## Regras para Cartões Eficazes (Anki Best Practices)
1. **Princípio do Mínimo Detalhe:** Cada cartão deve testar exatamente **um** conceito ou ideia (evite cartões que exigem parágrafos longos como resposta).
2. **Pergunta Direta e Ativa:**
   - *"O que acontece quando...?"*
   - *"Qual a diferença entre X e Y?"*
   - *"Por que a busca binária é $O(\log n)$?"*
   - *"Qual o risco de segurança em concatenar strings em uma query SQL?"*
3. **Termos em Inglês (Cartão Bilíngue):** Como o inglês do aluno é básico, sempre que houver termos técnicos comuns em inglês (ex: *deadlock*, *data leakage*, *shadowing*, *garbage collection*), inclua a palavra em inglês com a tradução ou explicação correspondente na frente ou no verso.
4. **Formato Compatível com Anki:**
   - Separador por ponto e vírgula (`;`) ou Tabulação.
   - Colunas: `Frente;Verso;Tags`
   - Use formatação HTML básica se necessário (`<b>`, `<code>`, `<br>`).

## Onde Salvar
- Salve SEMPRE na pasta centralizada: `/home/edmar/flashcards/` (acessível pelo Windows em `\\wsl.localhost\Ubuntu\home\edmar\flashcards`).
- Nomeie os arquivos por assunto/projeto (ex.: `/home/edmar/flashcards/flashcards_gestao_documentos.csv`, `/home/edmar/flashcards/flashcards_seguranca.csv` ou agregando em `/home/edmar/flashcards/flashcards_anki.csv`).
- Se o arquivo já existir, anexe novos cartões sem apagar os anteriores.
- Avise o usuário brevemente que os cartões foram adicionados e mostre uma prévia de 2 ou 3 cartões gerados.
