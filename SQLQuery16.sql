
-- Criando a tabela para armazenar marcos históricos e eventos de M&A (Fusões e Aquisições)
CREATE TABLE Histórico_Eventos_Corporativos (
    EventoID INT IDENTITY(1,1) NOT NULL,
    CorporacaoID INT NOT NULL,
    AnoEvento INT NOT NULL,
    FaseOperação VARCHAR(30) NOT NULL, -- 'Entrada', 'Saída', 'Fusão'
    TituloEvento VARCHAR(100) NOT NULL,
    DescricaoDetalhada VARCHAR(500) NOT NULL,
    PracaAfetada VARCHAR(50) NOT NULL, -- 'SP/RJ', 'US', etc.
    CONSTRAINT PK_Historico_Eventos PRIMARY KEY CLUSTERED (EventoID)
);
GO

-- Adicionando a chave estrangeira para manter a integridade referencial
ALTER TABLE Histórico_Eventos_Corporativos WITH CHECK
ADD CONSTRAINT FK_Eventos_Corporacao FOREIGN KEY (CorporacaoID)
REFERENCES Dim_Corporacao (CorporacaoID);
GO
