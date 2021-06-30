CREATE DATABASE Proyecto;

USE Proyecto;

CREATE TABLE Mesa(
num_mesa NUMERIC (2) primary key,
cli_mesa NUMERIC (2) not null);

CREATE TABLE Garzon(
id_gar NUMERIC (2) primary key,
nom_gar VARCHAR(20) not null,
ap_gar VARCHAR (20) not null);

CREATE TABLE Plato(
id_pla NUMERIC (10) primary key,
nom_pla VARCHAR (50) not null,
tipo_pla VARCHAR (20) not null,
pre_pla NUMERIC (6) not null);

CREATE TABLE Bebida(
id_be NUMERIC (10) primary key,
nom_be VARCHAR (50) not null,
tipo_be VARCHAR (20) not null,
pre_be NUMERIC (6) not null);

CREATE TABLE Comanda(
id_com NUMERIC (10) not null,
fecha_com DATETIME not null,
nummesa NUMERIC (2) not null,
idgar NUMERIC (2) not null,
idpla NUMERIC (10) not null,
idbe NUMERIC (10) not null,

CONSTRAINT fk_mesa
    FOREIGN KEY (nummesa)
    REFERENCES Mesa (num_mesa),

CONSTRAINT fk_garzon
    FOREIGN KEY (idgar)
    REFERENCES Garzon (id_gar),

CONSTRAINT fk_plato
    FOREIGN KEY (idpla)
    REFERENCES Plato (id_pla),

CONSTRAINT fk_bebida
    FOREIGN KEY (idbe)
    REFERENCES Bebida (id_be));

	INSERT INTO Mesa

(num_mesa,cli_mesa)

VALUES('1','2'),
('2','4'),
('3','4'),
('4','2'),
('5','2'),
('6','4'),
('7','6'),
('8','2'),
('9','4'),
('10','4')

INSERT INTO Garzon

(id_gar,nom_gar,ap_gar)

VALUES ('01','Barbara','Contreras'),
('02','Miguel','León'),
('03','Camilo','Delgado'),
('04','Victoria','Alegría')

INSERT INTO Plato

(id_pla,nom_pla,tipo_pla,pre_pla)

VALUES ('101','Carne al jugo con acompañamiento','Fondo','4000'),
('102','Lomo a lo pobre','Fondo','5500'),
('103','Lasaña','Fondo','4500'),
('104','Completo','Sandwich','2000'),
('105','Churrasco','Sandwich','4500'),
('106','Ensalada Cesar','Ensalada','5000'),
('107','Ensalada a la chilena','Ensalada','3500'),
('108','Chorrillana','Para compartir','10000'),
('109','Tiramisú','Postre','3000'),
('110','Flan','Postre','2000')

INSERT INTO Bebida

(id_be,nom_be,tipo_be,pre_be)

VALUES ('201','Coca cola','Gaseosa','1500'),
('202','Sprite','Gaseosa','1500'),
('203','Jugo frutilla','Jugo','2000'),
('204','Limonada','Jugo','2000'),
('205','Agua mineral','Agua','1500'),
('206','Pisco Sour','Alcohol','4000'),
('207','Cerveza','Alcohol','3000'),
('208','Vino','Alcohol','3500'),
('209','Te','Caliente','1500'),
('210','Café','Caliente','1500')


ALTER TABLE Bebida
ADD Precio_neto as (Pre_be*0.81)

SELECT* FROM Comanda

UPDATE Bebida set pre_be = '2000'
where id_be = 209

DELETE FROM Plato
where nom_pla = 'Lasaña'

INSERT INTO Comanda

(id_com,fecha_com,nummesa,idgar,idpla,idbe)

VALUES ('001','20/05/2020','1','02','101','206')

SELECT * 
FROM Comanda C JOIN Bebida B 
ON C.idbe = B.id_be

ALTER TABLE Comanda
DROP CONSTRAINT fk_garzon

DROP TABLE Garzon