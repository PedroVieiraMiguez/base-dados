CREATE TABLE Filial (
    filialID      INTEGER PRIMARY KEY,
    reponsavelID  INTEGER,
    CONSTRAINT    nn_Filial_ResponsavelID NOT NULL,
    localidade    VARCHAR(30),
    CONSTRAINT    nn_Filial_Localidade NOT NULL
);

CREATE TABLE Funcionario (
    funcionarioID  VARCHAR(30) PRIMARY KEY,
    filialID       INTEGER
        CONSTRAINT nn_Funcionario_FilialID NOT NULL,
    nome           VARCHAR(50)
        CONSTRAINT nn_Funcionario_Nome NOT NULL
);

CREATE TABLE FuncionarioSupervisor (
    funcionarioID  VARCHAR(30)
        CONSTRAINT uk_funcionarioID UNIQUE,
    supervisorID   VARCHAR(30),
    CONSTRAINT pk_FuncionarioSupervisor_funcionarioID_supervisorID PRIMARY KEY ( funcionarioID,
                                                                                 supervisorID )
);

CREATE TABLE Armazem (
    armazemID   VARCHAR(30) PRIMARY KEY,
    filialID    INTEGER
        CONSTRAINT nn_Armazem_FilialID NOT NULL,
    nrFax       INTEGER
        CONSTRAINT nn_Armazem_nrFax NOT NULL
        CONSTRAINT uk_Armazem_nrFax UNIQUE,
    email       VARCHAR(50)
        CONSTRAINT nn_Armazem_email NOT NULL
        CONSTRAINT uk_Armazem_email UNIQUE,
    nrTelefone  INTEGER
        CONSTRAINT nn_Armazem_nrTelefone NOT NULL
        CONSTRAINT uk_Armazem_nrTelefone UNIQUE
);

CREATE TABLE PostoAtendimento (
    postoAtendimentoID  VARCHAR(30) PRIMARY KEY,
    filialID            INTEGER
        CONSTRAINT nn_PostoAtendimento_FilialID NOT NULL,
    skypeID             VARCHAR(30)
        CONSTRAINT nn_PostoAtendimento_skypeID NOT NULL
        CONSTRAINT uk_PostoAtendimento_skypeID UNIQUE,
    email               VARCHAR(50)
        CONSTRAINT nn_PostoAtendimento_email NOT NULL
        CONSTRAINT uk_PostoAtendimento_email UNIQUE,
    nrTelefone          INTEGER
        CONSTRAINT nn_PostoAtendimento_nrTelefone NOT NULL
        CONSTRAINT uk_PostoAtendimento_nrTelefone UNIQUE,
    maxClientes         INTEGER
        CONSTRAINT nn_PostoAtendimento_maxClientes NOT NULL
        CONSTRAINT ck_PostoAtendimento_maxClientes CHECK ( maxViagensSemana > - 1 )
);

CREATE TABLE Viatura (
    matricula         VARCHAR(10) PRIMARY KEY,
    maxViagensSemana  INTEGER
        CONSTRAINT nn_Viatura_maxViagensSemana NOT NULL
        CONSTRAINT ck_Viatura_maxViagensSemana CHECK ( maxViagensSemana > - 1 ),
    tipoViaturaID     INTEGER
        CONSTRAINT nn_Viatura_TipoViaturaID NOT NULL
);

CREATE TABLE TipoViatura (
    tipoViaturaID  INTEGER PRIMARY KEY,
    designacao     VARCHAR(50)
        CONSTRAINT nn_TipoViatura_Designacao NOT NULL
        CONSTRAINT uk_TipoViatura_Designacao UNIQUE,
    pesoMaximo     FLOAT
        CONSTRAINT nn_TipoViatura_PesoMaximo NOT NULL
);

CREATE TABLE ArmazemViatura (
    matricula  VARCHAR(30),
    armazemID  VARCHAR(30),
    CONSTRAINT pk_ArmazemViatura PRIMARY KEY ( matricula,
                                               armazemID )
);

CREATE TABLE Transporte (
    transporteID  VARCHAR(30) PRIMARY KEY,
    dataInicio    DATE NOT NULL CHECK ( dataInicio <= TO_DATE('01 / 01 / 2020', 'dd/mm/yyyy') ),
    dataChegada   DATE CHECK ( dataChegada >= dataInicio )
);

