-- Adiciona colunas para a estimativa macroeconômica regional brasileira
ALTER TABLE Fato_Mercado_Saude ADD RegiaoBrasil VARCHAR(20) NULL;
ALTER TABLE Fato_Mercado_Saude ADD FaturamentoMercadoEstadoBRL DECIMAL(18,2) NULL;
GO
