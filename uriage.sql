-- DB選択
\c shop

-- Clientエンコーディング変更
\encoding UTF8

-- 売上テーブル
CREATE TABLE Uriage
(uriage_id INTEGER NOT NULL,
 shohin_id CHAR(4) NOT NULL,
 uriage_suu INTEGER NOT NULL,
 hanbaibi DATE NOT NULL,
 PRIMARY KEY (uriage_id));

-- 売上データ
INSERT INTO Uriage VALUES (1, '0001', 4, '2020-01-01');
INSERT INTO Uriage VALUES (2, '0004', 10, '2020-03-02');
INSERT INTO Uriage VALUES (3, '0005', 88, '2020-03-11');
INSERT INTO Uriage VALUES (4, '0007', 21, '2020-03-15');
INSERT INTO Uriage VALUES (5, '0009', 4, '2020-04-03');