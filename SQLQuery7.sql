-- 1. Modificar a Dimensão de Corporações para incluir a saída do mercado brasileiro
ALTER TABLE Dim_Corporacao ADD StatusMercadoBR VARCHAR(30) NULL;
ALTER TABLE Dim_Corporacao ADD RegiaoOrigem VARCHAR(50) NULL;
GO

-- Atualiza os metadados históricos da CVS e UnitedHealth
UPDATE Dim_Corporacao 
SET StatusMercadoBR = 'Encerrado (Vendido em 2019)', RegiaoOrigem = 'Estados Unidos'
WHERE NomeCorporacao = 'CVS Health';

UPDATE Dim_Corporacao 
SET StatusMercadoBR = 'Operação Indireta/Limitada', RegiaoOrigem = 'Estados Unidos'
WHERE NomeCorporacao = 'UnitedHealth Group';
GO

-- 2. Modificar a Tabela de Fatos para suportar segmentação por praça/localidade (SP, RJ, US)
ALTER TABLE Fato_Mercado_Saude ADD PracaMercado VARCHAR(10) NULL;
GO

-- Atualiza os registros existentes mapeando-os para o mercado original (US)
UPDATE Fato_Mercado_Saude SET PracaMercado = 'US' WHERE PracaMercado IS NULL;
GO
