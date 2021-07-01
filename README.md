# Malicious Fighters
StreetFighterV(以下スト5)のオンライン対戦に跋扈する悪質なプレイヤーを共有するサービスです。

<img src="https://user-images.githubusercontent.com/74701217/122856347-9aed8080-d351-11eb-91a5-af3c7ad95133.png" width="400">

## アプリURL
https://www.malicious-fighters.com/

## サービスを作った経緯
私が愛してやまない格闘ゲーム(ビデオゲームのジャンルの一つ)をプレイしていると、オンライン対戦で稀に悪質なプレイヤーとマッチングすることがありました。<br>
悪質なプレイヤーとは、屈伸や挑発行為、切断を行うプレイヤーを指します。純粋に腕前を競うゲームで今この瞬間にも対戦相手へ嫌がらせを行っているプレイヤーが存在しています。<br>
楽しむためにゲームをしているのにマナーの悪い人とマッチングすると気分が台無しになり、それが原因でゲームをやめてしまう人もいます。<br>
特定の相手とマッチングしないためのブラックリスト機能は存在しますが、プレイヤーの素性は対戦するまで分かりません。被害を受けて初めてブラックリストを使うことになります。出来れば一度もそんな相手と当たりたくない…。もし悪質なプレイヤーを事前に知ることができたら、対戦するたびに余計な心配をする必要はなくなります<br>
そんな思いから、悪質プレイヤーの情報をまとめたサービスを作りました。

## マーケット
- スト5のオンライン対戦で悪質なプレイヤーとマッチングしたくない人
- 悪質なプレイヤーを事前に知っておきたい人

## 登場人物
- (健全な)プレイヤー
  - 悪質なプレイヤーとマッチングしたくない
- 悪質プレイヤー
  - マナーが悪く対戦相手に悪質なプレイをする
- アプリ管理人
  - 悪質プレイヤーをデータベース化し、悪質プレイヤーとマッチングしたくないプレイヤーに情報を共有する

## 機能紹介
| トップページ | プレイヤー検索 |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124130409-b4ad6700-dab9-11eb-85d2-6c962ac10f8b.png">|<img src="https://user-images.githubusercontent.com/74701217/124130487-cb53be00-dab9-11eb-8ccf-23e117dd56e3.png">|
|検索機能や登録申請、更新情報が表示されている。|指定した条件で検索する。|
<br>

| データベース | プレイヤーデータ1/2 |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124130538-d870ad00-dab9-11eb-9116-90a86ac41a87.png">|<img src="https://user-images.githubusercontent.com/74701217/124130599-e7eff600-dab9-11eb-92f3-b63784ad1713.png">|
|指定した条件での検索結果が表示される。|悪質プレイヤーの詳細情報を確認できる。|
<br>

| プレイヤーデータ2/2 | 会員登録 |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124130771-179efe00-daba-11eb-8d0e-4ff295b833e8.png">|<img src="https://user-images.githubusercontent.com/74701217/124130842-2980a100-daba-11eb-8462-ec4d05adea40.png">|
|悪質プレイの証拠動画を見て、悪質かどうかの投票を行うことができる。|必須項目を入力して会員登録を行う。|
<br>

| ログイン | プロフィール |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124130894-37362680-daba-11eb-963e-d12a6b2b6738.png">|<img src="https://user-images.githubusercontent.com/74701217/124130949-44ebac00-daba-11eb-972c-fb08051f31b0.png">|
|登録したメールアドレスとパスワードを入力してログインする。|登録した会員情報を見ることができる。|
<br>

| コメント機能(未ログイン) | コメント機能(ログイン済) |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124130987-503ed780-daba-11eb-9d6c-ea745f67c970.png">|<img src="https://user-images.githubusercontent.com/74701217/124131178-7e241c00-daba-11eb-82d6-f59c991fcb44.png">|
|ログインすることでプレイヤー詳細ページ下部のコメント閲覧・投稿をすることができるようになる。|プレイヤーに関するコメントを投稿できる。自分のコメントは削除可能。|
<br>

| トップページ(管理者) | プレイヤー登録 |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124131239-909e5580-daba-11eb-819b-9446d60c168f.png">|<img src="https://user-images.githubusercontent.com/74701217/124131407-bc214000-daba-11eb-91af-ef6735f4dacf.png">|
|admin権限を与えられた管理者が「新規登録」から悪質プレイヤーの登録をできる。|プレイヤーの情報、証拠の動画を登録する。|
<br>

| プレイヤー編集 | お問い合わせ |
| :------------------------------------------------------------------- | :------------------------------------------------------------------- |
|<img src="https://user-images.githubusercontent.com/74701217/124131478-cf341000-daba-11eb-8a03-fe3546a6f2a9.png">|<img src="https://user-images.githubusercontent.com/74701217/124131630-f559b000-daba-11eb-87c9-a6f8c0b7558d.png">|
|admin権限を与えられた管理者がプレイヤー詳細ページからプレイヤーの情報を編集できる。|管理者宛にメッセージを送ることができる。|
<br>

## ユーザー数&PV数
初動 1350人&15000PV(6/9)<br>
稼働3週間 UU1600人&18500PV(~7/1)

## 使用技術
- Ruby 2.6.6
- Rails 6.0.3.5
- RSpec
- MySQL
- Nginx
- Puma
- AWS
  - VPC
  - EC2
  - RDS
  - ALB
  - Route53
  - ACM
  - S3

### 主要機能
- 検索機能(ransack)
- ログイン機能(sorcery)
- コメント機能
- プレイヤー登録機能(admin権限)
- 投票機能(ajax)

### ER図
![malicious_fighters_er](https://user-images.githubusercontent.com/74701217/123888010-8cc0e500-d98d-11eb-8c17-ed224448c9c3.png)

### インフラ構成図
![インフラ構成図](https://user-images.githubusercontent.com/74701217/124152591-a3bb2080-dace-11eb-9294-2a57f6452a46.png)