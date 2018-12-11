USE tempdb;
GO

-- Utworzenie tabel
DROP TABLE IF EXISTS dbo.Pracownik;
GO

CREATE TABLE dbo.Pracownik (
	Id				INT         NOT NULL CONSTRAINT PK_Id PRIMARY KEY,
	Nazwa			VARCHAR(50) NOT NULL,
	PrzelozonyId	INT         NULL--,

    --INDEX IX_PrzelozonyId (PrzelozonyId, Id, Nazwa)
);

-- Wypełnij danymi
INSERT INTO dbo.Pracownik (Id, Nazwa, PrzelozonyId) VALUES
(1,  'Prezes',					NULL),
(50, 'Członek Zarządu C1',		1),
(51, 'Członek Zarządu C2',		1),
(52, 'Członek Zarządu C3',		1),
(41, 'Dyrektor Wykonawczy DW1',	50),
(43, 'Dyrektor Wykonawczy DW2',	51),
(45, 'Dyrektor Wykonawczy DW3',	52),
(46, 'Dyrektor Wykonawczy DW4',	52),
(47, 'Dyrektor Wykonawczy DW5',	51),
(42, 'Dyrektor Wykonawczy DW6', 51),
(2,  'Dyrektor D1',				41),
(20, 'Dyrektor D2',				43),
(3,  'Kierownik K1 D1',			2),
(4,  'Kierownik K2 D1',			2),
(5,  'Kierownik K3 D1',			2),
(6,  'Kierownik K4 D1',			2),
(7,  'Pracownik P1 K1 D1',		3),
(8,  'Pracownik P2 K1 D1',		3),
(9,  'Pracownik P3 K1 D1',		3),
(10, 'Pracownik P4 K1 D1',		3),
(11, 'Pracownik P5 K1 D1',		3),
(12, 'Pracownik P6 K1 D1',		3),
(13, 'Pracownik P1 K2 D1',		4),
(15, 'Pracownik P3 K2 D1',		4),
(16, 'Pracownik P4 K2 D1',		4),
(17, 'Pracownik P5 K2 D1',		4),
(18, 'Pracownik P6 K2 D1',		4),
(21, 'Kierownik K1 D2',			20),
(22, 'Kierownik K2 D2',			20),
(23, 'Kierownik K3 D2',			20),
(24, 'Kierownik K4 D2',			20),
(53, 'Dyrektor D3',             42),
(54, 'Dyrektor D4',             47),
(55, 'Kierownik K1 D3',			53),
(56, 'Kierownik K1 D4',		    54),
(57, 'Kierownik K2 D4',			54),
(58, 'Kierownik K2 D3',         53),
(59, 'Dyrektor D6',             42),
(60, 'Pracownik P1 K1 D3',      55),
(61, 'Dyrektor D7',             45),
(71, 'Kierownik K1 D7',			61),
(62, 'Dyrektor D8',             46),
(73, 'Kierownik K1 D8',			62)
;

DROP TABLE IF EXISTS dbo.Zbior1;
DROP TABLE IF EXISTS dbo.Zbior2;
DROP TABLE IF EXISTS dbo.Zbior3;
DROP TABLE IF EXISTS dbo.Zbior4;

CREATE TABLE dbo.Zbior1 (
    id          TINYINT NOT NULL,
    nazwa       CHAR(2) NOT NULL,
    zbior_id    TINYINT NOT NULL DEFAULT 1
);

CREATE TABLE dbo.Zbior2 (
    id          TINYINT NOT NULL,
    nazwa       CHAR(2) NOT NULL,
    zbior_id    TINYINT NOT NULL DEFAULT 2
);

CREATE TABLE dbo.Zbior3 (
    id          TINYINT NOT NULL,
    nazwa       CHAR(2) NOT NULL,
    zbior_id    TINYINT NOT NULL DEFAULT 3
);

CREATE TABLE dbo.Zbior4 (
    id          TINYINT NOT NULL,
    nazwa       CHAR(2) NOT NULL,
    zbior_id    TINYINT NOT NULL DEFAULT 4
);

INSERT INTO dbo.Zbior1(id, nazwa) VALUES
(1, 'W1'),
(2, 'W2'),
(3, 'W3'),
(4, 'W4'),
(5, 'W5'),
(6, 'W6')
;

INSERT INTO dbo.Zbior2(id, nazwa) VALUES
(1, 'W1'),
(2, 'W2'),
(3, 'W3'),
(4, 'W4'),
(5, 'W5')
;

INSERT INTO dbo.Zbior3(id, nazwa) VALUES
(1, 'W1'),
(2, 'W2'),
(3, 'W3'),
(4, 'W4')
;

INSERT INTO dbo.Zbior4(id, nazwa) VALUES
(1, 'W1'),
(2, 'W2'),
(3, 'W3')
;