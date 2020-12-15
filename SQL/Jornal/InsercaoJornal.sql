--Implementar RI
--Inserir Dados: 3 jornais, 2 edições/jornal, 2 noticias/edição, 
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

INSERT INTO EdicaoJornal (
    nrEdicao,
    idJornal,
    precoBase,
    precoVenda,
    idJornalAnterior,
    nrEdicaoAnterior
) VALUES (
    2,
    1,
    2.40,
    2.99,
    1,
    1
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
    2,
    1.65,
    2.35,
    null,
    null
);

INSERT INTO EdicaoJornal (
    nrEdicao,
    idJornal,
    precoBase,
    precoVenda,
    idJornalAnterior,
    nrEdicaoAnterior
) VALUES (
    2,
    2,
    3.40,
    5.99,
    2,
    1
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
    3,
    3.10,
    4.99,
    null,
    null
);

INSERT INTO EdicaoJornal (
    nrEdicao,
    idJornal,
    precoBase,
    precoVenda,
    idJornalAnterior,
    nrEdicaoAnterior
) VALUES (
    2,
    3,
    3.10,
    4.99,
    3,
    1
);

INSERT INTO EdicaoJornal (
    nrEdicao,
    idJornal,
    precoBase,
    precoVenda,
    idJornalAnterior,
    nrEdicaoAnterior
) VALUES (
    3,
    3,
    0.10,
    10.99,
    3,
    2
);

INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    1,
    1
);

INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    1,
    1
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    2,
    1
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    2,
    1
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    2,
    1
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    2,
    1
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    1,
    2
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    1,
    2
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    2,
    2
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    2,
    2
);

INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    1,
    3
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    1,
    3
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    1,
    2,
    3
);


INSERT INTO Noticia (
    idNoticia,
    nrEdicao,
    idJornal
) VALUES (
    2,
    2,
    3
);

INSERT INTO Pessoa (
    idPessoa,
    nome,
    dataNascimento,
    genero
) VALUES (
    1,
    'Ricardo Luis',
    TO_DATE('25/01/1965', 'dd/mm/yyyy'),
    'M'
);

INSERT INTO Pessoa (
    idPessoa,
    nome,
    dataNascimento,
    genero
) VALUES (
    2,
    'Maria Luz',
    TO_DATE('11/06/1993', 'dd/mm/yyyy'),
    'F'
);

INSERT INTO Pessoa (
    idPessoa,
    nome,
    dataNascimento,
    genero
) VALUES (
    3,
    'Rogério Luz',
    TO_DATE('12/06/1993', 'dd/mm/yyyy'),
    'M'
);

INSERT INTO Pessoa (
    idPessoa,
    nome,
    dataNascimento,
    genero
) VALUES (
    4,
    'Rui Sousa',
    TO_DATE('30/11/1987', 'dd/mm/yyyy'),
    'F'
);

INSERT INTO Jornalista (
    nrIdCivil,
    idPessoa
) VALUES (
    1111,
    1
);


INSERT INTO Jornalista (
    nrIdCivil,
    idPessoa
) VALUES (
    1112,
    2
);

INSERT INTO Jornalista (
    nrIdCivil,
    idPessoa
) VALUES (
    1113,
    3
);

INSERT INTO Jornalista (
    nrIdCivil,
    idPessoa
) VALUES (
    1114,
    4
);

INSERT INTO PapelJornalistaNoticia (
    idPapel,
    designacao
) VALUES (
    1,
    'autor'
);

INSERT INTO PapelJornalistaNoticia (
    idPapel,
    designacao
) VALUES (
    2,
    'co-autor'
);

INSERT INTO PapelJornalistaNoticia (
    idPapel,
    designacao
) VALUES (
    3,
    'revisor'
);

INSERT INTO Cliente (
    nrCliente,
    idPessoa
) VALUES (
    1,
    1
);

INSERT INTO Cliente (
    nrCliente,
    idPessoa
) VALUES (
    2,
    2
);

INSERT INTO Cliente (
    nrCliente,
    idPessoa
) VALUES (
    3,
    3
);

INSERT INTO Cliente (
    nrCliente,
    idPessoa
) VALUES (
    4,
    4
);

INSERT INTO PontoVenda (
    idPontoVenda,
    idMorada
) VALUES (
    1,
    1
);

INSERT INTO PontoVenda (
    idPontoVenda,
    idMorada
) VALUES (
    2,
    2
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    1,
    1,
    1,
    1111,
    1
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    1,
    1,
    1,
    1112,
    2
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    1,
    1,
    1,
    1113,
    3
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    2,
    2,
    3,
    1112,
    3
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    2,
    2,
    3,
    1111,
    2
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    2,
    2,
    3,
    1113,
    1
);


INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    1,
    1,
    1,
    1111,
    1
);

INSERT INTO NoticiaJornalista (
    idNoticia,
    nrEdicao,
    idJornal,
    nrIdCivil,
    idPapel
) VALUES (
    1,
    1,
    1,
    1112,
    2
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    1,
    1,
    1,
    1,
    1,
    5
);


INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    7,
    1,
    1,
    1,
    2,
    3
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    2,
    1,
    1,
    1,
    3,
    2
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    3,
    2,
    3,
    1,
    4,
    10
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    4,
    1,
    2,
    2,
    3,
    1
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    5,
    2,
    1,
    2,
    4,
    4
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    6,
    1,
    3,
    1,
    1,
    2
);

INSERT INTO Compra (
    idCompra,
    nrEdicao,
    idJornal,
    idPontoVenda,
    nrCliente,
    quantidade
) VALUES (
    8,
    3,
    3,
    1,
    4,
    5
);


select * from Compra;
commit;

delete from NoticiaJornalista where (nrIdCivil = 1111 AND idPapel = 3);

--UPDATE Cliente
--SET
--    nrCliente = 0002,
--set
--    idPessoa = 002,
--WHERE
--    idPessoa = 001;
--DELETE FROM Cliente
--WHERE
--    idPessoa = 001;