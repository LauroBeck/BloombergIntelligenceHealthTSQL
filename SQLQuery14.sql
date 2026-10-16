-- Inserir a nova Corporação adquirente
INSERT INTO Dim_Corporacao (NomeCorporacao, ModeloNegocio, TotalFarmaciasFisicas, StatusMercadoBR, RegiaoOrigem)
VALUES ('Raia Drogasil (RD Saúde)', 'Varejo Farmacêutico', 3000, 'Líder de Mercado Ativo', 'Brasil');
GO

-- Registrando o Market Share de Transição de SP (CVS Onofre -> Droga Raia) em 2019
-- Linha 1: Droga Raia assumindo a fatia de mercado ativa em SP
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, PracaMercado, DataRegistro, MarketSharePct)
VALUES 
    (3, 1, 3, 45000000, NULL, 40.00, 12.50, 'SP', '2019-05-01', 35.50);

-- Linha 2: Droga Raia assumindo a fatia de mercado ativa no RJ
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, PracaMercado, DataRegistro, MarketSharePct)
VALUES 
    (3, 1, 4, 25000000, NULL, 42.00, 14.00, 'RJ', '2019-05-01', 28.00);

-- Atualiza os registros antigos da CVS no Brasil para explicitar que o Market Share foi para 0.00% pós-2019
UPDATE Fato_Mercado_Saude SET MarketSharePct = 0.00 WHERE CorporacaoID = 1 AND PracaMercado IN ('SP', 'RJ');
GO
