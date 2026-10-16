-- Inserindo os novos canais de acesso históricos do mercado brasileiro
INSERT INTO Dim_CanalAcesso (DescricaoCanal) 
VALUES ('Varejo Físico - SP (Drogaria Onofre)'),
       ('Varejo Físico - RJ (Drogaria Onofre)');
GO

-- Inserindo os fatos históricos de fechamento/fusão de mercado de 2013-2019
-- (Valores zerados ou N/A após 2019 refletem o encerramento da operação)
INSERT INTO Fato_Mercado_Saude 
    (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, PracaMercado, DataRegistro)
VALUES 
    -- Operação Histórica SP (Encerrada/Vendida)
    (1, 1, 3, 0, NULL, 0.00, 0.00, 'SP', '2019-04-30'),
    -- Operação Histórica RJ (Encerrada/Vendida)
    (1, 1, 4, 0, NULL, 0.00, 0.00, 'RJ', '2019-04-30');
GO
