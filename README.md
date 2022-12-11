# アプリケーション名
shumitomo
# アプリケーション概要
共通の趣味のユーザーと繋がって友達を増やしたり、ライフスタイルに変化を加える事ができる
# URL
https://shumitomo-app.onrender.com/
# テスト用アカウント
* Basic認証ユーザー名: admin

* Basic認証パスワード: 7010

* メールアドレス: ato@co.jp

* パスワード: kkppkk1
# 利用方法
## チャット

* ヘッダーのリンクから新規登録したユーザーはトップページ下部のリンクからチャットルームを投稿する

* 他のユーザーのチャットルームはいいねボタンをクリックでき、気になったチャットルームはお気に入りボタンをクリックすると登録できる

* ユーザーは複数人のユーザーとチャットルームに参加する事ができ、メッセージや画像を投稿する

## DM
* 他のユーザーのマイページからDMアイコンをクリックすると専用の画面に遷移しDMを送る

* ユーザーは1人のユーザーとDMルームにて、メッセージや画像を投稿する

## フォローする
* ユーザーは他のユーザーのマイページからフォローボタンを押すとフォローを追加する

# アプリケーションを作成した背景
普段の生活でtwitterなどのSNSを利用する機会が多くあります。 
twitterでは共通の趣味で知らない人と繋がることはできるが、踏み込んだところまでの関係性になるまでに時間がかかると思いました。  
そこで共通の趣味友達をもっと簡単にダイレクトにチャットで繋がる事ができて、親交を深めれるアプリを開発してみたいと思ったことがきっかけです。

