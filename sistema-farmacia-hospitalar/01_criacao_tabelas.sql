-- Criação da tabela de Pacientes
CREATE TABLE Paciente (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nome_completo VARCHAR(100) NOT NULL,
    numero_leito VARCHAR(20) NOT NULL,
    data_internacao DATE NOT NULL
);

-- Criação da tabela de Medicamentos
CREATE TABLE Medicamento (
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nome_comercial VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(100) NOT NULL,
    dosagem VARCHAR(50) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_validade DATE NOT NULL
);

-- Criação da tabela de Prescrições
CREATE TABLE Prescricao (
    id_prescricao INT IDENTITY(1,1) PRIMARY KEY,
    id_paciente INT NOT NULL,
    data_prescricao DATE NOT NULL,
    observacoes VARCHAR(255),
    CONSTRAINT FK_Prescricao_Paciente FOREIGN KEY (id_paciente) 
        REFERENCES Paciente(id_paciente)
);

-- Criação da tabela de Dispensação
CREATE TABLE Dispensacao (
    id_dispensacao INT IDENTITY(1,1) PRIMARY KEY,
    id_prescricao INT NOT NULL,
    id_medicamento INT NOT NULL,
    quantidade_dispensada INT NOT NULL,
    data_hora_dispensacao DATETIME NOT NULL,
    CONSTRAINT FK_Dispensacao_Prescricao FOREIGN KEY (id_prescricao) 
        REFERENCES Prescricao(id_prescricao),
    CONSTRAINT FK_Dispensacao_Medicamento FOREIGN KEY (id_medicamento) 
        REFERENCES Medicamento(id_medicamento)
);
