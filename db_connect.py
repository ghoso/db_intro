#
# db_connect.py
#
# PostgreSQL DB接続デモプログラム
#
import psycopg2

# DB指定
DB_URL = 'postgresql://postgres:postgres@127.0.0.1:5432/shop'
# DB接続
conn = psycopg2.connect(DB_URL)
# カーソル
cur = conn.cursor()
# SQL発行
cur.execute('SELECT * FROM shohin')
# データ取得
rows = cur.fetchall()
for row in rows:
    print(row)
# コネクションクローズ
cur.close()
conn.close()