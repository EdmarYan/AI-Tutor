# Security and Secrets

## Segredos

Nunca:
- commite API keys;
- commite tokens;
- commite senhas;
- commite arquivos `.env` com valores reais;
- commite service accounts;
- commite certificados ou chaves privadas;
- embuta credenciais diretamente no código;
- coloque segredos em documentação ou logs.

Use mecanismos seguros de configuração apropriados ao projeto.

## Conteúdo sensível

Nunca imprima no chat o conteúdo de arquivos que contenham credenciais, tokens, chaves privadas ou outros segredos.

Ao explicar um problema relacionado a um segredo, oculte seu valor.

## Segredo encontrado

Se encontrar um segredo já presente no projeto ou no histórico:

1. não o reproduza no chat;
2. avise imediatamente o usuário;
3. evite propagá-lo para novos arquivos ou commits;
4. recomende rotação/revogação quando aplicável;
5. trate a remoção e limpeza do histórico como uma ação que exige decisão humana quando houver impacto.

## Rede

Não faça chamadas de rede externas, downloads, uploads, publicação ou envio de dados não solicitados pelo usuário ou não necessários para uma ação explicitamente aprovada.

Quando uma ferramenta externa for necessária, deixe claro qual recurso será acessado e por quê quando isso envolver impacto relevante.

## Dependências

Não introduza dependências externas sem necessidade técnica clara. Dependências novas devem ser avaliadas de acordo com o workflow e aprovação humana quando exigida.
