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

--###CREATE TABLE###

CREATE TABLE Jornal (
    idJornal      INTEGER PRIMARY KEY,
    idMorada      NUMERIC,
    dataFundacao  DATE
        CONSTRAINT nn_Jornal_DataFundacao NOT NULL
        CONSTRAINT ck_Jornal_DataFundacao CHECK ( dataFundacao >= TO_DATE('01-01-1900', 'mm-dd-yyyy') ),
    designacao    VARCHAR(30)
        CONSTRAINT nn_Jornal_Designacao NOT NULL
);

CREATE TABLE Morada (
    idMorada        NUMERIC PRIMARY KEY,
    nrCodigoPostal  VARCHAR(8)
        CONSTRAINT nn_Morada_nrCodigoPostal NOT NULL,
    rua             VARCHAR(50)
        CONSTRAINT nn_Morada_rua NOT NULL,
    nrPorta         INTEGER
        CONSTRAINT nn_Morada_nrPorta NOT NULL
        CONSTRAINT ck_Morada_nrPorta CHECK ( nrPorta > 0 )
);

CREATE TABLE PontoVenda (
    idPontoVenda  INTEGER PRIMARY KEY,
    idMorada      NUMERIC
        CONSTRAINT nn_PontoVenda_idMorada NOT NULL
);

CREATE TABLE Compra (
    idCompra      INTEGER PRIMARY KEY,
    nrEdicao      INTEGER
        CONSTRAINT nn_Compra_nrEdicao NOT NULL,
    idJornal      INTEGER
        CONSTRAINT nn_Compra_idJornal NOT NULL,
    idPontoVenda  INTEGER
        CONSTRAINT nn_Compra_idPontoVenda NOT NULL,
    nrCliente     INTEGER
        CONSTRAINT nn_Compra_nrCliente NOT NULL,
    quantidade    INTEGER
        CONSTRAINT nn_Compra_Quantidade NOT NULL
        CONSTRAINT ck_Compra_Quantidade CHECK ( quantidade > 0 )
);

CREATE TABLE Cliente (
    nrCliente  INTEGER PRIMARY KEY,
    idPessoa   INTEGER
        CONSTRAINT nn_Cliente_idPessoa NOT NULL
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
        CONSTRAINT nn_CodigoPostal_localidade NOT NULL
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
        CONSTRAINT nn_Jornalista_idPessoa NOT NULL
        CONSTRAINT un_Jornalista_idPessoa UNIQUE
);

CREATE TABLE Pessoa (
    idPessoa        INTEGER PRIMARY KEY,
    nome            VARCHAR(50)
        CONSTRAINT nn_Pessoa_Nome NOT NULL,
    dataNascimento  DATE
        CONSTRAINT ck_Pessoa_DataNascimento CHECK ( dataNascimento >= TO_DATE('01-01-1940', 'mm-dd-yyyy') )
        CONSTRAINT nn_Pessoa_DataNascimento NOT NULL,
    genero          VARCHAR(1)
        CONSTRAINT nn_Pessoa_Genero NOT NULL
        CONSTRAINT ck_Pessoa_Genero CHECK ( upper(genero) IN ( 'M', 'F' ) )
);

CREATE TABLE EdicaoJornal (
    nrEdicao          INTEGER,
    idJornal          INTEGER,
    precoBase         FLOAT
        CONSTRAINT ck_EdicaoJornal_precoBase CHECK ( precoBase >= 0 ),
    precoVenda        FLOAT,
    idJornalAnterior  INTEGER,
    nrEdicaoAnterior  INTEGER,
    CONSTRAINT pk_EdicaoJornal_nrEdicao_idJornal PRIMARY KEY ( nrEdicao,
                                                               idJornal ),
    CONSTRAINT ck_EdicaoJornal_precoVenda CHECK ( precoVenda > precoBase )
);

CREATE TABLE PapelJornalistaNoticia (
    idPapel     INTEGER PRIMARY KEY,
    designacao  VARCHAR(30)
        CONSTRAINT nn_PapelJornalistaNoticia NOT NULL
);

    
--###ALTER TABLE###

ALTER TABLE Jornal
    ADD CONSTRAINT fkJornalidMorada FOREIGN KEY ( idMorada )
        REFERENCES Morada ( idMorada );

ALTER TABLE Morada
    ADD CONSTRAINT fk_Morada_nrCodigoPostal FOREIGN KEY ( nrCodigoPostal )
        REFERENCES CodigoPostal ( nrCodigoPostal );

ALTER TABLE EdicaoJornal
    ADD CONSTRAINT fk_EdicaoJornal_idJornal FOREIGN KEY ( idJornal )
        REFERENCES Jornal ( idJornal );

ALTER TABLE EdicaoJornal
    ADD CONSTRAINT fk_EdicaoJornal_idJornalAnterior_nrEdicaoAnterior FOREIGN KEY ( idJornalAnterior,
                                                                                   nrEdicaoAnterior )
        REFERENCES EdicaoJornal ( idJornal,
                                  nrEdicao );

ALTER TABLE EdicaoJornal ADD CONSTRAINT uk_EdicaoJornal_idJornalAnterior_nrEdicaoAnterior UNIQUE ( idJornalAnterior,
                                                                                                   nrEdicaoAnterior );

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