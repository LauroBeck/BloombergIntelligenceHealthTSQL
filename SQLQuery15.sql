SELECT 
    f.PracaMercado AS [Praca],
    c.NomeCorporacao AS [Corporacao_Atual],
    m.NomeMedicamento AS [Medicamento],
    a.DescricaoCanal AS [Canal_Operacao],
    CASE 
        WHEN c.NomeCorporacao LIKE '%CVS%' THEN 'Saiu do Mercado (0% Share)'
        ELSE 'Assumiu Operação (Sucesso Onofre)'
    END AS [Status_Transicao],
    ISNULL(CAST(f.MarketSharePct AS VARCHAR(10)) + '%', 'N/A') AS [Market_Share_Transicao]
FROM 
    Fato_Mercado_Saude f
INNER JOIN 
    Dim_Corporacao c ON f.CorporacaoID = c.CorporacaoID
INNER JOIN 
    Dim_Medicamento m ON f.MedicamentoID = m.MedicamentoID
INNER JOIN 
    Dim_CanalAcesso a ON f.CanalAcessoID = a.CanalAcessoID
WHERE 
    f.PracaMercado IN ('SP', 'RJ', 'US')
GROUP BY 
    f.PracaMercado, c.NomeCorporacao, m.NomeMedicamento, a.DescricaoCanal, f.MarketSharePct
ORDER BY 
    f.PracaMercado DESC, f.MarketSharePct DESC;
