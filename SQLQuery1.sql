-- 1. CRIAÇÃO DAS DIMENSÕES (Tabelas de Atributos)

-- Dimensão de Empresas/Corporações do Setor (CVS, UnitedHealth, etc.)
CREATE TABLE Dim_Corporacao (
    CorporacaoID INT IDENTITY(1,1) CONSTRAINT PK_Dim_Corporacao PRIMARY KEY,
    NomeCorporacao VARCHAR(100) NOT NULL,
    ModeloNegocio VARCHAR(50) NOT NULL, -- 'Varejo e Seguros', 'Apenas Seguros', etc.
    TotalFarmaciasFisicas INT DEFAULT 0,
    DataAtualizacao DATETIME DEFAULT GETDATE()
);

-- Dimensão de Medicamentos
CREATE TABLE Dim_Medicamento (
    MedicamentoID INT IDENTITY(1,1) CONSTRAINT PK_Dim_Medicamento PRIMARY KEY,
    NomeMedicamento VARCHAR(150) NOT NULL,
    TipoMedicamento VARCHAR(50) NOT NULL, -- 'Generico Essencial', 'Marca Alto Custo'
    IndicacaoClinica VARCHAR(250) NULL,
    DosagemPadrao VARCHAR(50) NULL
);

-- Dimensão de Tipo de Canal/Acesso do Consumidor
CREATE TABLE Dim_CanalAcesso (
    CanalAcessoID INT IDENTITY(1,1) CONSTRAINT PK_Dim_CanalAcesso PRIMARY KEY,
    DescricaoCanal VARCHAR(100) NOT NULL -- 'Balcao Farmacia', 'Segurado Core', 'MinuteClinic'
);


-- 2. CRIAÇÃO DA TABELA DE FATOS (Métricas e Cruzamentos de Mercado)

CREATE TABLE Fato_Mercado_Saude (
    FatoID BIGINT IDENTITY(1,1) CONSTRAINT PK_Fato_Mercado_Saude PRIMARY KEY,
    CorporacaoID INT NOT NULL CONSTRAINT FK_Fato_Corp REFERENCES Dim_Corporacao(CorporacaoID),
    MedicamentoID INT NOT NULL CONSTRAINT FK_Fato_Med REFERENCES Dim_Medicamento(MedicamentoID),
    CanalAcessoID INT NOT NULL CONSTRAINT FK_Fato_Canal REFERENCES Dim_CanalAcesso(CanalAcessoID),
    
    -- Métricas de População e Alcance (Escopo do Mercado)
    ConsumidoresAtendidosAnual BIGINT NULL, -- Ex: 185.000.000 (CVS)
    MembrosSeguroCore BIGINT NULL,          -- Ex: 26.000.000 (Aetna)
    
    -- Métricas Financeiras e de Precificação
    PrecoTabelaEstimado DECIMAL(18,2) NULL,
    PrecoComDescontoCupom DECIMAL(18,2) NULL, -- Ex: Preço via GoodRx
    VolumePrescricoesAnual BIGINT NULL,
    
    DataRegistro DATE NOT NULL
);
GO


-- 3. OTIMIZAÇÃO DE PERFORMANCE (Índices Estratégicos)

-- Índice Columnstore Agrupado na Tabela de Fatos:
-- Essencial para BI, agregações rápidas (SUM, AVG) e leitura de milhões de linhas de mercado.
CREATE CLUSTERED COLUMNSTORE INDEX CCI_Fato_Mercado_Saude 
ON Fato_Mercado_Saude;

-- Índices Non-Clustered para buscas pontuais nas dimensões mais consultadas
CREATE NONCLUSTERED INDEX IX_Dim_Medicamento_Tipo 
ON Dim_Medicamento (TipoMedicamento) 
INCLUDE (NomeMedicamento);

CREATE NONCLUSTERED INDEX IX_Dim_Corporacao_Nome 
ON Dim_Corporacao (NomeCorporacao);
GO
