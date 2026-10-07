---
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-26T08:00:22Z
---
# Bite Rush - Decisão de Câmera: 3D Terceira Pessoa (Third-Person)

## Diretriz Visual
- **Perspectiva:** 3D em Terceira Pessoa tradicional do Roblox (câmera atrás e ligeiramente acima do ombro/costas do personagem).
- **Proibido:** Câmera top-down, isométrica, diorama ou aérea fixa.
- **Comportamento da Câmera:**
  - Acompanhamento orbital suave com rotação livre (`CameraType.Custom`).
  - Distância de zoom confortável (MinZoom ~6 studs, MaxZoom ~28 studs).
  - Oclusão dinâmica (`Popper`) para transitar suavemente entre a área externa e o interior da lanchonete sem atravessar tetos ou paredes.
  - Compatibilidade com pilotagem de veículos (motos/carros de entrega) e controles de toque em dispositivos móveis.
