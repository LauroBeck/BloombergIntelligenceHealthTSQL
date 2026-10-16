SELECT 
    c.NomeCorporacao AS [Corporação],
    c.ModeloNegocio AS [Modelo de Negócio],
    m.NomeMedicamento AS [Medicamento],
    m.TipoMedicamento AS [Categoria],
    a.DescricaoCanal AS [Canal de Acesso],
    ISNULL(CAST(f.ConsumidoresAtendidosAnual AS VARCHAR(30)), 'N/A') AS [Consumidores Anuais (Varejo)],
    ISNULL(CAST(f.MembrosSeguroCore AS VARCHAR(30)), 'N/A') AS [Membros Seguro (Core)],
    ISNULL('$' + CAST(f.PrecoTabelaEstimado AS VARCHAR(20)), 'N/A') AS [Preço Tabela (USD)],
    ISNULL('$' + CAST(f.PrecoComDescontoCupom AS VARCHAR(20)), 'N/A') AS [Preço c/ Desconto (USD)],
    CONVERT(VARCHAR(10), f.DataRegistro, 103) AS [Data Registro]
FROM 
    Fato_Mercado_Saude f
INNER JOIN 
    Dim_Corporacao c ON f.CorporacaoID = c.CorporacaoID
INNER JOIN 
    Dim_Medicamento m ON f.MedicamentoID = m.MedicamentoID
INNER JOIN 
    Dim_CanalAcesso a ON f.CanalAcessoID = a.CanalAcessoID;
