-- Linha 1: Registro oficial do marco de Entrada (2013)
INSERT INTO Histórico_Eventos_Corporativos 
    (CorporacaoID, AnoEvento, FaseOperação, TituloEvento, DescricaoDetalhada, PracaAfetada)
VALUES 
    (1, 2013, 'Entrada', 'Aquisição da Drogaria Onofre', 'A CVS Health entrou no Brasil ao adquirir 100% da tradicional rede brasileira Drogaria Onofre, que possuía forte presença com dezenas de lojas físicas em São Paulo e unidades no Rio de Janeiro.', 'SP/RJ');

-- Linha 2: Registro oficial do marco de Saída e Transição (2019)
INSERT INTO Histórico_Eventos_Corporativos 
    (CorporacaoID, AnoEvento, FaseOperação, TituloEvento, DescricaoDetalhada, PracaAfetada)
VALUES 
    (1, 2019, 'Saída', 'Venda para Raia Drogasil', 'Após reestruturação estratégica, a CVS Health vende integralmente as operações da Onofre para a Raia Drogasil, transferindo o market share e encerrando suas atividades físicas no Brasil.', 'SP/RJ');
GO
