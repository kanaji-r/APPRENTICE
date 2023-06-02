# プログラミングニュースアグリゲーターアプリ
## 誰のどんな課題を解決するのか？
対象:自分自身やプログラミング初学者<br>
課題:プログラミングに触れる機会が少ない。便利な知識や技術に乏しい。技術記事サイトはあるが記事が多すぎて、興味があるものを探しにくい。見たい記事サイトが二つあるが、それぞれのサイトを行き来して興味があるものだけを探すのが面倒。
## なぜそれを解決したいのか？
多くの知識を吸収し、エンジニアとして成長したいから。また、興味があるもののみ集約することで記事を探すストレスを減らす。
## どうやって解決するのか？
自分の興味があるジャンルのみ集約することで記事を探すストレスを減らす。アラート機能を付けることで半強制的にプログラミング技術に触れる機会を増やす。
## ユーザー作業内容
興味があるジャンルを登録する。
## 機能
1. ユーザー登録:ユーザーID,パスワードでアカウントを作成しログインできるようにする。
2. フィルタリング:興味のあるジャンルを登録し、それに当てはまる記事のみ収集する。
3. ブックマーク:気になる記事はブックマークリストに保存
4. ブラウザプッシュ通知:記事が追加されたタイミングでpcに通知を送る。通知が届くタイミングの時間設定もできるようにする。
## データ収集方法
webスクレイピングを一日一回行い、フィルタリングされた記事が新規投稿されていたら保存する。
## 表示画面
フィルタリングされた新着記事履歴、ブックマーク履歴を表示。シンプルにすることで使いやすくする。(画面表示についてはReactなどフレームワークを使用する)