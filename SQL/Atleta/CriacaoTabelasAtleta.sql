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

CREATE TABLE Genero (
    tipoGenero CHAR(1) PRIMARY KEY
        CONSTRAINT ck_Genero_tipoGenero CHECK ( upper(tipoGenero) IN ( 'M', 'F' ) )
);

CREATE TABLE Actividade (
    actividadeID  INTEGER PRIMARY KEY,
    designacao    VARCHAR(30)
        CONSTRAINT nn_Actividade_designacao NOT NULL
);

CREATE TABLE ValoresRefFCM (
    tipoGenero    CHAR(1),
    actividadeID  INTEGER,
    valorFixo1    FLOAT
        CONSTRAINT nn_ValoresRefCFCM_valorFixo1 NOT NULL,
    valorfixo2    FLOAT
        CONSTRAINT nn_ValoresRefCFCM_valorFixo2 NOT NULL,
    CONSTRAINT pk_ValoresRefFCM_tipoGenero_actividadeID PRIMARY KEY ( tipoGenero,
                                                                      actividadeID )
);

CREATE TABLE TipoAtleta (
    tipoAtletaID  INTEGER PRIMARY KEY,
    descricao     VARCHAR(30),
    constraint    nn_TipoAtleta_Descricao NOT NULL
);

CREATE TABLE ValorParcelaFixa (
    valorParcelaFixaID  INTEGER PRIMARY KEY,
    tipoAtletaID        INTEGER,
    valorParcela        FLOAT
        CONSTRAINT nn_ValorParcelaFixa_valorParcela NOT NULL
        CONSTRAINT ck_ValorParcelaFixa_valorParcela CHECK ( valorParcela > - 1 )
);

CREATE TABLE Pagamento (
    pagamentoID    INTEGER PRIMARY KEY,
    dataPagamento  DATE
        CONSTRAINT nn_Pagamento_dataPagamento NOT NULL
        CONSTRAINT ck_Pagamento_dataPagamento CHECK ( dataPagamento >= TO_DATE('01/01/1950', 'dd/mm/yyyy') ),
    clubeID        INTEGER
        CONSTRAINT nn_clubeID NOT NULL,
    numSocio       INTEGER
        CONSTRAINT nn_numSocio NOT NULL,
    parcela1       FLOAT
        CONSTRAINT nn_Pagamento_valorParcela1 NOT NULL
        CONSTRAINT ck_Pagamento_valorParcela1 CHECK ( valorParcela1 > - 1 ),
    parcela2       FLOAT
        CONSTRAINT nn_Pagamento_valorParcela2 NOT NULL
        CONSTRAINT ck_Pagamento_valorParcela2 CHECK ( valorParcela2 > - 1 ),
    valorTotal     FLOAT
        CONSTRAINT nn_Pagamento_valorTotal NOT NULL
        CONSTRAINT ck_Pagamento_valorTotal CHECK ( valorTotal > - 1 )
);

ALTER TABLE Atleta
    ADD CONSTRAINT fk_Atleta_clubeID FOREIGN KEY ( clubeID )
        REFERENCES ClubeDesportivo ( clubeID );

ALTER TABLE Atleta
    ADD CONSTRAINT fk_Atleta_Actividade FOREIGN KEY ( actividade )
        REFERENCES Actividade ( actividadeID );

ALTER TABLE Atleta
    ADD CONSTRAINT fk_Atleta_genero FOREIGN KEY ( tipoGenero )
        REFERENCES Genero ( tipoGenero );

ALTER TABLE Atleta
    ADD CONSTRAINT fk_Atleta_tipoAtletaID FOREIGN KEY ( tipoAtletaID )
        REFERENCES TipoAtleta ( TipoAtletaID );

ALTER TABLE NaoProfissional
    ADD CONSTRAINT fk_NaoProfissional_numSocio_clubeID FOREIGN KEY ( numSocio,
                                                                     clubeID )
        REFERENCES Atleta ( numSocio,
                            clubeID );

ALTER TABLE Profissional
    ADD CONSTRAINT fk_Profissional_numSocio_clubeID FOREIGN KEY ( numSocio,
                                                                  clubeID )
        REFERENCES Atleta ( numSocio,
                            clubeID );

ALTER TABLE Amador
    ADD CONSTRAINT fk_Amador_numSocio_clubeID FOREIGN KEY ( numSocio,
                                                            clubeID )
        REFERENCES Atleta ( numSocio,
                            clubeID );

ALTER TABLE SemiProfissional
    ADD CONSTRAINT fk_SemiProfissional_numSocio_clubeID FOREIGN KEY ( numSocio,
                                                                      clubeID )
        REFERENCES Atleta ( numSocio,
                            clubeID );

ALTER TABLE Inscricao
    ADD CONSTRAINT fk_Inscricao_numSocio FOREIGN KEY ( numSocio )
        REFERENCES Atleta ( numSocio );

ALTER TABLE Inscricao
    ADD CONSTRAINT fk_Inscricao_competicaoID FOREIGN KEY ( competicaoID )
        REFERENCES Competicao ( competicaoID );

ALTER TABLE Pagamento
    ADD CONSTRAINT fk_Pagamento_numSocio_clubeID FOREIGN KEY ( numSocio,
                                                               clubeID )
        REFERENCES Atleta ( numSocio,
                            clubeID );

ALTER TABLE ValorParcelaFixa
    ADD CONSTRAINT fk_ValorParcelaFixa_tipoAtletaID FOREIGN KEY ( tipoAtletaID )
        REFERENCES TipoAtleta ( tipoAtletaID );

ALTER TABLE ValoresRefFCM
    ADD CONSTRAINT fk_ValoresRefFCM_actividadeID FOREIGN KEY ( actividadeID )
        REFERENCES Actividade ( actividadeID );

ALTER TABLE ValoresRefFCM
    ADD CONSTRAINT fk_ValoresRefFCM_tipoGenero FOREIGN KEY ( tipoGenero )
        REFERENCES Genero ( tipoGenero );

ALTER TABLE Genero
    ADD CONSTRAINT fk_Genero_numSocio FOREIGN KEY ( numSocio )
        REFERENCES Atleta ( numSocio );

ALTER TABLE Premio
    ADD CONSTRAINT fk_Premio_CompeticaoID FOREIGN KEY ( competicaoID )
        REFERENCES Competicao ( competicaoID );
        
ALTER TABLE Premio
    ADD CONSTRAINT fk_Premio_numSocio FOREIGN KEY ( numSocio )
        REFERENCES Atleta ( numSocio );