# 洗い出した要件
[要件定義シート](https://docs.google.com/spreadsheets/d/15YjOYNlPGUahfX-_U6848u15Qr6XBGBd1dgir_xC5-c/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

## ユーザー管理

### 新規登録
[![Image from Gyazo](https://i.gyazo.com/7378dd996576cbaf6639be8cf392556a.gif)](https://gyazo.com/7378dd996576cbaf6639be8cf392556a)
* 新規登録ページにてフォームの入力を行うとアプリにユーザー登録できる

### ログアウト機能
[![Image from Gyazo](https://i.gyazo.com/534a0ab458c170cb9f63d3e201e65ab5.gif)](https://gyazo.com/534a0ab458c170cb9f63d3e201e65ab5)

* ユーザーはヘッダーのログアウトリンクからログアウトすることができる

### ログイン機能
[![Image from Gyazo](https://i.gyazo.com/e2aa49d4eeaf53d1e5c0adaf4b3f322e.gif)](https://gyazo.com/e2aa49d4eeaf53d1e5c0adaf4b3f322e)

* ヘッダーのログインリンクからログインページに遷移してログインするとアプリにログインすることができる

### マイページ編集機能
[![Image from Gyazo](https://i.gyazo.com/0e5882b9d6f05c6f08a9dd123df0a793.gif)](https://gyazo.com/0e5882b9d6f05c6f08a9dd123df0a793)

* ユーザーのマイページからマイページ編集ページに遷移でき編集することができる
* 画像の更新にはプレビュー機能を実装、画像を選択するとプレビュー画像が表示される
[![Image from Gyazo](https://i.gyazo.com/5cedc3d6abd4ab00be5fba672d79ae8b.gif)](https://gyazo.com/5cedc3d6abd4ab00be5fba672d79ae8b)

## 通知機能
[![Image from Gyazo](https://i.gyazo.com/0db6db7f41a258ba81b5c69125ee0954.gif)](https://gyazo.com/0db6db7f41a258ba81b5c69125ee0954)

* 他のユーザーからいいねされたり、チャットに参加している他のユーザーが投稿するとユーザーに通知が送られる
（フォロー、DM）

* 通知一覧表示はマイページから通知アイコンをクリックすることで表示される

* 未確認の通知件数はアイコンに重なって表示され、アイコンをクリックすると通知チェックが行われる為、未確認の通知はリセットされる

* 通知は通知画面下部の削除ボタンから全削除することができる

* 通知画面はバックアイコンをクリックすることで非表示にすることができる

## チャット機能
### チャット投稿機能
[![Image from Gyazo](https://i.gyazo.com/ad4f86e4941dfd0168b8331783a85831.gif)](https://gyazo.com/ad4f86e4941dfd0168b8331783a85831)

* ユーザーはチャットルームにて画像または、テキストを送信ボタンから投稿できる

### チャット参加機能
[![Image from Gyazo](https://i.gyazo.com/1904e113136769feaef7b4a96ed8f19d.gif)](https://gyazo.com/1904e113136769feaef7b4a96ed8f19d)

* チャットルーム詳細ページにて参加するボタンをクリックすると確認のダイアログが表示される、OKするとチャットに参加できる
* チャットに参加するとチャットのユーザーにリストに名前が表示される
* チャットに参加するとチャットルーム詳細ページに参加人数としてカウントされる

### チャット退室機能
[![Image from Gyazo](https://i.gyazo.com/a32554330484ce58722c365b32d0ed2a.gif)](https://gyazo.com/a32554330484ce58722c365b32d0ed2a)

* チャットルームから退室するボタンをクリックするとチャットルームから退室できる

### チャット編集、削除機能
[![Image from Gyazo](https://i.gyazo.com/65cf4e459b4d8d33c202dbdcf5920ba1.gif)](https://gyazo.com/65cf4e459b4d8d33c202dbdcf5920ba1)

* チャットルーム詳細ページから編集ページに遷移しチャットルームを編集できる

* チャットルーム詳細ページの削除ボタンをクリックすると確認のダイアログが表示される、okするとチャットルームが削除される

### チャットルーム　カテゴリー別　一覧機能
[![Image from Gyazo](https://i.gyazo.com/5cf67d01e04a8cd5d1dec666a3afea6e.gif)](https://gyazo.com/5cf67d01e04a8cd5d1dec666a3afea6e)

* トップページからカテゴリーをクリックすると、カテゴリーで登録されたチャットルームが一覧で表示される

* 表示されたチャットルームをクリックするとチャットルームの詳細画面に遷移する

## いいね機能
[![Image from Gyazo](https://i.gyazo.com/3293b6b0db267a7ee8c0e277abb6f87d.gif)](https://gyazo.com/3293b6b0db267a7ee8c0e277abb6f87d)

### いいね投稿機能
* チャットルーム詳細ページでいいねボタンをクリックするとそのチャットルームにいいねがカウントされる  
（1ユーザー1いいねまで）

### いいね削除機能
* いいねを取り止めたい時、再度いいねボタンをクリックするといいねが削除される

## ブックマーク機能（お気に入り）
[![Image from Gyazo](https://i.gyazo.com/37de9895d27ac4f0cbef276a1b123595.gif)](https://gyazo.com/37de9895d27ac4f0cbef276a1b123595)
* チャットルームをブックマークで留めておきたい時に使用する  

### ブックマーク登録機能
* チャットルーム詳細ページでお気に入りボタンをクリックするとチャットルームがお気に入りに登録される

### ブックマーク削除機能
* チャットルーム詳細ページでお気に入り削除ボタンをクリックするとチャットルームがお気に入りに登録から削除される

### ブックマーク一覧機能
[![Image from Gyazo](https://i.gyazo.com/63483f137e8e7a034b5ec4f827bb0abb.gif)](https://gyazo.com/63483f137e8e7a034b5ec4f827bb0abb)

* ユーザーのマイページから星アイコンをクリックするとお気に入りに登録したチャットルームが一覧で表示される

## DM機能
### DMルーム作成機能
[![Image from Gyazo](https://i.gyazo.com/5cc617a34989ec50b7660dd983a50309.gif)](https://gyazo.com/5cc617a34989ec50b7660dd983a50309)

* 他のユーザーのマイページからメールアイコンをクリックすると、DMルーム投稿ページに遷移する  
件名を入力し、始めるボタンをクリックするとDMルームに遷移する

### DM投稿機能
[![Image from Gyazo](https://i.gyazo.com/32101c25cb9b74fd0df52ccc27c96ce5.gif)](https://gyazo.com/32101c25cb9b74fd0df52ccc27c96ce5)

* DMルームのフォームから画像またはメッセージを入力し、送信ボタンから投稿することができる

### DM削除機能
[![Image from Gyazo](https://i.gyazo.com/31f636b2abd890b08cb446180a0f60db.gif)](https://gyazo.com/31f636b2abd890b08cb446180a0f60db)

* DMルーム内のルームを閉じるボタンをクリックするとDMが削除される

### DM一覧機能
[![Image from Gyazo](https://i.gyazo.com/8443806c3fd74b58d1478a2e72bc03ac.gif)](https://gyazo.com/8443806c3fd74b58d1478a2e72bc03ac)

* ユーザーのマイページからDMルームの一覧確認できる  
一覧表示されたDMの件名からDMルームに遷移できる

## 検索機能
[![Image from Gyazo](https://i.gyazo.com/d134436830cd785ff5186b659c93236f.gif)](https://gyazo.com/d134436830cd785ff5186b659c93236f)

* トップページの検索フォームから検索したいチャットルーム名を入力すると、検索にヒットしたチャットルーム名が表示される

* 検索結果から表示されたチャットルームをクリックするとチャットルーム詳細ページに遷移する

## フォロー機能
[![Image from Gyazo](https://i.gyazo.com/4e01832f01fe649d3bab00f3f63b6002.gif)](https://gyazo.com/4e01832f01fe649d3bab00f3f63b6002)

### フォロー登録機能
* 他のユーザーマイページからフォローするをクリックするとフォロー登録できる

### フォロー、フォロワー　一覧機能
[![Image from Gyazo](https://i.gyazo.com/21d74868fd8659eeb145fa7d4ffbee0a.gif)](https://gyazo.com/21d74868fd8659eeb145fa7d4ffbee0a)

[![Image from Gyazo](https://i.gyazo.com/54153693baaa82f5fcd96644192a7a27.gif)](https://gyazo.com/54153693baaa82f5fcd96644192a7a27)

* フォロー登録したユーザーはフォロー、フォロワーカウントボックスから遷移でき、フォロー一覧ページにて確認できる

# 実装予定の機能
* データベースにチャット絵文字が保存できない状態なので、これを保存できるように実装中。
* チャットルームには自らが参加しないと参加出来ない為、ユーザーを招待できる機能を実装して参加できるようにしたいと考えている。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/cd82e35f87ff420cf46d4991cbadd736.png)](https://gyazo.com/cd82e35f87ff420cf46d4991cbadd736)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/6c8a77be07bb7389d52375c006aeecaa.png)](https://gyazo.com/6c8a77be07bb7389d52375c006aeecaa)

# 開発環境
* フロントエンド
* バックエンド
* インフラ
* テスト
* テキストエディタ
* タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/MAXIM-kn/shumitomo-app.git  
% cd xxxxxx  
% bundle install  
% yarn install

# 工夫したポイント
* 投稿されたチャットルームをカテゴリー別に表示できるようにした
ユーザーがカテゴリー毎に興味のあるチャットルームを探しやすい、見やすいレイアウトにする為に、大きく1列3つまでの表示にすることにしたこと

* ユーザーの投稿したチャットルームがどれくらい注目されているか分かりやすいように、いいね機能を実装して分かりやすく可視化したこと

* チャットルーム内でどのユーザーが参加しているかユーザーリストを表示させたこと

* 気になったチャットルームの参加を保留状態に出来るようにブックマーク機能を実装して、後から同じチャットルームを再度探すという手間がないようにしたこと

* マイページでユーザーへ通知が来ている事を知らせる為に、未確認の通知件数を表示できるようにしたこと