
-- Inserindo dados nas dimensões
INSERT INTO Dim_Corporacao (NomeCorporacao, ModeloNegocio, TotalFarmaciasFisicas)
VALUES ('CVS Health', 'Varejo e Seguros', 9000);

INSERT INTO Dim_Corporacao (NomeCorporacao, ModeloNegocio, TotalFarmaciasFisicas)
VALUES ('UnitedHealth Group', 'Seguros e Servicos Medicos', 0);

INSERT INTO Dim_Medicamento (NomeMedicamento, TipoMedicamento, IndicacaoClinica, DosagemPadrao)
VALUES ('Atorvastatina', 'Generico Essencial', 'Colesterol e Cardíaco', '20mg');

INSERT INTO Dim_Medicamento (NomeMedicamento, TipoMedicamento, IndicacaoClinica, DosagemPadrao)
VALUES ('Ozempic', 'Marca Alto Custo', 'Diabetes e Emagrecimento', '2mg/3ml');

INSERT INTO Dim_CanalAcesso (DescricaoCanal) VALUES ('Consumidores Gerais / Varejo');
INSERT INTO Dim_CanalAcesso (DescricaoCanal) VALUES ('Membros de Seguro Core');
GO

-- Inserindo dados na tabela de fatos (Sintaxe compatível linha a linha)
INSERT INTO Fato_Mercado_Saude (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, DataRegistro)
VALUES (1, 1, 1, 185000000, NULL, 49.00, 6.10, '2026-10-15');

INSERT INTO Fato_Mercado_Saude (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, DataRegistro)
VALUES (1, 1, 2, NULL, 26000000, 49.00, NULL, '2026-10-15');

INSERT INTO Fato_Mercado_Saude (CorporacaoID, MedicamentoID, CanalAcessoID, ConsumidoresAtendidosAnual, MembrosSeguroCore, PrecoTabelaEstimado, PrecoComDescontoCupom, DataRegistro)
VALUES (1, 2, 1, 185000000, NULL, 1200.00, 199.00, '2026-10-15');
GO
