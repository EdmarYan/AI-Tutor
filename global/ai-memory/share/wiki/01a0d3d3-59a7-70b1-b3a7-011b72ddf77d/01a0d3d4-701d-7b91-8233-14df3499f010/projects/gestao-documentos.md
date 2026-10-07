---
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T14:32:53Z
---
# Mapa do Projeto — Gestão de Documentos (RMH Advocacia)

## 1. Objetivo
Aplicação web simples para gestão de documentos com upload de arquivos (PDF/JPG/PNG) e histórico de comentários por documento.
Projeto desenvolvido para a Prova Técnica Oficial de Estágio Full Stack (Resende Mori Hutchison Advocacia). Prazo final de entrega: 21/09 às 12h. Requisito essencial: deploy público ativo.

## 2. Stack Tecnológica
- **Backend:** Java 21 com Spring Boot (Spring Web, Spring Data JPA)
- **Banco de Dados:** PostgreSQL
- **Frontend:** HTML, CSS, JavaScript (ou React, conforme evolução)
- **Armazenamento de Arquivos:** Sistema de arquivos local (diretório `uploads/` no servidor)
- **Deploy:** Render / Railway (Backend) + Neon.tech / Supabase (Postgres)

## 3. Estrutura do Sistema
- `database/schema.sql`: Script de criação das tabelas `documentos` e `comentarios`.
- `backend/`: API REST Spring Boot (em planejamento).
- `frontend/`: Interface web para upload, listagem e comentários (em planejamento).

## 4. Entidades e Modelo Relacional
- **Documento:** `id`, `titulo`, `descricao`, `caminho_arquivo`, `data_criacao`.
- **Comentario:** `id`, `documento_id` (FK para `documentos.id`), `comentario`, `data_criacao`.

## 5. Endpoints Previstos (API REST)
- `POST /api/documentos`: Upload de arquivo + metadados (MultipartForm).
- `GET /api/documentos`: Listagem de documentos cadastrados.
- `GET /api/documentos/{id}/download`: Download/visualização do arquivo físico.
- `POST /api/documentos/{id}/comentarios`: Adicionar comentário a um documento.
- `GET /api/documentos/{id}/comentarios`: Listar histórico de comentários de um documento.

## 6. Estado Atual do Projeto
- [x] Levantamento de requisitos do edital
- [x] Modelagem do banco de dados relacional
- [x] Criação do repositório Git e primeiro commit
- [x] Inicialização do projeto Spring Boot
- [ ] Implementação do Backend (Entities, Repositories, Services, Controllers)
- [ ] Implementação do Frontend
- [ ] Deploy e testes em ambiente público
