--Select <Campos>
--From <Tabela>
--Natural Join <Tabela>
--Inner Join <Tabela> on <condicao correspondencia>
-- Where <condicoes>
--Group by <Campos>
--Order by <criterio> <campo> <tipo ordenacao>
--sum()
--count()
--min()
--max()
--avg()

SELECT
    *
FROM
    Pessoa;

SELECT
    *
FROM
    Pessoa
WHERE
    genero = 'M';

SELECT
    idPessoa,
    nome,
    genero
FROM
    Pessoa;

SELECT
    idPessoa,
    nome
FROM
    Pessoa
WHERE
    genero = 'F';

SELECT
    nrIdCivil,
    nome,
    dataNascimento
FROM
         Pessoa
    NATURAL JOIN Jornalista
ORDER BY
    1;

SELECT
    nrIdCivil,
    nome AS "NomeJornalista",
    dataNascimento
FROM
         Pessoa
    NATURAL JOIN Jornalista
ORDER BY
    1;

SELECT
    idPessoa
FROM
         Pessoa
    NATURAL JOIN Jornalista
    NATURAL JOIN NoticiaJornalista
GROUP BY
    idPessoa;

SELECT
    SUM(precoVenda) AS "Total de Preços de Venda"
FROM
    EdicaoJornal;

SELECT
    SUM(precoVenda) AS "Total de Preços de Venda Jornal 1"
FROM
    EdicaoJornal
WHERE
    idJornal = 1;

SELECT
    COUNT(nrEdicao)
FROM
    EdicaoJornal
GROUP BY
    idJornal;

SELECT
    COUNT(nrIdCivil),
    idPapel
FROM
    NoticiaJornalista
GROUP BY
    idPapel;

SELECT
    AVG(precoBase),
    AVG(precoVenda)
FROM
    EdicaoJornal
GROUP BY
    idJornal;

SELECT
    MIN(precoBase),
    MAX(precoBase)
FROM
    EdicaoJornal
GROUP BY
    idJornal;

SELECT
    COUNT(nrEdicao),
    nrIdCivil
FROM
    NoticiaJornalista
GROUP BY
    nrIdCivil
ORDER BY
    nrIdCivil;

SELECT
    COUNT(nrIdCivil),
    idPapel,
    designacao
FROM
         NoticiaJornalista
    NATURAL JOIN PapelJornalistaNoticia
GROUP BY
    idPapel,
    designacao;

SELECT
    COUNT(nrIdCivil),
    genero
FROM
         NoticiaJornalista
    NATURAL JOIN Jornalista
    NATURAL JOIN Pessoa
WHERE
    idPapel = 1
GROUP BY
    genero;

SELECT
    COUNT(idCompra),
    idPontoVenda
FROM
    compra
GROUP BY
    idPontoVenda;
    
SELECT
    max(precoVenda),
    min(precoVenda),
    idPontoVenda
FROM
    PontoVenda natural join EdicaoJornal
group by
    idPontoVenda;
