SELECT 
    c.NomeCorporacao AS [Corporacao],
    c.StatusMercadoBR AS [Status no Brasil],
    f.PracaMercado AS [Praca],
    m.NomeMedicamento AS [Medicamento],
    a.DescricaoCanal AS [Canal/Rede],
    CASE 
        WHEN f.ConsumidoresAtendidosAnual = 0 AND f.PracaMercado IN ('SP','RJ') THEN 'Operação Descontinuada'
        ELSE ISNULL(CAST(f.ConsumidoresAtendidosAnual AS VARCHAR(30)), 'N/A')
    END AS [Volume Consumidores],
    ISNULL('$' + CAST(f.PrecoComDescontoCupom AS VARCHAR(20)), 'N/A') AS [Preco Final (USD)]
FROM 
    Fato_Mercado_Saude f
INNER JOIN 
    Dim_Corporacao c ON f.CorporacaoID = c.CorporacaoID
INNER JOIN 
    Dim_Medicamento m ON f.MedicamentoID = m.MedicamentoID
INNER JOIN 
    Dim_CanalAcesso a ON f.CanalAcessoID = a.CanalAcessoID
GROUP BY 
    c.NomeCorporacao, c.StatusMercadoBR, f.PracaMercado, m.NomeMedicamento, a.DescricaoCanal, f.ConsumidoresAtendidosAnual, f.PrecoComDescontoCupom;
