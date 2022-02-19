USE BDRpgOnline

--Cria o Login de Acesso 
CREATE LOGIN player1
WITH PASSWORD  = '1234'

--Cria um Usuário ao Banco de Dados e liga o usuario ao login
CREATE USER player1 FOR LOGIN player1

--Restringi o Acesso Somente de Leitura ao Usuário
GRANT SELECT TO player1