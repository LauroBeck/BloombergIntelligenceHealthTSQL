-- Região Sudeste (Motores Principais do Faturamento)
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 3, 'SP', 'Sudeste', 35.50, 28500000000.00, '2026-10-15');

INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 4, 'RJ', 'Sudeste', 28.00, 14200000000.00, '2026-10-15');

INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 1, 'MG', 'Sudeste', 22.40, 11800000000.00, '2026-10-15');

-- Região Centro-Oeste
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 1, 'GO', 'Centro-Oeste', 18.20, 4100000000.00, '2026-10-15');

-- CORRIGIDO: Remoção do indicador "-->" que causava a quebra de sintaxe
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 1, 'MT', 'Centro-Oeste', 14.50, 2900000000.00, '2026-10-15');

-- Região Nordeste
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 1, 'BA', 'Nordeste', 19.80, 6800000000.00, '2026-10-15');

INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 1, 'CE', 'Nordeste', 16.10, 3900000000.00, '2026-10-15');

-- Região Sul
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, PracaMercado, RegiaoBrasil, MarketSharePct, FaturamentoMercadoEstadoBRL, DataRegistro)
VALUES (3, 1, 1, 'RS', 'Sul', 24.00, 7800000000.00, '2026-10-15');
GO
