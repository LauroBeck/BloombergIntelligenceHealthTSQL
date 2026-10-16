SELECT 
    h.AnoEvento AS [Ano],
    c.NomeCorporacao AS [Corporacao],
    h.FaseOperação AS [Fase],
    h.TituloEvento AS [Evento_Chave],
    f.PracaMercado AS [Praca_Mapeada],
    ISNULL(CAST(f.MarketSharePct AS VARCHAR(10)) + '%', '0.00%') AS [Market_Share_Momento],
    h.DescricaoDetalhada AS [Historico_Operacao]
FROM 
    Histórico_Eventos_Corporativos h
INNER JOIN 
    Dim_Corporacao c ON h.CorporacaoID = c.CorporacaoID
LEFT JOIN 
    Fato_Mercado_Saude f ON f.CorporacaoID = c.CorporacaoID AND f.PracaMercado IN ('SP', 'RJ')
GROUP BY 
    h.AnoEvento, c.NomeCorporacao, h.FaseOperação, h.TituloEvento, f.PracaMercado, f.MarketSharePct, h.DescricaoDetalhada
ORDER BY 
    h.AnoEvento ASC, f.PracaMercado DESC;