CREATE TABLE Encomenda (
    encomendaID    VARCHAR(30) PRIMARY KEY,
    dataEncomenda  DATE NOT NULL CHECK ( dataEncomenda <= TO_DATE('01 / 01 / 2020', 'dd/mm/yyyy') )
);

create table TransporteEncomenda (
    transporteID  VARCHAR(30),
    encomendaID    VARCHAR(30),
    CONSTRAINT pk_TransporteEncomenda PRIMARY KEY ( transporteID,
                                               encomendaID )
);

create table ArmazemEncomenda (
    armazemID  VARCHAR(30),
    encomendaId varchar(30),
    CONSTRAINT pk_ArmazemEncomenda PRIMARY KEY ( armazemID,
                                               encomendaID )
);

CREATE TABLE Produto (
    produtoID     VARCHAR(30) PRIMARY KEY,
    nome          VARCHAR(30) NOT NULL,
    altura        FLOAT NOT NULL CHECK ( altura > 0 ),
    profundidade  FLOAT NOT NULL CHECK ( profundidade > 0 ),
    largura       FLOAT NOT NULL CHECK ( largura > 0 ),
    peso          FLOAT NOT NULL CHECK ( peso > 0 )
);

create table EncomendaProduto (
    encomendaID    VARCHAR(30),
    produtoID varchar(30),
    CONSTRAINT pk_EncomendaProduto_encomendaID_produtoID PRIMARY KEY (encomendaID, produtoID)
);

CREATE TABLE Cliente (
    clienteID           VARCHAR(30) PRIMARY KEY,
    tipoCliente         VARCHAR(30) NOT NULL,
    estadoCliente       VARCHAR(30) NOT NULL,
    NIF                 INTEGER UNIQUE NOT NULL,
    nome                VARCHAR(30) NOT NULL,
    genero              VARCHAR(1) CHECK ( genero IN ( 'm', 'f' ) ),
    postoAtendimentoID  VARCHAR(30) NOT NULL
);

ALTER TABLE Filial
    ADD CONSTRAINT fk_Filial_ResponsavelID FOREIGN KEY ( responsavelID )
        REFERENCES Funcionario ( funcionarioID );

ALTER TABLE Cliente
    ADD CONSTRAINT fk_Cliente_PostoAtendimento_ID FOREIGN KEY ( postoAtendimentoID )
        REFERENCES PostoAtendimento ( postoAtendimentoID );

ALTER TABLE Armazem
    ADD CONSTRAINT fk_Armazem_FilialID FOREIGN KEY ( filialID )
        REFERENCES Filial ( filialID );

ALTER TABLE Funcionario
    ADD CONSTRAINT fk_Funcionario_FilialID FOREIGN KEY ( filialID )
        REFERENCES Filial ( filialID );

ALTER TABLE FuncionarioSupervisor
    ADD CONSTRAINT fk_FuncionarioSupervisor_funcionarioID_supervisorID FOREIGN KEY ( funcionarioID,
                                                                                     supervisorID )
        REFERENCES Funcionario ( funcionarioID );
        
ALTER TABLE EncomendaProduto
    ADD CONSTRAINT fk_EncomendaProduto_encomendaID FOREIGN KEY ( encomendaID )
        REFERENCES Encomenda ( encomendaID );
        
ALTER TABLE EncomendaProduto
    ADD CONSTRAINT fk_EncomendaProduto_produtoID FOREIGN KEY ( produtoID )
        REFERENCES Produto ( produtoID );

ALTER TABLE PostoAtendimento
    ADD CONSTRAINT fk_PostoAtendimento_FilialID FOREIGN KEY ( filialID )
        REFERENCES Filial ( filialID );

ALTER TABLE ArmazemViatura
    ADD CONSTRAINT fk_ArmazemViatura_ArmazemID FOREIGN KEY ( armazemID )
        REFERENCES Armazem ( armazemID );

ALTER TABLE ArmazemViatura
    ADD CONSTRAINT fk_ArmazemViatura_Matricula FOREIGN KEY ( matricula )
        REFERENCES Viatura ( matricula );

ALTER TABLE Viatura
    ADD CONSTRAINT fk_Viatura_TipoViaturaID FOREIGN KEY ( tipoViaturaID )
        REFERENCES TipoViatura ( tipoViaturaID );