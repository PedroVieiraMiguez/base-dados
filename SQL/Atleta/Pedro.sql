CREATE TABLE Atleta (
    numSocio           INTEGER,
    clubeID            INTEGER,
    nome               VARCHAR(30),
    generoID           INTEGER,
    numIdCivil         INTEGER,
    dataNascimento     DATE,
    dataInscricao      DATE,
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
    valor              FLOAT
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