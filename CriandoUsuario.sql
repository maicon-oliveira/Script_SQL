USE BDRpgOnline

--Cria o Login de Acesso 
CREATE LOGIN player1
WITH PASSWORD  = '1234'

--Cria um Usu�rio ao Banco de Dados e liga o usuario ao login
CREATE USER player1 FOR LOGIN player1

--Restringi o Acesso Somente de Leitura ao Usu�rio
GRANT SELECT TO player1