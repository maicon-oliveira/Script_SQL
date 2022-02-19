CREATE DATABASE BDRpgOnline

USE BDRpgOnline

CREATE TABLE Usuarios( 
	IdUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL ,
	Senha VARCHAR(100) NOT NULL
)

CREATE TABLE Classes(
	IdClasse INT PRIMARY KEY IDENTITY,
	NomeClasse VARCHAR(50) UNIQUE NOT NULL,
	DescricaoC VARCHAR(100) NOT NULL,
)

CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	NomeHabilidade VARCHAR(50) NOT NULL,
	DescricaoH VARCHAR(100) 
)

CREATE TABLE Personagens(
	IdPersonagem INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR(15) UNIQUE NOT NULL,
	Nivel INT NOT NULL,
	DescricaoP Varchar(100) NOT NULL,
	IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
)

/* Classe Criada para relação de N para N (tabela Classe e tabela Habilidade) */
CREATE TABLE ClasseHabilidade(
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade)
)

--DML (inserindo valores nas tabelas).

INSERT INTO Usuarios VALUES ('usuario@email.com','1234')
INSERT INTO Classes VALUES ('Barbaro' ,'Bárbaro é Bravo' )
INSERT INTO Habilidades VALUES ('Lança Mortal', 'Ataque de lança' ),
							   ('Escudo Supremo' , 'Defesa de Escudo')
INSERT INTO Personagens(NomePersonagem, Nivel, DescricaoP, IdUsuario, IdClasse)
			    VALUES ('DeuBug', '10', 'DeuBug é Forte', 1, 1)
INSERT INTO ClasseHabilidade(IdClasse, IdHabilidade)
				VALUES      (1, 1), (1, 2)

INSERT INTO Usuarios(Email, Senha)
			VALUES  ('usuario2@email.com', '1234'  )
INSERT INTO Classes (NomeClasse, DescricaoC        )
			VALUES  ('Viking' , 'Viking da Noruega')
INSERT INTO Habilidades(NomeHabilidade, DescricaoH)
			VALUES     ('Espada Viking', 'Ataque de Espada'),
					   ('Arco Viking', 'Arco de Precisão'  )
INSERT INTO Personagens(NomePersonagem, Nivel, DescricaoP, IdUsuario, IdClasse)
		    VALUES	   ('Ping300', '1' , 'Ping é muito ruim', 4, 7)
INSERT INTO ClasseHabilidade(IdClasse, IdHabilidade)
			VALUES          (7,11), (7,12)

--Alterando valores nas tabelas
UPDATE Usuarios
SET senha = '4321'
WHERE IdUsuario = 4


--DQL

--Select comum
SELECT * FROM Personagens
SELECT * FROM Usuarios
SELECT * FROM Habilidades
SELECT * FROM Classes
SELECT * FROM ClasseHabilidade

--Select Usando Join

SELECT * FROM Personagens AS a
INNER JOIN Classes AS b
ON  a.IdClasse = b.IdClasse

SELECT P.NomePersonagem, C.NomeClasse AS 'Nome da Classe', C.DescricaoC AS 'Descrição da Classe'
FROM Personagens AS P
INNER JOIN Classes AS C
ON P.IdClasse = C.IdClasse


SELECT P.NomePersonagem, P.Nivel, P.DescricaoP AS 'Desrcição Do Personagem',
	   H.NomeHabilidade, H.DescricaoH AS 'Descrição Da Habilidade' 
FROM Personagens AS P
INNER JOIN ClasseHabilidade AS CH
ON P.IdClasse = CH.IdClasse
INNER JOIN Habilidades AS H
ON CH.IdHabilidade = H.IdHabilidade

