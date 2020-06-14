-- 登録日の新しい順に並べる
select * from shohin order by torokubi desc;

--  商品分類ごとの仕入れ価格合計
select shohin_bunrui ,SUM(shiire_tanka) as shiire_goukei from shohin group by shohin_bunrui;

-- 販売価格の平均が1000円以上の商品分類のリスト
select shohin_bunrui, AVG(hanbai_tanka) as hanbai_tanka_avg from shohin group by shohin_bunrui HAVING AVG(hanbai_tanka) >= 1000;

-- 商品追加
INSERT INTO Shohin VALUES ('0010', 'システム手帳','文房具','3500','2800', '2020-04-22');

-- 商品分類が「衣服」の商品の仕入れ単価を+500する
UPDATE shohin set shiire_tanka = shiire_tanka + 500 where shohin_bunrui = '衣服';

-- トランザクション
BEGIN TRANSACTION
    INSERT INTO Shohin VALUES ('0020', 'WiFiルータ','家電','10000','8000', '2020-04-11');
    INSERT INTO Shohin VALUES ('0021', '消しゴム','文房具','250','200', '2020-04-01');
COMMIT;

-- ビュー作成
CREATE VIEW ShohinSum(shohin_bunrui, shohin_cnt)
AS
SELECT shohin_bunrui, COUNT(*) FROM shohin
GROUP BY shohin_bunrui;
-- ビュー検索
SELECT * FROM ShohinSum;
-- ビュー削除
DROP VIEW ShohinSum;

-- サブクエリ
SELECT shohin_bunrui, shohin_cnt
FROM (SELECT shohin_bunrui,COUNT(*) as shohin_cnt
      FROM shohin GROUP BY shohin_bunrui) AS ShohinCount;

-- スカラサブクエリ
SELECT shohin_id, shohin_mei, hanbai_tanka
FROM shohin
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka) FROM shohin);

-- 相関サブクエリ
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka
FROM shohin AS S1
WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
                        FROM shohin AS S2
                        WHERE S1.shohin_bunrui = S2.shohin_bunrui
                        GROUP BY shohin_bunrui);
-- 相関サブクエリ　商品分類別平均
SELECT shohin_bunrui, AVG(hanbai_tanka)
FROM shohin
GROUP BY shohin_bunrui;

-- CASE WHEN
SELECT shohin_mei,
CASE WHEN hanbai_tanka > 5000
THEN '高額商品'
ELSE '低額商品'
END AS kakaku_grade
FROM shohin;

-- 内部結合
SELECT U.uriage_id, S.shohin_id, S.shohin_mei, U.uriage_suu
FROM uriage AS U INNER JOIN shohin AS S
ON U.shohin_id = S.shohin_id;

-- 外部結合
SELECT U.uriage_id, S.shohin_id, S.shohin_mei, U.uriage_suu
FROM Shohin AS S LEFT OUTER JOIN uriage AS U
ON U.shohin_id = S.shohin_id;