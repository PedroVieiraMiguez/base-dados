CREATE TABLE Atleta (
    numSocio           INTEGER,
    clubeID            INTEGER,
    nome               VARCHAR(30)
        CONSTRAINT nn_Atleta_Nome NOT NULL,
    tipoGenero         CHAR(1)
        CONSTRAINT nn_Atleta_TipoGenero NOT NULL,
    numIdCivil         INTEGER
        CONSTRAINT nn_Atleta_numIdCivil NOT NULL,
    dataNascimento     DATE
        CONSTRAINT nn_Atleta_dataNascimento NOT NULL
        CONSTRAINT ck_Atleta_DataNascimento CHECK ( dataNascimento >= TO_DATE('01/01/1950', 'dd/mm/yyyy') ),
    dataInscricao      DATE
        CONSTRAINT ck_Atleta_DataInscricao CHECK ( dataInscricao >= TO_DATE('01/01/1990', 'dd/mm/yyyy') ),
    freqCardRepouso    FLOAT,
    actividadeID       INTEGER,
    tipoAtletaID       INTEGER,
    objectivoTreinoID  INTEGER,
    CONSTRAINT pk_Atleta_numSocio_clubeID PRIMARY KEY ( numSocio,
                                                        clubeID )
);

CREATE TABLE NaoProfissional (
    numSocio  INTEGER,
    clubeID   INTEGER,
    CONSTRAINT pk_NaoProfissional_numSocio_clubeID PRIMARY KEY ( numSocio,
                                                                 clubeID )
);

CREATE TABLE Profissional (
    numSocio         INTEGER,
    clubeID          INTEGER,
    parcelaFixa      FLOAT,
    parcelaVariavel  FLOAT,
    CONSTRAINT pk_Profissional_numSocio_clubeID PRIMARY KEY ( numSocio,
                                                              clubeID )
);

CREATE TABLE SemiProfissional (
    numSocio            INTEGER,
    clubeID             INTEGER,
    parcelaFixa         FLOAT,
    valorParcelaFixaID  FLOAT,
    CONSTRAINT pk_SemiProfissional_numSocio_clubeID PRIMARY KEY ( numSocio,
                                                                  clubeID )
);

CREATE TABLE Amador (
    numSocio         INTEGER,
    clubeID          INTEGER,
    parcelaFixa      FLOAT,
    parcelaVariavel  FLOAT,
    CONSTRAINT pk_Amador_numSocio_clubeID PRIMARY KEY ( numSocio,
                                                        clubeID )
);

CREATE TABLE ClubeDesportivo (
    clubeID       INTEGER PRIMARY KEY,
    nome          VARCHAR(50),
    dataFundacao  DATE
);

CREATE TABLE Antiguidade (
    antiguidadeID  INTEGER PRIMARY KEY,
    valorMin       INTEGER,
    valorMax       INTEGER,
    percentagem    FLOAT
);

CREATE TABLE ObjectivoTreino (
    objectivoTreinoID  INTEGER PRIMARY KEY,
    descricao          VARCHAR(40),
    valorFCT           FLOAT
);

CREATE TABLE Inscricao (
    competicaoID  INTEGER,
    numSocio      INTEGER,
    CONSTRAINT pk_Inscricao_competicaoID_numSocio PRIMARY KEY ( competicaoID,
                                                                numSocio )
);

CREATE TABLE Competicao (
    competicaoID  INTEGER,
    actividadeID  INTEGER,
    dataInicial   DATE,
    dataFinal     DATE
);

CREATE TABLE Premio (
    premioID        INTEGER,
    valor           NUMERIC,
    qualificacao    INTEGER,
    dataAtribuicao  DATE,
    competicaoID    INTEGER,
    numSocio        INTEGER
);

CREATE TABLE Genero ( tipoGenero char(1) primary key add constraint check(upper(tipoGenero) IN('M', 'F'));

