-- =========================================================================
-- 1. POPULANDO OS NOVOS CANAIS HISTÓRICOS DO BRASIL (LINHA POR LINHA)
-- =========================================================================

INSERT INTO Dim_CanalAcesso (DescricaoCanal) 
VALUES ('Varejo Físico - SP (Drogaria Onofre)');

INSERT INTO Dim_CanalAcesso (DescricaoCanal) 
VALUES ('Varejo Físico - RJ (Drogaria Onofre)');
GO


-- =========================================================================
-- 2. POPULANDO A TABELA DE FATOS HISTÓRICOS (LINHA POR LINHA)
-- =========================================================================

-- Linha 1: Operação Histórica SP (Encerrada/Vendida)
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, PracaMercado, DataRegistro)
VALUES 
    (1, 1, 3, 0, NULL, 0.00, 0.00, 'SP', '2019-04-30');

-- Linha 2: Operação Histórica RJ (Encerrada/Vendida)
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, PracaMercado, DataRegistro)
VALUES 
    (1, 1, 4, 0, NULL, 0.00, 0.00, 'RJ', '2019-04-30');
GO
