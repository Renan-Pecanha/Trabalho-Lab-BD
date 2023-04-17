/*
Criando o usuário com limitações de acesso ao SGBD
O acesso do usuário será apenas de conectar no BD e executar as procedures.
Verifique em Propriedades da Conexão se o acesso é permitido via usuário SQL.
*/
USE MASTER
GO

--DROP LOGIN Labbd;
CREATE LOGIN Labbd WITH PASSWORD = '**SuaSenha**';
GO

GRANT CONNECT SQL TO Labbd;
GO

USE biblioteca
GO

--DROP USER Labbd
CREATE USER Labbd FOR LOGIN Labbd;
GO

GRANT EXECUTE ON BIBLIOTECA.dbo.SP_LIVROS TO Labbd;
GRANT EXECUTE ON BIBLIOTECA.dbo.SP_CLIENTES TO Labbd;
