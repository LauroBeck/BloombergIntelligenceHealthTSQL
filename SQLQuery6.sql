SELECT 
    c.NomeCorporacao AS [Corporacao],
    m.NomeMedicamento AS [Medicamento],
    a.DescricaoCanal AS [Canal],
    
    -- Exibe o alcance populacional formatado
    CASE 
        WHEN a.DescricaoCanal LIKE '%Varejo%' THEN f.ConsumidoresAtendidosAnual 
        ELSE f.MembrosSeguroCore 
    END AS [Populacao_Alvo],
    
    -- Cálculos Financeiros Unitários
    f.PrecoTabelaEstimado AS [Preco_Balcao_USD],
    ISNULL(f.PrecoComDescontoCupom, f.PrecoTabelaEstimado) AS [Preco_Final_USD],
    
    -- Calcula o percentual de desconto concedido por cupons (GoodRx/Parcerias)
    CASE 
        WHEN f.PrecoComDescontoCupom IS NOT NULL AND f.PrecoTabelaEstimado > 0
        THEN CAST(((f.PrecoTabelaEstimado - f.PrecoComDescontoCupom) / f.PrecoTabelaEstimado) * 100 AS DECIMAL(5,2))
        ELSE 0.00
    END AS [Desconto_Aplicado_Pct]

FROM 
    Fato_Mercado_Saude f
INNER JOIN 
    Dim_Corporacao c ON f.CorporacaoID = c.CorporacaoID
INNER JOIN 
    Dim_Medicamento m ON f.MedicamentoID = m.MedicamentoID
INNER JOIN 
    Dim_CanalAcesso a ON f.CanalAcessoID = a.CanalAcessoID

-- Agrupa para remover as linhas duplicadas presentes no seu dump de dados
GROUP BY 
    c.NomeCorporacao, 
    m.NomeMedicamento, 
    a.DescricaoCanal,
    f.ConsumidoresAtendidosAnual,
    f.MembrosSeguroCore,
    f.PrecoTabelaEstimado,
    f.PrecoComDescontoCupom;
