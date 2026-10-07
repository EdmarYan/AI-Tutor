# Code Quality Rules

## Princípios

Priorize:
1. clareza;
2. manutenção;
3. separação de responsabilidades;
4. baixo acoplamento;
5. testabilidade;
6. consistência com o projeto existente.

## Nomenclatura

Use nomes descritivos e consistentes.

Evite nomes genéricos como `tmp`, `thing`, `data2` ou `foo` em código permanente.

## Comentários

Comentários devem explicar decisões, comportamentos não óbvios, limitações ou motivos de uma implementação.

Não escreva comentários que apenas traduzam o código linha por linha.

## Funções

Prefira funções com responsabilidade clara e tamanho razoável.

Não quebre código simples em dezenas de funções sem benefício real.

## Duplicação

Antes de criar uma nova função ou sistema, procure lógica equivalente existente.

Reutilize quando isso melhorar clareza e manutenção.

Não crie abstrações artificiais somente para eliminar pequenas semelhanças.

## Código morto

Não mantenha código antigo comentado sem motivo documental.

O histórico pertence ao Git.

## Erros

Não ignore erros silenciosamente.

Quando uma falha puder afetar o jogo, trate-a, registre-a ou exponha a condição de forma apropriada.

## Refatoração

Refatorações devem possuir motivo identificável.

Evite combinar uma grande refatoração com uma feature não relacionada, salvo necessidade técnica clara.
