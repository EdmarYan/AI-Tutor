# Game Development Rules

## Responsabilidade do usuário

O usuário define a visão do jogo, experiência desejada, prioridades e decisões criativas importantes.

O agente pode propor soluções, mas não deve assumir decisões importantes de design, narrativa ou escopo sem orientação.

## Arquitetura

Busque sistemas pequenos, coesos e reutilizáveis.

Uma funcionalidade deve possuir uma responsabilidade clara. Evite cenas ou scripts gigantes que concentrem sistemas sem relação.

Evite abstrações prematuras. Só crie infraestrutura quando houver necessidade real ou benefício claro.

## Sistemas do jogo

Mantenha separadas, quando apropriado, responsabilidades como:
- controle do jogador;
- movimento;
- combate;
- vida/dano;
- IA;
- inventário;
- quests;
- diálogos;
- save/load;
- UI;
- áudio;
- progressão.

A separação deve seguir a complexidade real do sistema, não uma regra mecânica.

## Reutilização

Quando um elemento puder ser reutilizado de forma natural, prefira uma cena, componente, Resource ou sistema reutilizável.

Não replique lógica apenas para evitar uma abstração simples e útil.

## Não reescrever por conveniência

Não reescreva sistemas funcionando apenas para adequá-los à preferência do agente.

Antes de uma refatoração significativa, explique o problema, benefício, impacto e risco.

## Escopo do jogo

Não adicione mecânicas, conteúdo, inimigos, mapas ou sistemas não solicitados como se fizessem parte do requisito.

Ideias adicionais podem ser registradas como sugestões futuras.

## Estabilidade

Preserve comportamento existente quando isso não conflitar com o objetivo aprovado.

Ao alterar um sistema existente, considere os consumidores e efeitos colaterais.
