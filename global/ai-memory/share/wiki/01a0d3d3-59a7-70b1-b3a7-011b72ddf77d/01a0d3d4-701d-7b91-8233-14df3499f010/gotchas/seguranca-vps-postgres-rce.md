---
tags:
- seguranca
- devsecops
- docker
- postgres
- vps
pinned: true
tier: semantic
type: Gotcha
generated:
  by: process:ai-memory/2.4.0
  at: 2026-10-02T05:11:37Z
---
# Gotcha: Exposição de Banco na VPS, Força Bruta e RCE via PostgreSQL COPY PROGRAM

## O Incidente
- **Data do evento:** 25/09/2026 às 19:15 UTC.
- **Vetor de entrada:** Porta `5432` aberta para `0.0.0.0` via Docker Compose (`ports: - "5432:5432"`). O Docker manipula tabelas do `iptables` diretamente e bypassa as regras padrão do firewall `ufw` do Ubuntu.
- **Método de invasão:** Ataque de força bruta por dicionário de botnet automatizada, acertando a credencial padrão/fraca configurada no container (`postgres:postgrespassword`).
- **Execução do Malware (RCE):** O invasor utilizou o comando administrativo nativo do PostgreSQL `COPY ... FROM/TO PROGRAM` (disponível para o superuser `postgres`) para executar comandos Bash arbitrários no Linux, baixando o `xmrigMiner` em `/var/tmp/.kd/` e consumindo 87% da CPU da VPS com mineração de Monero.

## Regras de Blindagem Obrigatórias
1. **Nunca expor portas de banco de dados no host em produção:**
   - Em containers que comunicam entre si (ex: Spring Boot e Postgres no mesmo docker-compose), NÃO usar a diretiva `ports: 5432:5432`. Os containers já se comunicam pela rede interna do Docker via DNS interno (`postgres:5432`).
   - Se acesso externo for estritamente necessário para debug/manutenção, amarrar apenas no loopback local: `127.0.0.1:5432:5432` e acessar via túnel SSH.
2. **Princípio do Menor Privilégio no Banco:**
   - A aplicação nunca deve conectar como superuser `postgres`. Criar um usuário dedicado da aplicação sem permissão de superusuário e sem acesso a `COPY PROGRAM`.
3. **Credenciais Fortes e Variáveis de Ambiente:**
   - Senhas geradas com alta entropia (`openssl rand -base64 24`) em arquivo `.env` nunca versionado no Git.
