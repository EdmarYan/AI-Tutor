# Git and Versioning Rules

## Versionamento

Use Git para acompanhar o projeto desde o início.

O histórico deve permitir identificar mudanças pequenas e reversíveis.

## Commits

Prefira commits pequenos e semanticamente claros.

Exemplos:
- `feat: add player movement`
- `feat: add enemy navigation`
- `fix: prevent enemy overlap`
- `refactor: separate combat logic`
- `docs: update architecture`

Evite commits que misturem sistemas não relacionados.

## Antes de commit

Verifique:
- diff;
- arquivos inesperadamente modificados;
- erros óbvios;
- arquivos temporários;
- segredos ou credenciais;
- se a mensagem representa realmente a mudança.

## Rollback

Quando uma alteração causar regressão, prefira usar o histórico do Git para recuperar uma versão segura em vez de reconstruir manualmente código perdido.

Não apague ou sobrescreva trabalho do usuário sem aprovação.

## Branches

Use branches quando a mudança for experimental, grande, arriscada ou puder ser desenvolvida de forma independente.

Não crie branches desnecessárias para mudanças triviais.

## Commits automáticos

Não faça commits automaticamente após qualquer alteração sem considerar o workflow do projeto.

Quando o usuário pedir commit, forneça uma mensagem coerente e verifique o diff antes de concluir.
