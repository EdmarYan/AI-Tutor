---
tier: semantic
type: Concept
generated:
  by: process:ai-memory/2.4.0
  at: 2026-09-25T17:53:55Z
---
---
title: Snapshot de Dados e Preço Histórico em Vendas
tier: semantic
tags: ["banco-de-dados", "modelagem", "financas", "sql", "integridade", "pandas"]
entities: ["ItemVenda", "Produto", "Venda", "Snapshot", "Foreign Key"]
mastery:
  compreensao: 6
  aplicacao: 4
  autonomia: 3
  transferencia: 3
  status: em_aprendizagem
---

# Snapshot de Dados e Preço Histórico em Vendas

## Problema Mental Comum (Gotcha)
Achar que na tabela `itens_venda` basta guardar `produto_id` e `quantidade`, calculando o valor final por `JOIN produtos`.
- **Risco financeiro grave**: Se o produto mudar de preço (inflação, reajuste), todas as vendas passadas têm seu faturamento e margem adulterados retroativamente.

## Solução Arquitetural Padrão
Toda venda/item vendido DEVE tirar um **snapshot** dos valores no momento exato do fato gerador:
- `preco_unitario`: valor unitário cobrado no momento exato da venda.
- `custo_unitario`: custo estimado de produção/compra no momento da venda (permite calcular lucro real).
- `quantidade`: número de itens vendidos.
- `subtotal`: `quantidade * preco_unitario` (pode ser coluna ou calculado na query).

## Integração com Pandas
- `pd.read_sql("SELECT v.data_hora, iv.preco_unitario, iv.custo_unitario, iv.quantidade ... FROM itens_venda iv JOIN vendas v ...", engine)`
- Com os snapshots preservados, qualquer groupby no Pandas (`df.groupby(df['data'].dt.month)['lucro'].sum()`) traz valores matematicamente perfeitos e imutáveis.

## Registro de Evidências
- [2026-09-25] Apresentada imagem da comanda manual 'FRITOZ - Controle de Vendas' (31 produtos + colunas PIX, Dinheiro, Débito).
- [2026-09-25] Aluno compreendeu a necessidade do preço na tabela de item (`id, preco e nome`).
- [2026-09-25] Hesitação na sintaxe de FOREIGN KEY em PostgreSQL e na relação entre cabeçalho `vendas` e detalhes `itens_venda`.
