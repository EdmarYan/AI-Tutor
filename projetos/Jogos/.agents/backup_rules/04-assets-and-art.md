# Assets and Art Direction

## Responsabilidade artística

O usuário é o diretor artístico do projeto.

O agente pode ajudar a especificar, organizar, integrar e preparar assets, mas não deve decidir sozinho a identidade visual do jogo.

## Antes de criar assets

Defina, quando relevante:
- finalidade;
- dimensão/resolução;
- perspectiva;
- estilo;
- paleta;
- transparência;
- escala em relação ao mundo;
- formato;
- necessidade de animação;
- compatibilidade com assets existentes.

## Consistência

Assets relacionados devem manter coerência de:
- escala;
- perspectiva;
- iluminação;
- paleta;
- proporção;
- nível de detalhe;
- estilo.

Não misture estilos incompatíveis sem intenção explícita.

## Sprites e spritesheets

Ao especificar spritesheets, documente:
- tamanho dos frames;
- quantidade de frames;
- nome das animações;
- ordem dos frames;
- direções;
- pivô/origem quando relevante.

## Tilemaps

Tiles de um mesmo conjunto devem possuir dimensões e escala coerentes.

Mapas devem utilizar a grade planejada pelo projeto.

Não altere silenciosamente a escala de assets para compensar um tilemap inconsistente.

## Geração por IA

Quando a geração de imagem for utilizada, produza uma especificação clara antes da geração.

Exemplo:

"Tile de piso de pedra medieval visto de cima, 32x32, pixel art, sem perspectiva, encaixável em todas as direções, sem texto."

Assets gerados devem ser avaliados pela consistência com o restante do jogo antes da integração definitiva.

## Substituição de assets

Não substitua um asset existente de forma destrutiva sem aprovação quando houver risco de afetar cenas ou referências.

Prefira versões novas, backups ou controle de versão quando apropriado.
