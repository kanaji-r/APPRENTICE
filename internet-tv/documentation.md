# インターネットTV
<details>
  <summary>ステップ1:テーブル設計</summary>

【channels】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| channel_id | INT | NOT NULL | PRIMARY KEY | | YES |
| channel_name | VARCHAR(255) | | | | |

【program】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| program_id | INT | NOT NULL | PRIMARY KEY | | YES |
| title | VARCHAR(255) | | | | |
| program_detail | TEXT | | | | |

【seasons】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| series_id | INT | NOT NULL | PRIMARY KEY | | YES |
| program_id | INT | NOT NULL | FOREIGN KEY | | |
| season_number | INT | | | NULL | |

【episodes】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| episode_id | BIGINT(20) | NOT NULL | PRIMARY KEY | | YES |
| series_id | INT | NOT NULL | FOREIGN KEY | | |
| episode_number | INT | | | NULL | |
| title | VARCHAR(255) | | | | |
| episode_detail | TEXT | | | | |
| video_length | INT | | | | |
| release_date | DATE | | | | |
| views | BIGINT(20) | | | 0 | |

【genres】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| genre_id | INT | NOT NULL | PRIMARY KEY | | YES |
| genre_name | VARCHAR(255) | | | | |

【program_genres】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| program_id | INT | NOT NULL | FOREIGN KEY | | |
| genre_id | INT | NOT NULL | FOREIGN KEY | | |

【program_slots】
| カラム名 | データ型 | NULL | キー | 初期値 | AUTO INCREMENT |
| --- | --- | --- | --- | --- | --- |
| program_slot_id | INT | NOT NULL | PRIMARY KEY | | YES |
| channel_id | INT | NOT NULL | FOREIGN KEY | | |
| start_time | DATETIME | | | | |
| end_time | DATETIME | | | | |
| episode_id | BIGINT(20) | NOT NULL | FOREIGN KEY | | |
| views | BIGINT(20) | | | 0 | |

</details>
<details>
  <summary>ステップ2:データベース構築&サンプルデータ挿入</summary>

データベース構築<br>
※dockerはインストール済前提<br>
※.envファイルをinternet-tvフォルダ直下に作成して、MYSQL_ROOT_PASSWORD,MYSQL_USER,MYSQL_PASSWORDをそれぞれ設定してください
1. internet-tvディレクトリ内でターミナルから以下のコマンド実行
コンテナの構築・起動
```
docker compose up -d
```
2. コンテナに接続
```
docker compose exec db bash
```
3. MySQLに接続
```
mysql -u ユーザー名 -p
```
4.データベース(internet_tv)作成
```
CREATE DATABASE internet_tv;
```
5. データベース(internet_tv)が作成されたか確認
```
SHOW DATABASES;
```
6. データベースの指定
```
USE internet_tv;
```
7. 指定しているデータベースの確認
```
SELECT DATABASE();
```
テーブル作成
```
source /internet-tv/setup/create_tables.sql
```

サンプルデータ挿入
```
source /internet-tv/setup/insert_sample-data.sql
```
</details>
<details>
  <summary>ステップ3:以下のデータを抽出するクエリ</summary>

<details>
  <summary>エピソード視聴数トップ3のエピソードタイトルと視聴数を取得</summary>

```
SELECT title, views
FROM episodes
ORDER BY views DESC
LIMIT 3;
```
</details>
<details>
  <summary>エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得</summary>

```
SELECT p.title, s.season_number, e.episode_number, e.title, e.views
FROM episodes AS e
JOIN seasons AS s ON e.series_id = s.series_id
JOIN program AS p ON s.program_id = p.program_id
ORDER BY e.views DESC
LIMIT 3;
```
</details>
<details>
  <summary>本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得。なお、番組の開始時刻が本日のものを本日方法される番組とみなす</summary>

```
SELECT c.channel_name, ps.start_time, ps.end_time, s.season_number, e.episode_number, e.title, e.episode_detail
FROM program_slots AS ps
JOIN channels AS c ON ps.channel_id = c.channel_id
JOIN episodes AS e ON ps.episode_id = e.episode_id
JOIN seasons AS s ON e.series_id = s.series_id
WHERE DATE(ps.start_time) = CURDATE()
ORDER BY ps.start_time;
```
</details>
<details>
  <summary>ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得</summary>

```
SELECT ps.start_time, ps.end_time, s.season_number, e.episode_number, e.title, e.episode_detail
FROM program_slots AS ps
JOIN channels AS c ON ps.channel_id = c.channel_id
JOIN episodes AS e ON ps.episode_id = e.episode_id
JOIN seasons AS s ON e.series_id = s.series_id
JOIN program AS p ON s.program_id = p.program_id
WHERE c.channel_name = 'ドラマ' AND DATE(ps.start_time) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 WEEK);
```
</details>
<details>
  <summary>直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得</summary>

```

```
</details>
</details>