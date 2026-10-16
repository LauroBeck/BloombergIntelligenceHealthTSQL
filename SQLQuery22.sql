SELECT 
    f.RegiaoBrasil AS [Regiao],
    f.PracaMercado AS [Estado],
    c.NomeCorporacao AS [Corporacao_Ativa],
    'R$ ' + CAST(CAST(f.FaturamentoMercadoEstadoBRL / 1000000000.0 AS DECIMAL(10,2)) AS VARCHAR(20)) + ' Bi' AS [Mercado_Total],
    CAST(f.MarketSharePct AS VARCHAR(10)) + '%' AS [Share],
    'R$ ' + CAST(CAST((f.FaturamentoMercadoEstadoBRL * (f.MarketSharePct / 100.0)) / 1000000000.0 AS DECIMAL(10,2)) AS VARCHAR(20)) + ' Bi' AS [Faturamento_Estimado_RD]
FROM 
    Fato_Mercado_Saude f
INNER JOIN 
    Dim_Corporacao c ON f.CorporacaoID = c.CorporacaoID
WHERE 
    f.RegiaoBrasil IS NOT NULL
GROUP BY 
    f.RegiaoBrasil, f.PracaMercado, c.NomeCorporacao, f.FaturamentoMercadoEstadoBRL, f.MarketSharePct
ORDER BY 
    f.FaturamentoMercadoEstadoBRL DESC;
