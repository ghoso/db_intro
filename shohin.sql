-- データベース作成
CREATE DATABASE shop;
\c shop;

-- Clientエンコーディング変更
\encoding UTF8;

-- 商品テーブル
CREATE TABLE Shohin
(shohin_id  CHAR(4)  NOT NULL,
shohin_mei  VARCHAR(100)  NOT NULL,
shohin_bunrui VARCHAR(32)  NOT NULL,
hanbai_tanka  INTEGER,
shiire_tanka  INTEGER,
torokubi  DATE,
PRIMARY KEY  (shohin_id));

-- 商品データ
INSERT INTO Shohin VALUES ('0001', '扇風機','家電',10000,7000, '2020-01-01');
INSERT INTO Shohin VALUES ('0002', 'Yシャツ','衣服',2000,1300, '2020-03-01');
INSERT INTO Shohin VALUES ('0003', '靴下','衣服',800,500, '2020-03-01');
INSERT INTO Shohin VALUES ('0004', 'スピーカー','家電',15000,12000, '2020-05-15');
INSERT INTO Shohin VALUES ('0005', 'シャープペン','文房具',500,300, '2020-04-22');
INSERT INTO Shohin VALUES ('0006', '中華鍋','キッチン用品',2000,1500, '2020-04-22');
INSERT INTO Shohin VALUES ('0007', 'ペンケース','文房具',1500,1000, '2020-05-15');
INSERT INTO Shohin VALUES ('0008', 'フライパン','キッチン用品',2500,3200, '2020-04-22');
INSERT INTO Shohin VALUES ('0009', '液晶テレビ','家電',75000,90000, '2020-04-22');