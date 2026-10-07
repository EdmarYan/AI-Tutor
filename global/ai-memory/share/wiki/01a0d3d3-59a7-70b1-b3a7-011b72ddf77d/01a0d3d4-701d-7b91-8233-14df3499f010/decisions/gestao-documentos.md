---
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T14:32:53Z
---
# Registro de Decisões Arquiteturais (ADRs)

## DEC-001 — Escolha da Stack: Java 21 + Spring Boot + PostgreSQL
- **Data:** 18/09/2026
- **Status:** Aprovado
- **Contexto:** A prova técnica do processo seletivo RMH Advocacia permite livre escolha de backend e banco de dados. Prazo de entrega: 21/09.
- **Decisão:** Utilizar Java 21 com Spring Boot e PostgreSQL.
- **Motivo:** Java é a linguagem de domínio prático do aluno (reduz atrito de aprendizado de sintaxe durante prova com prazo). PostgreSQL é padrão da indústria e atende os requisitos relacionais.
- **Trade-offs:** Exige maior tempo de configuração inicial e deploy mais pesado que stacks minimalistas (ex: Node/SQLite), compensado pelo domínio técnico do candidato.

---

## DEC-002 — Armazenamento de Arquivos: Sistema de Arquivos Local (Uploads)
- **Data:** 18/09/2026
- **Status:** Aprovado
- **Contexto:** Necessidade de armazenar PDFs, PNGs e JPGs enviados pelos usuários.
- **Decisão:** Salvar os arquivos físicos em diretório local do servidor (`uploads/`) e persistir apenas o caminho relativo no PostgreSQL.
- **Motivo:** Cumprimento estrito do Requisito 4.1 do edital ("O arquivo deverá ser armazenado localmente"). Evita sobrecarga de BLOB no PostgreSQL e complexidade desnecessária de provedores de storage (S3/Firebase) incompatíveis com o escopo de estágio.
- **Consequência:** Sistemas em nuvem efêmeros perdem arquivos em reinicializações, o que é aceito e esperado pelo escopo da prova técnica.

---

## DEC-003 — Modelo de Dados e Integridade Referencial
- **Data:** 19/09/2026
- **Status:** Aprovado
- **Decisão:** Duas tabelas relacionais (`documentos` e `comentarios`) unidas por Chave Estrangeira com `ON DELETE CASCADE`.
- **Motivo:** Garante que a exclusão de um documento limpe automaticamente o histórico de comentários sem deixar registros órfãos no banco.
