# Debugging and Testing Rules

## Regra principal

REPRODUZA → IDENTIFIQUE → CORRIJA → TESTE NOVAMENTE

Não aplique alterações aleatórias até o problema desaparecer.

## Reprodução

Determine, quando possível:
- como reproduzir;
- quando ocorre;
- frequência;
- sistema afetado;
- condições necessárias.

## Diagnóstico

Procure a causa raiz antes de aplicar uma correção.

Se a causa não puder ser determinada, registre a incerteza em vez de inventar uma explicação.

## Correção

Altere a menor quantidade de código necessária para corrigir o problema.

Evite solucionar um bug introduzindo outro sistema paralelo.

## Regressão

Depois da correção:
- reproduza o cenário original;
- teste o fluxo normal;
- teste casos extremos relevantes;
- verifique sistemas relacionados.

## Logs

Use logs temporários durante investigação quando necessário.

Remova logs de depuração desnecessários após a correção.

## Validação

Nunca diga que algo foi testado sem executar a validação correspondente.

Se um teste não puder ser executado, informe exatamente o que não foi possível validar.

## Bugs complexos

Quando útil, documente:

Bug:
Causa:
Correção:
Teste realizado:
Resultado:

## Godot editor/runtime

Ao investigar erros, verifique tanto o código quanto o estado das cenas, nodes, recursos, referências e configurações do projeto.
