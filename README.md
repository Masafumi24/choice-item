
# README

# Choice Item


## アプリ概要
毎日の服選びをもっと楽しく、そしてスムーズにするためにはどうすればいいか。それをテーマにこのアプリケーションを作成しました。  
それぞれのユーザーが自身の持っているアイテム（服、靴、小物、等）を画像とともに投稿してもらいます。そして出かける前の準備の際にアプリの中の「Random」ボタンを押せば、その中で季節ごとに投稿されたものをランダムに選び出してチョイスしてくれます。
全身コーデを投稿する機能も後々実装したいと考えていますがそれだけでは、持っているアイテムを最大限楽しめない、組み合わせの幅が広がらないと考え、まずは季節ごとにアイテムをチョイスしその無作為に選ばれた一つからコーディネートを組み立てて欲しい。そう考え制作しました。


## 本番環境URL
http://52.199.86.45/


## 主な機能

### ユーザー登録機能
○新規登録  
・アイコン画像登録可、JavaScriptを用いたプレビュー表示  
○ログイン  
○ログアウト  
○ユーザー情報編集

### 投稿機能
○画像複数枚投稿  
・投稿画像の圧縮、JPG変換、JavaScriptを用いたプレビュー機能（HEIC HEIF非対応）  
○多階層カテゴリー機能  
・Ruby on Railsのgem「ancestry」を用いた実装。JavaScript使用  
○季節を保存するためのチェックボックス （複数選択可）  

### ランダムチョイス機能  
○季節ごとに投稿された自身のアイテムの中からチョイスする機能  
・画像表示→「OK」ボタンを押したのちに再度押すともう一度ランダムでチョイス。


## 制作背景
個人アプリとしてデプロイしたものとしては2つ目になります。  
前回は「heroku」を用いたデプロイ、今回はAWSを用いてデプロイしました。  
前回よりもスタイリッシュなビューにしたいと考え、色使い等もなるべく画像の邪魔をしないビューになるよう心がけました。  
TECH::CAMPというプログラミングスクールを卒業し最終課題の経験も経てサーバーサイドにも工夫を凝らしたアプリケーションになりました。


## 工夫したポイント
前回のアプリケーションはリファクタリング、そして画像の扱いなど、パフォーマンスを気にしたコーディングとは無縁のコードになっていました。  
その反省も踏まえ、機能を実装するたびにログを確認しSQL文の発行回数が必要以上に多くなっていないかなどを監視しながら制作を進めていきました。  
CSSに関してもmixinなどを積極的に使いできるだけ助長な記述を減らすよう心がけました。しかしながらビューに関してはまだまだ助長な部分はあるのでブラッシュアップは必須です。  
あとはセキュリティ面です。今回のアプリは実際に自身はもちろん友人やオシャレが好きな方々にも使っていただきたいと考えているアプリケーションが故にURLの直打ち防止、ログインしていないユーザーの行動制限なども盛り込み安全に安心に使用していただけるアプリケーションにしました。

## 今後について
昨日の追加実装といたしましては  
・コメント機能の実装  
・コーディネート投稿機能の実装（ランダム、季節）  
・ユーザーマイページをオープンに  
機能実装はもちろんのこと各所リファクタリング、あとはコードの振る舞いをもっとふさわしくしていきます。現在だとデータベースにまつわるやりとりをほとんどコントローラに書いてしまっています。そこを改善しモデルにメソッドなどを定義して、サーバーサイドの知識を深めていければと考えています。

