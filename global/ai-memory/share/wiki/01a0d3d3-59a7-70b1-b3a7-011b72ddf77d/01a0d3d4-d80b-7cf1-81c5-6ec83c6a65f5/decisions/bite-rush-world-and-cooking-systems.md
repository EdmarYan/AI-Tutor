---
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T08:02:24Z
---
# Bite Rush - Conclusão do Mundo 3D, Cozinha e Minijogos em Tempo Real

## Status
- **Perspectiva:** Câmera 3D em Terceira Pessoa tradicional do Roblox implementada via `CameraController.luau` (zoom dinâmico 6-28 studs, `CameraMode.Classic`, elevação suave do ombro).
- **Mundo Pequeno (Fase 3):** Construído proceduralmente via `MapBuilderService.luau` contendo:
  - Asfalto principal com faixas e calçadas.
  - Lanchonete Bite Rush com piso, paredes, vidraça, letreiro neon e balcão.
  - Fornecedor "Mercado Fresh" com balcão de compras.
  - Ponto de entrega residencial ("Casa da Dona Maria") com dropzone iluminada.
  - Moto de entrega funcional com `VehicleSeat` estacionada na porta.
- **Primeira Lanchonete e Estações (Fase 4):**
  - Chapa (`Station_Grill`), Fritadeira (`Station_Fryer`), Bancada de Montagem (`Station_Assembly`), Estação de Molhos (`Station_Sauce`), Embalagem (`Station_Package`), Balcão de Pedidos (`Station_Counter`).
- **Sistema de Pedidos (Fase 5):** `OrderService.luau` gerencia pedidos ativos dinâmicos com contagem regressiva de urgência, tipos de pedido (Balcão ou Delivery) e valores.
- **Minijogos de Cozinha em Tempo Real (Fase 8):** `CookingMinigamesController.luau` implementa:
  - 🥩 **Chapa:** Barra de cozimento em tempo real (Crua $\rightarrow$ Ponto Ideal [60-85%] $\rightarrow$ Queimada).
  - 🍟 **Fritura:** Barra de temperatura do óleo com ponto ideal dourado e crocante.
  - 🍔 **Montagem:** Sequência de cliques em tempo real (Pão Base $\rightarrow$ Carne $\rightarrow$ Queijo $\rightarrow$ Alface $\rightarrow$ Pão Topo).
  - 🥫 **Molho:** Minijogo de pressão por tempo segurando o botão para acertar a dose exata.
  - 📦 **Embalagem:** Sequência de empacotamento rápido e selagem do combo.
- **Qualidade, Satisfação e Lealdade (Fases 9 a 15):**
  - `QualityFormula.luau`: Cálculo ponderado 0–100 baseado no desempenho de cada minijogo.
  - `CustomerService.luau`: Níveis de lealdade (Novo $\rightarrow$ Satisfeito $\rightarrow$ Frequente $\rightarrow$ Fiel $\rightarrow$ VIP), produtos irresistíveis (qualidade 95+) com gorjetas extras.
  - `CookingService.luau`: Recebe as conclusões, atualiza a preparação, valida entrega no balcão ou na casa do cliente e distribui o dinheiro ao jogador.
