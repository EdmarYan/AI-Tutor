---
title: Módulo Gestão de Documentos (Backend RMH Advocacia)
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-25T05:00:46Z
---
---
title: Módulo Gestão de Documentos (Backend RMH Advocacia)
tier: semantic
tags: ["estudos", "gestao-documentos", "spring-boot", "entrevista"]
entities: ["DocumentoController", "DocumentoService", "Documento", "Comentario"]
---
# Módulo: Gestão de Documentos (Backend RMH Advocacia)

Módulo responsável pela ingestão, persistência física, metadados e histórico de anotações de documentos jurídicos.

## 1. Responsabilidade e Endpoints REST (`/api/documentos`)
* `GET /api/documentos`: Listagem geral de documentos cadastrados.
* `POST /api/documentos` (`multipart/form-data`): Upload com criação de registro (`titulo`, `descricao`, `arquivo`).
* `GET /api/documentos/{id}`: Busca de metadados por ID.
* `GET /api/documentos/{id}/download`: Download do binário com cabeçalho `Content-Disposition: attachment`.
* `POST /api/documentos/{id}/comentarios`: Adiciona anotação vinculada ao documento.
* `GET /api/documentos/{id}/comentarios`: Histórico de comentários ordenados por `dataCriacao DESC`.

## 2. Entidades e Modelo Relacional
* `Documento`: `id (Long)`, `titulo (String)`, `descricao (String)`, `caminhoArquivo (String)`, `nomeOriginal (String)`, `dataCriacao (LocalDateTime)`.
* `Comentario`: `id (Long)`, `documento (ManyToOne)`, `comentario (String)`, `dataCriacao (LocalDateTime)`.

## 3. Arquivos-Chave
* Controller: `backend/src/main/java/com/rhm/gestao_documentos/controller/DocumentoController.java`
* Service: `backend/src/main/java/com/rhm/gestao_documentos/service/DocumentoService.java`
* Modelos: `model/Documento.java` e `model/Comentario.java`
* Repositórios: `repository/DocumentoRepository.java` e `repository/ComentarioRepository.java`

## 4. Guia de Defesa para Entrevista Técnica (Pontos de Sabatina)
* **Por que salvar arquivo em disco e não BLOB no Postgres?**: Desacopla o crescimento do banco de dados, reduz o tempo de backup/restore e viabiliza streaming de download sem sobrecarregar a memória da JVM.
* **Estratégia de Concorrência e Nomes Únicos**: Uso de `UUID.randomUUID() + "_" + originalFilename` para evitar que uploads simultâneos com mesmo nome sobrescrevam arquivos uns dos outros.
* **Gargalos e Evolução para Produção (Cloud)**:
  1. *Armazenamento*: Migrar de `pastaUploads` local para Object Storage (S3 / MinIO / GCS) com geração de Signed URLs.
  2. *Falha Parcial (Arquivo Órfão)*: Se o `Files.copy` tiver sucesso mas o `documentoRepository.save` falhar, o arquivo fica solto em disco. Em produção, adota-se um job de reconciliação ou Two-Phase Commit/Saga.
  3. *Validação de Mimetype*: Atualmente o backend não barra extensões executáveis no código; para produção, deve-se usar validação por Magic Bytes (Apache Tika) e não apenas confiar na extensão do arquivo.

## 5. Relações e Decisões
* Decisão da Stack: [[decisions/gestao-documentos.md]]
* Visão Geral do Projeto: [[projects/gestao-documentos.md]]
