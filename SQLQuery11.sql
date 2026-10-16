IF OBJECT_ID('vw_Mercado_Saude_Consolidado', 'V') IS NOT NULL
    DROP VIEW vw_Mercado_Saude_Consolidado;
GO

CREATE VIEW vw_Mercado_Saude_Consolidado AS
SELECT 
    c.NomeCorporacao AS [Corporacao],
    ISNULL(c.StatusMercadoBR, 'Sem Historico') AS [Status_Brasil],
    f.PracaMercado AS [Praca],
    m.NomeMedicamento AS [Medicamento],
    a.DescricaoCanal AS [Canal],
    CASE 
        WHEN f.ConsumidoresAtendidosAnual = 0 AND f.PracaMercado IN ('SP','RJ') THEN 'Operação Descontinuada'
        WHEN f.ConsumidoresAtendidosAnual IS NULL THEN 'N/A'
        ELSE CAST(f.ConsumidoresAtendidosAnual AS VARCHAR(30))
    END AS [Volume_Consumidores],
    CASE 
        WHEN f.PrecoComDescontoCupom = 0 AND f.PracaMercado IN ('SP','RJ') THEN '$0.00'
        WHEN f.PrecoComDescontoCupom IS NULL THEN 'N/A'
        ELSE '$' + CAST(f.PrecoComDescontoCupom AS VARCHAR(20))
    END AS [Preco_Final]
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
GO
