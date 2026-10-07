---
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T08:30:52Z
---
# Bite Rush - NPCs com Rotina, Sacola Física, Economia e Upgrades

## Implementações Desta Fase
1. **Clientes NPCs com Rotina e IA (`CustomerAIService.luau`):**
   - NPCs andam de forma orgânica pela calçada (`Humanoid:MoveTo`), entram pela porta da lanchonete, chegam ao balcão (`Station_Counter`), aguardam seus pedidos e se sentam nas mesas da lanchonete.
   - Apresentam `BillboardGui` dinâmico acima da cabeça com balões de fala, humor e nível de lealdade.
   - Reação cômica de lanches irresistíveis (qualidade 95+): emitem corações e partículas com a gag "🤤 IRRESISTÍVEL! EU PRECISO DE OUTRO!".
   - Após comerem na mesa, levantam, agradecem e caminham até a calçada para despawnar.
2. **Item Físico da Sacola de Fast-Food na Mão (`CookingService.luau`):**
   - Ao concluir a embalagem na bancada (`Station_Package`), o jogador recebe uma `Tool` ("FoodBag") visual equipada na mão em terceira pessoa.
   - A sacola é consumida e destruída no momento da entrega no balcão ou na casa do cliente.
3. **Economia e Loja de Upgrades (`EconomyService.luau` & `EconomyController.luau`):**
   - HUD no canto superior direito exibindo Dinheiro (`💰 $`) e Reputação (`⭐ Rep`).
   - Totem de Upgrades (`Station_Upgrades`) com interface interativa de negócios:
     - 🔥 **Chapa Turbo ($60):** Aumenta tolerância da carne no ponto.
     - 🍟 **Fritadeira Dupla ($50):** Otimiza a temperatura do óleo.
     - 🛵 **Moto Sport Delivery ($100):** Aumenta a velocidade da moto para 68 studs/s.
     - 🍔 **Burger Secreto Irresistível ($120):** Dobra as gorjetas dos clientes.
4. **Cenário Aprimorado (`MapBuilderService.luau`):**
   - Adicionadas 4 mesas e cadeiras para refeição dos clientes no salão.
   - Partículas visuais de fumaça (`Smoke`) na chapa e iluminação dinâmica âmbar na fritadeira.
