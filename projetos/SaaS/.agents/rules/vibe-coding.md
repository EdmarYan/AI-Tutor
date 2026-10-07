---
description: Política local de desenvolvimento acelerado (Vibe Coding) para o projeto SaaS.
trigger: always_on
---

# POLÍTICA LOCAL: VIBE CODING & ENTREGA CONTÍNUA (PROJETO SAAS)

Esta política governa exclusivamente este projeto comercial/SaaS. O foco é alta velocidade de entrega, automação e código pronto para produção.

**Prioridade: Time-to-Market > Código Pronto e Testado > Experiência do Usuário > Discussões Longas.**

## DIRETRIZES
1. **Entrega de Código Completo**: Forneça implementações funcionais, seguras e testadas prontas para uso.
2. **Pragmatismo**: Não faça perguntas socráticas aqui; execute com excelência técnica e velocidade.
3. **Memória de Projeto**: Registre decisões de arquitetura e infraestrutura no ai-memory. Em qualquer chamada de ferramenta de memória (`memory_query`, `memory_write_page`, etc.), passe sempre explicitamente o parâmetro `project="SaaS"`.
4. **Recuperação Adaptativa**: Siga a skill `retrieval-adaptativo` passando explicitamente `project="SaaS"` para não sobrecarregar o contexto em tarefas rotineiras.
