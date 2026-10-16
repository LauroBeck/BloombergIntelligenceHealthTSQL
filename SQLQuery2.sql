-- =========================================================================
-- 1. CRIAÇÃO DAS TABELAS DE DIMENSÃO
-- =========================================================================

CREATE TABLE Dim_Corporacao (
    CorporacaoID INT IDENTITY(1,1) NOT NULL,
    NomeCorporacao VARCHAR(100) NOT NULL,
    ModeloNegocio VARCHAR(50) NOT NULL, 
    TotalFarmaciasFisicas INT NOT NULL DEFAULT 0,
    DataAtualizacao DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_Dim_Corporacao PRIMARY KEY CLUSTERED (CorporacaoID)
);

CREATE TABLE Dim_Medicamento (
    MedicamentoID INT IDENTITY(1,1) NOT NULL,
    NomeMedicamento VARCHAR(150) NOT NULL,
    TipoMedicamento VARCHAR(50) NOT NULL, 
    IndicacaoClinica VARCHAR(250) NULL,
    DosagemPadrao VARCHAR(50) NULL,
    CONSTRAINT PK_Dim_Medicamento PRIMARY KEY CLUSTERED (MedicamentoID)
);

CREATE TABLE Dim_CanalAcesso (
    CanalAcessoID INT IDENTITY(1,1) NOT NULL,
    DescricaoCanal VARCHAR(100) NOT NULL, 
    CONSTRAINT PK_Dim_CanalAcesso PRIMARY KEY CLUSTERED (CanalAcessoID)
);
GO

-- =========================================================================
-- 2. CRIAÇÃO DA TABELA DE FATOS
-- =========================================================================

CREATE TABLE Fato_Mercado_Saude (
    FatoID BIGINT IDENTITY(1,1) NOT NULL,
    CorporacaoID INT NOT NULL,
    MedicamentoID INT NOT NULL,
    CanalAcessoID INT NOT NULL,
    
    -- Métricas populacionais em BIGINT (Essencial para contagens acima de 2 bilhões)
    ConsumidoresAtendidosAnual BIGINT NULL, 
    MembrosSeguroCore BIGINT NULL,          
    
    -- Valores monetários exatos
    PrecoTabelaEstimado DECIMAL(18,2) NULL,
    PrecoComDescontoCupom DECIMAL(18,2) NULL, 
    VolumePrescricoesAnual BIGINT NULL,
    
    DataRegistro DATETIME NOT NULL,
    CONSTRAINT PK_Fato_Mercado_Saude PRIMARY KEY CLUSTERED (FatoID)
);
GO

-- =========================================================================
-- 3. CRIAÇÃO DAS CHAVES ESTRANGEIRAS (FOREIGN KEYS)
-- =========================================================================

ALTER TABLE Fato_Mercado_Saude WITH CHECK 
ADD CONSTRAINT FK_Fato_Corporacao FOREIGN KEY (CorporacaoID)
REFERENCES Dim_Corporacao (CorporacaoID);

ALTER TABLE Fato_Mercado_Saude WITH CHECK 
ADD CONSTRAINT FK_Fato_Medicamento FOREIGN KEY (MedicamentoID)
REFERENCES Dim_Medicamento (MedicamentoID);

ALTER TABLE Fato_Mercado_Saude WITH CHECK 
ADD CONSTRAINT FK_Fato_CanalAcesso FOREIGN KEY (CanalAcessoID)
REFERENCES Dim_CanalAcesso (CanalAcessoID);
GO

-- =========================================================================
-- 4. OTIMIZAÇÃO DE PERFORMANCE (Índices Não-Clusterizados para 2005/2008)
-- =========================================================================

-- Índices nas chaves estrangeiras da tabela de fatos para acelerar consultas com JOIN
CREATE NONCLUSTERED INDEX IX_Fato_BuscaGeral 
ON Fato_Mercado_Saude (CorporacaoID, MedicamentoID, CanalAcessoID);

-- No SQL Server 2005/2008, o uso da cláusula INCLUDE melhora a performance de cobertura de índice
CREATE NONCLUSTERED INDEX IX_Dim_Medicamento_Busca 
ON Dim_Medicamento (TipoMedicamento) 
INCLUDE (NomeMedicamento);
GO
