CREATE TABLE Filial (
    filialID      INTEGER PRIMARY KEY,
    reponsavelID  INTEGER,
    CONSTRAINT    nn_Filial_ResponsavelID NOT NULL,
    localidade    VARCHAR(30),
    CONSTRAINT    nn_Filial_Localidade NOT NULL
);

CREATE TABLE Armazem (
    armazemID  VARCHAR(30) PRIMARY KEY,
    filialID   INTEGER
        CONSTRAINT nn_Armazem_FilialID NOT NULL,
    nrFax      INTEGER
        CONSTRAINT nn_Armazem_nrFax NOT NULL
        CONSTRAINT uk_Armazem_nrFax UNIQUE,
    email    VARCHAR(50)
        CONSTRAINT nn_Armazem_email NOT NULL
        CONSTRAINT uk_Armazem_email UNIQUE,
    nrTelefone INTEGER 
        CONSTRAINT nn_Armazem_nrTelefone NOT NULL
        CONSTRAINT uk_Armazem_nrTelefone UNIQUE
);

CREATE TABLE Viatura (
    matricula  VARCHAR(10) PRIMARY KEY,
    maxViagensSemana      INTEGER
        CONSTRAINT nn_Viatura_maxViagensSemana NOT NULL
        CONSTRAINT ck_Viatura_maxViagensSemana check ( maxViagensSemana > -1),
    tipoViaturaID INTEGER
        constraint nn_Viatura_TipoViaturaID NOT NULL
);

create table TipoViatura (
    tipoViaturaID INTEGER PRIMARY KEY,
    designacao VARCHAR(50)
        constraint nn_TipoViatura_Designacao NOT NULL
        constraint uk_TipoViatura_Designacao UNIQUE,
    pesoMaximo FLOAT
        constraint nn_TipoViatura_PesoMaximo NOT NULL
);

create table ArmazemViatura (
    matricula VARCHAR(30),
    armazemID VARCHAR(30),
    CONSTRAINT pk_ArmazemViatura PRIMARY KEY ( matricula, armazemID)
);

ALTER TABLE Filial
    ADD CONSTRAINT fk_Filial_ResponsavelID FOREIGN KEY ( responsavelID )
        REFERENCES Funcionario ( funcionarioID );
        
ALTER TABLE Armazem
    ADD CONSTRAINT fk_Armazem_FilialID FOREIGN KEY ( filialID )
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