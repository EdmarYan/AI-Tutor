---
tier: semantic
type: Session Summary
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-24T14:32:53Z
---
# Histórico de Estudo e Evolução do Aluno

## 18/09/2026 e 19/09/2026 — Sessão 01: Arquitetura, Requisitos e Modelagem Relacional

### Implementado / Definido por Edmar
- Análise de requisitos do edital RMH Advocacia (Gestão de Documentos).
- Definição da stack (Java 21 + PostgreSQL).
- Raciocínio de infraestrutura sobre sistemas de arquivos efêmeros em nuvem vs. persistência local.
- Primeira versão da modelagem das tabelas `documentos` e `comentarios`.
- Modelagem corrigida do `schema.sql` com tipos adequados (`SERIAL`, `VARCHAR`, `TEXT`, `TIMESTAMP`).
- Criação e depuração do banco no PostgreSQL Docker (`gestao_documentos`), corrigindo o isolamento de conexões.
- Configuração do repositório remoto via SSH e primeiro push da branch `main` para o GitHub (`EdmarYan/gestao-documentos-rmh`).
- Configuração autônoma do `application.properties` (JDBC URL, credenciais, Hibernate DDL update).
- Inicialização bem-sucedida da aplicação Spring Boot conectada ao PostgreSQL via HikariCP (Tomcat na porta 8080).
- Implementação da primeira entidade JPA: `Documento.java` com `@Entity`, `@Table`, `@Id`, `@GeneratedValue(IDENTITY)` e encapsulamento completo.
- Implementação da segunda entidade JPA: `Comentario.java` com relacionamento `@ManyToOne` e `@JoinColumn(name = "documento_id")`.
- Implementação dos repositórios Spring Data JPA: `DocumentoRepository` e `ComentarioRepository` com consulta derivada (`findByDocumentoIdOrderByDataCriacaoDesc`).
- Implementação da camada de serviço (`DocumentoService.java`) cobrindo upload físico em disco com `UUID`, `MultipartFile` e regras de negócio.
- Validação bem-sucedida de compilação via Maven (`BUILD SUCCESS` com 7 arquivos compilados).
- Implementação completa do `DocumentoController.java` com 5 endpoints REST, Javadoc e suporte a streaming/download de binários.
- Alinhamento da arquitetura do frontend em arquivos separados (`index.html`, `style.css`, `app.js`) antes do deploy final.
- 4 commits semânticos no GitHub.



- Resolução de erro `Connection refused` (reativação de container Docker do PostgreSQL).
- Entendimento do fail-fast do HikariCP e integridade referencial sem duplicação de colunas.
- Estruturação do sistema de memória técnica persistente (`knowledge`).



### Conceitos Trabalhados
- **Modelagem Relacional:** 1:N (Um documento possui N comentários).
- **Chave Estrangeira (Foreign Key):** Papel da integridade referencial, tipo compatível (`INTEGER` referenciando `SERIAL/PK`), `ON DELETE CASCADE`.
- **Tipos de Dados SQL:** Diferenças entre `VARCHAR(n)` e `TEXT` no PostgreSQL; uso de `TIMESTAMP` com `DEFAULT CURRENT_TIMESTAMP`.
- **Sessões e Conexões PostgreSQL:** Entendimento de que cada conexão client está vinculada a um banco específico no Postgres.
- **Armazenamento de Arquivos:** Por que evitar BLOB no banco de dados e gravar caminhos no disco do servidor.
- **Git e Versionamento:** Importância de commits semânticos atômicos para avaliação profissional no processo seletivo.
- **Spring Boot & ORM:** Conceito de Starters, Hibernate como ORM, modos de `ddl-auto` (`update`, `validate`, `create-drop`) e `show-sql`.
- **Método de Descoberta Autônoma:** Entendimento dos prefixos lógicos do Spring (`spring.datasource.*`, `spring.jpa.*`), uso do autocomplete no IntelliJ e consulta ao apêndice oficial da documentação.
- **Debugging de Stack Trace:** Leitura da causa raiz (`Caused by`), identificação da obrigatoriedade do protocolo `jdbc:postgresql://` e correção de credenciais de conexão.
- **Mapeamento Objeto-Relacional (JPA/Hibernate):** Uso de `@Entity`, `@Table(name = "documentos")`, chave primária com `@Id` e `@GeneratedValue(strategy = GenerationType.IDENTITY)`.
- **Relacionamentos JPA:** Diferença entre chave estrangeira no SQL vs. objeto no Java; uso de `@ManyToOne` e `@JoinColumn(name = "documento_id")` para ligar `Comentario` a `Documento`.
- **Tipos de Dados em Java:** Diferença crucial entre `char` (caractere único) e `String` (cadeia de caracteres); uso de `LocalDateTime` (`java.time`) para mapear `TIMESTAMP` do SQL.
- **Fundamentos de POO & JPA:** Encapsulamento (`private`), necessidade de Getters/Setters para serialização Jackson/Hibernate e exigência de construtor vazio para Reflection do JPA.
- **Gestão de Prioridades:** Planejamento da virada de entrega da prova técnica (Prazo: 21/09 às 12h), evitando armadilhas de tempo como configuração manual de VPS antes da aplicação estar 100% pronta.

### Pontos a Reforçar / Lacunas Diagnosticadas
- **Sobrecarga de Métodos e Construtores (Overload):** Aluno relatou fragilidade em entender construtores com múltiplos parâmetros, construtor padrão vs sobrecarregado e o uso de `this`.
- **Estratégia Adaptativa de Prazo (21/09 - 02:15h):** Aluno solicitou avanço com código completo ricamente explicado para viabilizar o deploy e entrega dentro do prazo (12h), com plano de revisão aprofundada posterior via Anki.
- Sintaxe específica do PostgreSQL vs MySQL (ex: ausência do comando `USE database`).
- Prática de versionamento com comandos de terminal do Git (distinção commit local vs push remoto).
- Compreensão profunda da Service Layer: desmistificar o fluxo de upload de arquivos (`MultipartFile`, `Path/Files`, `UUID`) e manipulação de entidades antes de persistência.

