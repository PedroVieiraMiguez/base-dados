CREATE TABLE Jornal (
    idJornal      INTEGER PRIMARY KEY,
    idMorada      NUMERIC,
    dataFundacao  VARCHAR(30),
    designacao    DATE
);

CREATE TABLE Morada (
    idMorada        NUMERIC PRIMARY KEY,
    nrCodigoPostal  VARCHAR(8),
    rua             VARCHAR(50),
    nrPorta         INTEGER
);

CREATE TABLE PontoVenda (
    idPontoVenda  INTEGER PRIMARY KEY,
    idMorada      NUMERIC
);

CREATE TABLE Compra (
    idCompra      INTEGER PRIMARY KEY,
    nrEdicao      INTEGER,
    idJornal      INTEGER,
    idPontoVenda  INTEGER,
    nrCliente     INTEGER
);

CREATE TABLE Cliente (
    nrCliente  INTEGER PRIMARY KEY,
    idPessoa   INTEGER
);

CREATE TABLE Pessoa (
    idPessoa        INTEGER PRIMARY KEY,
    nome            VARCHAR(50),
    dataNascimento  DATE
);

CREATE TABLE Noticia (
    idNoticia  INTEGER,
    nrEdicao   INTEGER,
    idJornal   INTEGER,
    CONSTRAINT pk_Noticia_idNoticia_nrEdicao_idJornal PRIMARY KEY ( nrEdicao,
                                                                    idJornal,
                                                                    idNoticia )
);

CREATE TABLE CodigoPostal (
    nrCodigoPostal  VARCHAR(8) PRIMARY KEY,
    localidade      VARCHAR(30)
);

CREATE TABLE NoticiaJornalista (
    idNoticia  INTEGER,
    nrEdicao   INTEGER,
    idJornal   INTEGER,
    nrIdCivil  INTEGER,
    idPapel    INTEGER,
    CONSTRAINT pk_NoticiaJornalista_idNoticia_nrEdicao_idJornal_nrIdCivil_idPapel PRIMARY KEY ( idNoticia,
                                                                                                nrEdicao,
                                                                                                idJornal,
                                                                                                nrIdCivil,
                                                                                                idPapel )
);

CREATE TABLE Jornalista (
    nrIdCivil  INTEGER PRIMARY KEY,
    idPessoa   INTEGER
);

CREATE TABLE Pessoa (
    idPessoa        INTEGER PRIMARY KEY,
    nome            VARCHAR(50),
    dataNascimento  DATE
);

CREATE TABLE EdicaoJornal (
    nrEdicao    INTEGER,
    idJornal    INTEGER,
    precoBase   FLOAT,
    precoVenda  FLOAT,
    CONSTRAINT pk_EdicaoJornal_nrEdicao_idJornal PRIMARY KEY ( nrEdicao,
                                                               idJornal )
);

ALTER TABLE Jornal
    ADD CONSTRAINT fkJornalidMorada FOREIGN KEY ( idMorada )
        REFERENCES Morada ( idMorada );

ALTER TABLE Morada
    ADD CONSTRAINT fk_Morada_nrCodigoPostal FOREIGN KEY ( nrCodigoPostal )
        REFERENCES CodigoPostal ( nrCodigoPostal );

ALTER TABLE EdicaoJornal
    ADD CONSTRAINT fk_EdicaoJornal_idJornal FOREIGN KEY ( idJornal )
        REFERENCES Jornal ( idJornal );

ALTER TABLE Noticia
    ADD CONSTRAINT fk_Noticia_idJornal_nrEdicao FOREIGN KEY ( idJornal,
                                                              nrEdicao )
        REFERENCES EdicaoJornal ( idJornal,
                                  nrEdicao );
                                  
ALTER TABLE NoticiaJornalista
    ADD CONSTRAINT fk_NoticiaJornalista_idNoticia_nrEdicao_idJornalFOREIGN KEY ( idNoticia, nrEdicao, idJornal)
        REFERENCES Jornal ( idJornal, nrEdicao, idJornal );                                  

--DROP TABLE Jornal CASCADE CONSTRAINTS PURGE;

--DROP TABLE morada CASCADE CONSTRAINTS PURGE;