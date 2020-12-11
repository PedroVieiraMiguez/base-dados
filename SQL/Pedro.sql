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

CREATE TABLE PapelJornalistaNoticia (
    idPapel     INTEGER PRIMARY KEY,
    designacao  VARCHAR(30)
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

ALTER TABLE PontoVenda
    ADD CONSTRAINT fk_PontoVenda_idMorada FOREIGN KEY ( idMorada )
        REFERENCES Morada ( idMorada );

ALTER TABLE Noticia
    ADD CONSTRAINT fk_Noticia_idJornal_nrEdicao FOREIGN KEY ( idJornal,
                                                              nrEdicao )
        REFERENCES EdicaoJornal ( idJornal,
                                  nrEdicao );

ALTER TABLE Compra
    ADD CONSTRAINT fk_Compra_nrEdicao_idJornal FOREIGN KEY ( nrEdicao,
                                                             idJornal )
        REFERENCES EdicaoJornal ( nrEdicao,
                                  idJornal );

ALTER TABLE Compra
    ADD CONSTRAINT fk_Compra_nrCliente FOREIGN KEY ( nrCliente )
        REFERENCES Cliente ( nrCliente );

ALTER TABLE Compra
    ADD CONSTRAINT fk_Compra_idPontoVenda FOREIGN KEY ( idPontoVenda )
        REFERENCES PontoVenda ( idPontoVenda );

ALTER TABLE Cliente
    ADD CONSTRAINT fk_Cliente_idPessoa FOREIGN KEY ( idPessoa )
        REFERENCES Pessoa ( idPessoa );

ALTER TABLE NoticiaJornalista
    ADD CONSTRAINT fk_NoticiaJornalista_idNoticia_nrEdicao_idJornal FOREIGN KEY ( idNoticia,
                                                                                  nrEdicao,
                                                                                  idJornal )
        REFERENCES Noticia ( idNoticia,
                            nrEdicao,
                            idJornal );

ALTER TABLE NoticiaJornalista
    ADD CONSTRAINT fk_NoticiaJornalista_nrIdCivil FOREIGN KEY ( nrIdCivil )
        REFERENCES Jornalista ( nrIdCivil );

ALTER TABLE NoticiaJornalista
    ADD CONSTRAINT fk_NoticiaJornalista_idPapel FOREIGN KEY ( idPapel )
        REFERENCES PapelJornalistaNoticia ( idPapel );

ALTER TABLE Jornalista
    ADD CONSTRAINT fk_Jornalista_idPessoa FOREIGN KEY ( idPessoa )
        REFERENCES Pessoa ( idPessoa );

DROP TABLE Jornal CASCADE CONSTRAINTS PURGE;

DROP TABLE Morada CASCADE CONSTRAINTS PURGE;

DROP TABLE Cliente CASCADE CONSTRAINTS PURGE;

DROP TABLE CodigoPostal CASCADE CONSTRAINTS PURGE;

DROP TABLE Compra CASCADE CONSTRAINTS PURGE;

DROP TABLE EdicaoJornal CASCADE CONSTRAINTS PURGE;

DROP TABLE Jornalista CASCADE CONSTRAINTS PURGE;

DROP TABLE Noticia CASCADE CONSTRAINTS PURGE;

DROP TABLE Pessoa CASCADE CONSTRAINTS PURGE;

DROP TABLE NoticiaJornalista CASCADE CONSTRAINTS PURGE;

DROP TABLE PapelJornalistaNoticia CASCADE CONSTRAINTS PURGE;

DROP TABLE PontoVenda CASCADE CONSTRAINTS PURGE;