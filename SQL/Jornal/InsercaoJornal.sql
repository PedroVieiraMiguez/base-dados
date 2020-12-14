--Implementar RI
--Inserir Dados: 9 jornais, 2 edições/jornal, 2 noticias/edição, 
--4 jornalistas : 1 jornalista autor cada noticia, 1 coautor e/ou revisor algumas noticias
--clientes
--2 pontos venda
--12 compras

INSERT INTO CodigoPostal (
    nrCodigoPostal,
    localidade
) VALUES (
    '4000-222',
    'Porto'
);

INSERT INTO CodigoPostal (
    nrCodigoPostal,
    localidade
) VALUES (
    '5321-123',
    'Lisboa'
);

INSERT INTO CodigoPostal (
    nrCodigoPostal,
    localidade
) VALUES (
    '1555-995',
    'Algarve'
);

INSERT INTO Morada (
    idMorada,
    nrCodigoPostal,
    rua,
    nrPorta
) VALUES (
    1,
    '4000-222',
    'Rua do Jacal',
    666
);

INSERT INTO Morada (
    idMorada,
    nrCodigoPostal,
    rua,
    nrPorta
) VALUES (
    2,
    '5321-123',
    'Avenida Pereirinha',
    51
);

INSERT INTO Morada (
    idMorada,
    nrCodigoPostal,
    rua,
    nrPorta
) VALUES (
    3,
    '1555-995',
    'Rotunda da Açorda',
    191
);

INSERT INTO Jornal (
    idJornal,
    idMorada,
    designacao,
    dataFundacao
) VALUES (
    1,
    1,
    'Intransigente',
    TO_DATE('25/05/1995', 'dd/mm/yyyy')
);

INSERT INTO Jornal (
    idJornal,
    idMorada,
    designacao,
    dataFundacao
) VALUES (
    2,
    2,
    'Bombástico',
    TO_DATE('11/01/2005', 'dd/mm/yyyy')
);

INSERT INTO Jornal (
    idJornal,
    idMorada,
    designacao,
    dataFundacao
) VALUES (
    3,
    3,
    'Mensagem Fantasma',
    TO_DATE('05/11/1988', 'dd/mm/yyyy')
);

INSERT INTO EdicaoJornal (
    nrEdicao,
    idJornal,
    precoBase,
    precoVenda,
    idJornalAnterior,
    nrEdicaoAnterior
) VALUES (
    1,
    1,
    1.40,
    1.99,
    null,
    null
);

UPDATE Cliente
SET
    nrCliente = 0002,
set
    idPessoa = 002,
WHERE
    idPessoa = 001;
DELETE FROM Cliente
WHERE
    idPessoa = 001;